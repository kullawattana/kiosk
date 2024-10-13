import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/router/routes_name.dart';
import 'package:kiosk/jayne/view/chatbot/login_page.dart';
import 'package:kiosk/jayne/view/chatbot/register_page.dart';
import 'package:kiosk/jayne/view/kiosk/cart_page.dart';
import 'package:kiosk/jayne/view/kiosk/home_page.dart';

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
        routes: chatBotRoutes,
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

class GoRouterObserver extends NavigatorObserver {
  GoRouterObserver();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('PUSHED SCREEN: ${route.settings.arguments}'); //name comes back null
  }
}

final chatBotRoutes = [
  GoRoute(
    name: RouteName.splashScreenPage.name,
    path: '/',
    pageBuilder: (context, state) {
      return buildPage(
        context: context,
        key: state.pageKey,
        child: const LoginPage(),
        arguments: state.extra,
      );
    },
    routes: [
      GoRoute(
        name: RouteName.loginPage.name,
        path: 'login_page',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const LoginPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.registerPage.name,
        path: 'register_page',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const RegisterPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.chatInstructionPage.name,
        path: 'chat_instruction_page',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const RegisterPage(),
            arguments: state.extra,
          );
        },
      ),
    ],
  ),
];

final kioskRoutes = [
  GoRoute(
    name: RouteName.homePage.name,
    path: '/',
    pageBuilder: (context, state) {
      return buildPage(
        context: context,
        key: state.pageKey,
        child: const HomePage(),
        arguments: state.extra,
      );
    },
    routes: [
      GoRoute(
        name: RouteName.cartPage.name,
        path: 'cart_page',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const CartPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.productIndividualPage.name,
        path: 'product_individual_page',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const RegisterPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.productRecommendPage.name,
        path: 'product_recommend_page',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const RegisterPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.productFilterPage.name,
        path: 'product_filter_page',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const RegisterPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.promotionPage.name,
        path: 'promotion_page',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const RegisterPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.aiAssistantPage.name,
        path: 'ai_assistant_page',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const RegisterPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.aiAssistantChatPage.name,
        path: 'ai_assistant_chat_page',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const RegisterPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.aiAssistantTapToSpeakPage.name,
        path: 'ai_assistant_tap_to_speak_page',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const RegisterPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.aiAssistantChatPage.name,
        path: 'ai_assistant_chat_page',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const RegisterPage(),
            arguments: state.extra,
          );
        },
      ),
    ],
  ),
];

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
