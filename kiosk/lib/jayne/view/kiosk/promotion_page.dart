import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kiosk/jayne/router/routes_name.dart';

class PromotionPage extends StatefulWidget {
  const PromotionPage({super.key});

  @override
  State<PromotionPage> createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
  int selectedIndex = 0; // 0 for "โปรโมชั่น", 1 for "ส่วนลด"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        //jayne.promotion_page.app_bar
        title: ResponsiveText(
          content: "jayne.promotion_page.app_bar".tr(),
          textStyle: JTextTheme.highlightHeader,
        ),
      ),
      body: Column(
        children: [
          // Sidebar and main content
          Expanded(
            child: Row(
              children: [
                // Sidebar
                NavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  // Show all labels
                  labelType: NavigationRailLabelType.all,
                  selectedLabelTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  destinations: [
                    NavigationRailDestination(
                      icon: const SizedBox.shrink(), // You can replace this with actual icons if needed
                      label: ResponsiveText(
                        content: "jayne.promotion_page.promotion_tab".tr(),
                        textStyle: JTextTheme.captionMedium,
                      )
                    ),
                    NavigationRailDestination(
                      icon: const SizedBox.shrink(), // You can replace this with actual icons if needed
                      label: ResponsiveText(
                        content: "jayne.promotion_page.discount_tab".tr(),
                        textStyle: JTextTheme.captionMedium,
                      ),
                    ),
                  ],
                  selectedIconTheme: const IconThemeData(color: Colors.black),
                  unselectedLabelTextStyle: const TextStyle(color: Colors.black),
                  unselectedIconTheme: const IconThemeData(color: Colors.grey),
                ),
                // Main content: Promotion or Discount content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedIndex == 0 ? "jayne.promotion_page.promotion_tab".tr() : "jayne.promotion_page.discount_tab".tr(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Placeholder for promotions or discounts
                        Expanded(
                          child: ListView.builder(
                            itemCount: 3, // Number of promotions/discounts
                            itemBuilder: (context, index) {
                              return Container(
                                height: 120,
                                margin: const EdgeInsets.only(bottom: 16),
                                color: Colors.grey[300], // Placeholder for the image
                                child: const Center(
                                  child: Icon(Icons.image, size: 60), // Image icon placeholder
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom Navigation
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO Go back action
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(150, 50),
                  ),
                  child: ResponsiveText(
                    content: "jayne.common.back".tr(),
                    textStyle: JTextTheme.captionMedium,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        // TODO Go to cart action
                      },
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: const Icon(Icons.smart_toy),
                      onPressed: () {
                        // TODO AI consultation action
                        context.pushNamed(RouteName.aiAssistantPage.name);
                      },
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
