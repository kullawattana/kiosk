import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/router/live_chat_routes_name.dart';
import 'package:kiosk/jayne/view/chatbot/login_page.dart';

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

class GoRouterObserver extends NavigatorObserver {
  GoRouterObserver();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('PUSHED SCREEN: ${route.settings.arguments}'); //name comes back null
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
        child: const LoginPage(),
        arguments: state.extra,
      );
    },
    routes: [
      //TODO Create route
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
