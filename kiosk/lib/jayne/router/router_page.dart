import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/router/routes_name.dart';
import 'package:kiosk/jayne/view/chatbot/chat_page.dart';
import 'package:kiosk/jayne/view/chatbot/login_page.dart';
import 'package:kiosk/jayne/view/chatbot/register_page.dart';
import 'package:kiosk/jayne/view/chatbot/welcome_chatbot_page.dart';
import 'package:kiosk/jayne/view/kiosk/ai_assistant_page.dart';
import 'package:kiosk/jayne/view/kiosk/face_verification_page.dart';
import 'package:kiosk/jayne/view/kiosk/home_page.dart';
import 'package:kiosk/jayne/view/kiosk/product_information_page.dart';
import 'package:kiosk/jayne/view/kiosk/product_search_page.dart';
import 'package:kiosk/jayne/view/kiosk/promotion_page.dart';
import 'package:kiosk/jayne/view/kiosk/shopping_cart_page.dart';
import 'package:kiosk/jayne/view/kiosk/thank_you_page.dart';
import 'package:kiosk/jayne/view/kiosk/verification_success_page.dart';
import 'package:kiosk/jayne/view/kiosk/welcome_kiosk_page.dart';

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
        //TODO Route
        //routes: chatBotRoutes,
        routes: kioskRoutes,
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
  //Chatbot
  // 1. welcome -> splashScreenPage,
  // 2. loginPage - facebookSignIn, googleSignIn
  // 3. registerPage,
  // 4. chatInstructionPage,
  // 5. chatPage,
  GoRoute(
    name: RouteName.welcomeChatBotPage.name,
    path: '/',
    pageBuilder: (context, state) {
      return buildPage(
        context: context,
        key: state.pageKey,
        child: const WelcomeChatBotPage(),
        arguments: state.extra,
      );
    },
    routes: [
      GoRoute(
        name: RouteName.loginPage.name,
        path: 'login',
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
        path: 'register',
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
        name: RouteName.chatPage.name,
        path: 'chat',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const ChatPage(),
            arguments: state.extra,
          );
        },
      ),
    ],
  ),
];

final kioskRoutes = [
  //Kiosk
  // 1. homePage,
  // 2. productSearchPage,
  // 3. productInformationPage,
  // 4. promotionPage,
  // 5. faceVerificationPage (for shopping cart),
  // 6. verificationSuccessPage (for shopping cart),
  // 7. shoppingCartPage,
  // 8. aiAssistantPage (ai chatbot),
  // 9. thankYouPage,

  GoRoute(
    name: RouteName.welcomeKioskPage.name,
    path: '/',
    pageBuilder: (context, state) {
      return buildPage(
        context: context,
        key: state.pageKey,
        child: const WelcomeKioskPage(),
        arguments: state.extra,
      );
    },
    routes: [
      GoRoute(
        name: RouteName.homePage.name,
        path: 'home',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const HomePage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.productSearchPage.name,
        path: 'product_search',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const ProductSearchPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.productInformationPage.name,
        path: 'product_information',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const ProductInformationPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.promotionPage.name,
        path: 'promotion',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const PromotionPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.faceVerificationPage.name,
        path: 'face_verification',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const FaceVerificationPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.verificationSuccessPage.name,
        path: 'verification_success',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const VerificationSuccessPage(userName: "Suttipong"),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.shoppingCartPage.name,
        path: 'shopping_cart',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const ShoppingCartPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.aiAssistantPage.name,
        path: 'ai_assistant',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const AIAssistantPage(),
            arguments: state.extra,
          );
        },
      ),
      GoRoute(
        name: RouteName.thankYouPage.name,
        path: 'thank_you',
        pageBuilder: (context, state) {
          return buildPage(
            context: context,
            key: state.pageKey,
            child: const ThankYouPage(),
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
