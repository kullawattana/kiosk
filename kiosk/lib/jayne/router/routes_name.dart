enum RouteName {
  //Chatbot
  chatInstructionPage,
  locationPage,
  loginPage,
  queueServicePage,
  registerPage,
  splashScreenPage,
  //Kiosk
  homePage,
  cartPage,
  productIndividualPage,
  productRecommendPage,
  productFilterPage,
  promotionPage,
  aiAssistantPage,
  aiAssistantChatPage,
  aiAssistantTapToSpeakPage,
  aiAssistantResponsePage,
  thankYouPage,
  verificationSuccessPage,

}

extension RouteNameExtensions on RouteName {
  String get name {
    switch (this) {
      case RouteName.chatInstructionPage:
        return "chat instruction page";
      case RouteName.locationPage:
        return "location page";
      case RouteName.loginPage:
        return "login page";
      case RouteName.queueServicePage:
        return "queue service page";
      case RouteName.registerPage:
        return "register page";
      case RouteName.splashScreenPage:
        return "splash screen page";
      case RouteName.homePage:
        return "home page";
      case RouteName.cartPage:
        return "cart page";
      case RouteName.productIndividualPage:
        return "product individual page";
      case RouteName.productRecommendPage:
        return "product recommend page";
      case RouteName.productFilterPage:
        return "product filter page";
      case RouteName.promotionPage:
        return "promotion page";
      case RouteName.aiAssistantPage:
        return "ai assistant page";
      case RouteName.aiAssistantChatPage:
        return "ai assistant chat page";
      case RouteName.aiAssistantTapToSpeakPage:
        return "ai assistant tap to speak page";
      case RouteName.aiAssistantResponsePage:
        return "ai assistant response page";
      case RouteName.thankYouPage:
        return "thank you page";
      case RouteName.verificationSuccessPage:
        return "verification success page";
      default:
        return "";
    }
  }
}
