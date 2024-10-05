import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/blocs/application_bloc/application_cubit.dart';
import 'package:kiosk/jayne/common/theme_data.dart';
import 'package:kiosk/jayne/enhances/condition.dart';
import 'package:kiosk/jayne/routes/live_chat_routes_name.dart';
import 'package:kiosk/jayne/secure_storage/secure_storage_service.dart';
import 'package:kiosk/jayne/view/chatbot/splash_screen_page.dart';
import 'package:kiosk/jayne/view/chatbot/welcome_start_chat_page.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
    runApp(
      MultiProvider(
        providers: [],
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

class JayneMainSystem extends JayneMultiSystem {
  JayneMainSystem()
      : super(
          systems: [
            JayneStorageLanguageSystem(),
            JayneTranslationLanguageSystem(),
          ],
        );
}

class JayneStorageLanguageSystem extends JayneSystem {
  @override
  Future<void> createDependencies(JayneGetItDependencies dependencies) async {
    dependencies.add<SecureStorageLanguageService>(SecureStorageLanguageService());
  }
}

class JayneTranslationLanguageSystem extends JayneSystem {
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

const supportedLocales = [Locale("en"), Locale("th")];

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

Future loadTranslation(Locale locale) async {
  final translationPath = dotenv.get('TRANSLATION_PATH');
  final storage = JayneGetItDependencies.of<SecureStorageLanguageService>();
  final Map<String, dynamic> metaDataInfos = jsonDecode(await rootBundle.loadString("$translationPath/metadata.json"));
  final fileLastModifiedDate = DateTime.parse(metaDataInfos[locale.languageCode]);
  await _loadTranslationFromFile(storage, fileLastModifiedDate, locale); //TODO
}

class JayneAssetLoader extends AssetLoader {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    final translationsMap = json.decode(await readTranslationsJson(locale)); //TODO
    return translationsMap;
  }
}

abstract class JayneMultiSystem extends JayneSystem {
  final List<JayneSystem> systems;

  JayneMultiSystem({
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
      future: initializeLocale(context), //TODO
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
          //TODO Fix
          // localizationsDelegates: [
          //   ...context.localizationDelegates,
          //   ThBudhaMaterialLocalizations.delegate,
          // ],
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

BuildContext? liveChatContext;
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class LiveChatMainRoutes {
  late final router = GoRouter(
    debugLogDiagnostics: true,
    observers: [GoRouterObserver()],
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return child;
        },
        routes: liveChatRoutes,
      )
    ],
    errorPageBuilder: (context, state) {
      return buildPage(
        context: context,
        key: state.pageKey,
        child: const SizedBox.shrink(),
        arguments: state.extra,
        disableBack: true,
      );
    },
  );

  LiveChatMainRoutes init(BuildContext? context) {
    liveChatContext = context;
    return this;
  }
}

final liveChatRoutes = [
  GoRoute(
    name: RouteName.welcomeStartChatPage.name,
    path: '/',
    pageBuilder: (context, state) {
      return buildPage(
        context: context,
        key: state.pageKey,
        child: const WelcomeStartChatPage(),
        arguments: state.extra,
      );
    },
    routes: [
      //TODO Create route
    ],
  ),
];

class GoRouterObserver extends NavigatorObserver {
  GoRouterObserver();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('PUSHED SCREEN: ${route.settings.arguments}'); //name comes back null
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

class JayneSystemContext {
  final JayneSystem system;
  final JayneGetItDependencies dependencies;

  JayneSystemContext({
    required this.system,
    required this.dependencies,
  });

  Future<void> start() async {
    system.setContext(this);
    await system.createDependencies(dependencies);
  }
}

abstract class JayneSystem {
  late JayneSystemContext _context;
  JayneGetItDependencies get dependencies => _context.dependencies;

  void setContext(JayneSystemContext context) {
    _context = context;
  }

  Future<void> createDependencies(JayneGetItDependencies dependencies);
}

class JayneGetItDependencies {
  void add<T extends Object>(
    T instance, {
    bool lazy = false,
  }) {
    if (lazy) {
      if (!GetIt.I.isRegistered<T>()) {
        GetIt.I.registerLazySingleton<T>(() => instance);
      }
    } else {
      if (!GetIt.I.isRegistered<T>()) {
        GetIt.I.registerSingleton<T>(instance);
      }
    }
  }

  static T of<T extends Object>() {
    return GetIt.I<T>();
  }
}

typedef InjectBloc = void Function<T extends BlocBase>(
  T bloc, {
  bool lazy,
});

abstract class BlocInjector {
  injectBlocs(InjectBloc inject);
}

abstract class JayneLocalizationConfig {
  final List<Locale> supportedLocales;
  final AssetLoader assetLoader;

  JayneLocalizationConfig({
    required this.supportedLocales,
    required this.assetLoader,
  });

  Future<void> start();
}

MaterialPage<void> buildPage({
  required BuildContext context,
  required Widget child,
  LocalKey? key,
  Object? arguments,
  bool disableBack = false,
}) {
  return MaterialPage<void>(
    key: key,
    child: disableBack ? _buildBlockerRouter(context, child) : child,
    arguments: arguments,
    fullscreenDialog: disableBack,
  );
}

Router _buildBlockerRouter(BuildContext context, Widget child) {
  BackButtonDispatcher dispatcher = Router.of(context).backButtonDispatcher!.createChildBackButtonDispatcher()..takePriority();
  return Router(
    routerDelegate: BackButtonBlockerDelegate(
      child: child,
    ),
    backButtonDispatcher: dispatcher,
  );
}

class BackButtonBlockerDelegate extends RouterDelegate with ChangeNotifier {
  final Widget child;
  BuildContext? context;

  BackButtonBlockerDelegate({required this.child});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return child;
  }

  @override
  Future<bool> popRoute() async {
    if (ModalRoute.of(context!)!.isCurrent) {
      return SynchronousFuture(true);
    }
    return SynchronousFuture(false);
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
