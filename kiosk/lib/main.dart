import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/blocs/application_bloc/application_cubit.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/enhances/condition.dart';
import 'package:kiosk/jayne/language/th_custom_intl.dart';
import 'package:kiosk/jayne/router/router_page.dart';
import 'package:kiosk/jayne/language/language_handler.dart';
import 'package:kiosk/jayne/jayne_getit_dependencies.dart';
import 'package:kiosk/jayne/secure_storage/secure_storage_service.dart';
import 'package:kiosk/jayne/view/chatbot/splash_screen_page.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

const supportedLocales = [Locale("en"), Locale("th")];

abstract class BlocInjector {
  injectBlocs(InjectBloc inject);
}

abstract class JayneMultiDependencies extends JayneSystem {
  final List<JayneSystem> systems;

  JayneMultiDependencies({
    required this.systems,
  });

  @override
  void setContext(JayneSystemContext context) {
    super.setContext(context);
    for (final system in systems) {
      system.setContext(context);
    }
  }

  @override
  Future<void> createDependencies(JayneGetItDependencies dependencies) async {
    for (final system in systems) {
      await system.createDependencies(dependencies);
    }
  }
}

main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
    runApp(
      MultiProvider(
        providers: const [],
        child: MaterialApp(
          builder: (context, child) {
            return JayneApp(
              context: context,
            );
          },
        ),
      ),
    );
  }, (error, stack) => {});
}

class JayneApp extends JayneRootApp {
  final BuildContext context;

  JayneApp({
    super.key,
    required this.context,
    Map<String, dynamic> args = const {},
  }) : super(
          view: () => JayneMainApp(context: context),
          loading: () => const SplashScreenPage(),
          system: () => JayneMainSystem(),
          blocInjector: JayneBlocInjector(),
          localization: JayneLocalization(),
          args: () => args,
        );
}

class JayneMainApp extends StatefulWidget {
  final BuildContext context;

  const JayneMainApp({
    super.key,
    required this.context,
  });

  @override
  State<JayneMainApp> createState() => _JayneMainAppState();
}

class JayneMainSystem extends JayneMultiDependencies {
  JayneMainSystem()
      : super(
          systems: [
            JayneStorageLanguageSystem(),
            JayneTranslationSystem(),
          ],
        );
}

class JayneStorageLanguageSystem extends JayneSystem {
  @override
  Future<void> createDependencies(JayneGetItDependencies dependencies) async {
    dependencies.add<SecureStorageLanguageService>(SecureStorageLanguageService());
  }
}

class JayneTranslationSystem extends JayneSystem {
  @override
  Future<void> createDependencies(JayneGetItDependencies dependencies) async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}

class JayneBlocInjector extends BlocInjector {
  @override
  injectBlocs(InjectBloc inject) {
    inject(ApplicationCubit());
  }
}

class ApplicationMixin {
  final application = JayneGetItDependencies.of<ApplicationCubit>();
}

class JayneLocalization extends JayneLocalizationConfig {
  JayneLocalization()
      : super(
          supportedLocales: supportedLocales,
          assetLoader: JayneAssetLoader(),
        );

  @override
  Future<void> start() async {
    for (final locale in supportedLocales) {
      await loadTranslation(locale);
    }
  }
}

class JayneAssetLoader extends AssetLoader {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    final translationsMap = json.decode(await readLanguageJson(locale));
    return translationsMap;
  }
}

class _JayneMainAppState extends State<JayneMainApp> {
  late GoRouter _goRouter;

  @override
  void initState() {
    super.initState();
    _goRouter = LiveChatMainRoutes().init(context).router;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: initializeLocale(context),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return MaterialApp.router(
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(
                boldText: false,
                textScaler: const TextScaler.linear(1.0),
              ),
              child: child ?? const SizedBox.shrink(),
            ),
            routerConfig: _goRouter,
          );
        }
        return MaterialApp.router(
          title: 'Jayne',
          localizationsDelegates: [
            ...context.localizationDelegates,
            ThBudhaMaterialLocalizations.delegate,
          ],
          supportedLocales: [
            ...context.supportedLocales,
            const Locale('thBudha'),
          ],
          locale: context.locale,
          theme: defaultThemeData,
          routerConfig: _goRouter,
        );
      },
    );
  }
}

class JayneRootApp extends StatefulWidget {
  final Widget Function() view;
  final Widget Function() loading;
  final JayneSystem Function() system;
  final BlocInjector blocInjector;
  final JayneLocalizationConfig localization;
  final Map<String, dynamic> Function()? args;

  const JayneRootApp({
    super.key,
    required this.view,
    required this.loading,
    required this.system,
    required this.blocInjector,
    required this.localization,
    this.args,
  });

  @override
  _JayneRootAppState createState() => _JayneRootAppState();
}

class _JayneRootAppState extends State<JayneRootApp> {
  bool readyToBuild = false;
  final List<BlocProvider> providers = [];
  final JayneGetItDependencies dependencies = JayneGetItDependencies();
  late JayneSystemContext systemContext;

  @override
  void initState() {
    super.initState();
    startDependencies();
  }

  Future<void> startDependencies() async {
    systemContext = JayneSystemContext(
      system: widget.system(),
      dependencies: dependencies,
    );
    await systemContext.start();
    widget.blocInjector.injectBlocs(<T extends BlocBase>(
      T bloc, {
      bool lazy = false,
    }) {
      // register blocs to system dependencies
      dependencies.add<T>(bloc, lazy: lazy);
      providers.add(BlocProvider<T>.value(value: bloc));
    });
    await widget.localization.start();
    setState(() {
      readyToBuild = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Condition(
      condition: readyToBuild,
      builder: (BuildContext context) {
        return EasyLocalization(
          supportedLocales: widget.localization.supportedLocales,
          path: "translations",
          fallbackLocale: widget.localization.supportedLocales.first,
          assetLoader: widget.localization.assetLoader,
          child: MultiBlocProvider(
            providers: providers,
            child: widget.view(),
          ),
        );
      },
      //for waiting load
      fallback: (_) => widget.loading(),
    );
  }
}
