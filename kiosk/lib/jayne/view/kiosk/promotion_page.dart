import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kiosk/jayne/repository/service_provider.dart';
import 'package:kiosk/jayne/router/routes_name.dart';

class PromotionPage extends StatefulWidget {
  const PromotionPage({super.key});

  @override
  State<PromotionPage> createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
  int selectedIndex = 0; // 0 for "โปรโมชั่น", 1 for "ส่วนลด"

  bool isSelectRecommendTab = false;
  bool isSelectMobileTab = false;

  @override
  void initState() {
    isSelectRecommendTab = true;
    isSelectMobileTab = false;
    super.initState();
  }

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
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: isSelectRecommendTab ? Colors.black : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(
                              'jayne.product_recommend_page.recommend_tab'.tr(),
                              style: TextStyle(
                                fontSize: 18,
                                color: isSelectRecommendTab ? Colors.white : Colors.black,
                              ),
                            ),
                            onTap: () {
                              ServiceProvider().requestProduct(
                                userContent: '',
                                botContent: '',
                                inputText: 'แนะนำสินค้า',
                                minPrice: 1000,
                                maxPrice: 99999,
                                minDiscountPc: 0,
                                minDiscountValue: 0,
                                minPoint: 0,
                              );
                              setState(() {
                                isSelectRecommendTab = true;
                                isSelectMobileTab = false;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: isSelectMobileTab ? Colors.black : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(
                              'jayne.product_recommend_page.mobile_tab'.tr(),
                              style: TextStyle(
                                fontSize: 18,
                                color: isSelectMobileTab ? Colors.white : Colors.black,
                              ),
                            ),
                            onTap: () {
                              ServiceProvider().requestProduct(
                                userContent: '',
                                botContent: '',
                                inputText: 'มือถือ',
                                minPrice: 1000,
                                maxPrice: 99999,
                                minDiscountPc: 0,
                                minDiscountValue: 0,
                                minPoint: 0,
                              );
                              setState(() {
                                isSelectRecommendTab = false;
                                isSelectMobileTab = true;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
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
