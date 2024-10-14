enum RouteName {
  //Chatbot
  welcomeChatBotPage,
  splashScreenPage,
  loginPage,
  facebookSignIn,
  googleSignIn,
  registerPage,
  chatInstructionPage,
  chatPage,
  //Kiosk
  kioskPage,
  homePage,
  productSearchPage,
  productInformationPage,
  promotionPage,
  faceVerificationPage,
  verificationSuccessPage,
  shoppingCartPage,
  aiAssistantPage,
  thankYouPage,
}

extension RouteNameExtensions on RouteName {
  String get name {
    switch (this) {
      //Chatbot
      case RouteName.welcomeChatBotPage:
        return "welcome chatBot page";
      case RouteName.splashScreenPage:
        return "splash screen page";
      case RouteName.loginPage:
        return "login page";
      case RouteName.facebookSignIn:
        return "facebook sign in page";
      case RouteName.googleSignIn:
        return "google sign in page";
      case RouteName.registerPage:
        return "register page";
      case RouteName.chatInstructionPage:
        return "chat instruction page";
      case RouteName.chatPage:
        return "chat page";
      //Kiosk
      case RouteName.kioskPage:
        return "kiosk page";
      case RouteName.homePage:
        return "home page";
      case RouteName.productSearchPage:
        return "product filter page";
      case RouteName.productInformationPage:
        return "product information page";
      case RouteName.promotionPage:
        return "promotion page";
      case RouteName.faceVerificationPage:
        return "face detection page";
      case RouteName.verificationSuccessPage:
        return "verification success page";
      case RouteName.shoppingCartPage:
        return "shopping cart page";
      case RouteName.aiAssistantPage:
        return "ai assistant page";
      case RouteName.thankYouPage:
        return "thank you page";
      default:
        return "";
    }
  }
}
