import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
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
    final List<String> imgUrls = [
      'https://static-jaymart.com/ecom/public/2oEltwKzdM5Ru5IvPwfYkosBSeL.jpg',
      'https://static-jaymart.com/ecom/public/2mHemyeZSvNCLlnKlIIU6t397n1.jpg',
      'https://static-jaymart.com/ecom/public/2mHey5Kz0nLGlki3aGfQGrVVptt.jpg',
      'https://static-jaymart.com/ecom/public/2oFIcpmlz9nqyg4pzXQDXxNoZBy.jpg',
      'https://static-jaymart.com/ecom/public/2mm7LD85mCjlJcV9iymubD4bxsG.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Sidebar and main content
          Expanded(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 350.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.easeInOut, // Curve for smooth scrolling
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                  ),
                  items: imgUrls.map((url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          // Bottom Navigation
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 80,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            child: const ResponsiveImage(
                              'assets/images/shopping.json',
                              assetType: AssetType.animation,
                              baseWidth: 120,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            child: const ResponsiveImage(
                              'assets/images/chatbot.json',
                              assetType: AssetType.animation,
                              baseWidth: 120,
                            ),
                            onTap: () {
                              context.pushNamed(RouteName.aiAssistantPage.name);
                            },
                          ),
                        ],
                      ),
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
