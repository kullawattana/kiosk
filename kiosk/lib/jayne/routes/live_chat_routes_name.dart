enum RouteName {
  welcomeStartChatPage,
  welcomeLoginPage,
  splashScreenPage,
  queueServicePage,
  loginYourAccountPage,
  locationServicePage,
  createAccountPage,
  chatBotScreenPage,
  introductionChatPage,
  avatarChatPage,
}

extension RouteNameExtensions on RouteName {
  String get name {
    switch (this) {
      case RouteName.welcomeStartChatPage:
        return "welcome start chat page";
      case RouteName.welcomeLoginPage:
        return "welcome login page";
      case RouteName.splashScreenPage:
        return "splash screen page";
      case RouteName.queueServicePage:
        return "queue service page";
      case RouteName.loginYourAccountPage:
        return "login your account page";
      case RouteName.locationServicePage:
        return "location service page";
      case RouteName.introductionChatPage:
        return "introduction chat page";
      case RouteName.createAccountPage:
        return "create account page";
      case RouteName.chatBotScreenPage:
        return "chatbot screen page";
      case RouteName.avatarChatPage:
        return "avatar chat page";
      default:
        return "";
    }
  }
}
