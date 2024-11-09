import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/blocs/application_bloc/application_cubit.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:kiosk/jayne/repository/service_provider.dart';
import 'package:kiosk/jayne/router/routes_name.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgUrls = [
      'https://static-jaymart.com/ecom/public/2YZHC6Q2CNSL1mVMfmbv3XW6zXV.jpg',
      'https://static-jaymart.com/ecom/public/2YZG2PavlzCwjRLCWlrresb673k.jpg',
      'https://static-jaymart.com/ecom/public/2lv1cM7Y8fsLb8hoW8hYnaw5gkI.jpg'
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 900.0,
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
                  const SizedBox(height: 50), // Space for the image if needed
                  const ResponsiveImage(
                    'assets/images/jaymart.png',
                    assetType: AssetType.image,
                    baseHeight: 300,
                    baseWidth: 300,
                    themeDirectory: "",
                    themeName: "",
                  ),
                  const SizedBox(height: 50),
                  ResponsiveText(
                    content: 'jayne.home_page_title'.tr(),
                    textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(), // Prevent GridView from scrolling independently
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        InkWell(
                          child: MenuItemWidget(
                            icon: 'assets/images/product.json',
                            label: 'jayne.home_page.product'.tr(),
                          ),
                          onTap: () {
                            ServiceProvider().requestProduct(
                              userContent: '',
                              botContent: '',
                              inputText: 'ขอข้อมูลมือถือ',
                              minPrice: 1000,
                              maxPrice: 99999,
                              minDiscountPc: 0,
                              minDiscountValue: 0,
                              minPoint: 0,
                            );
                            context.pushNamed(RouteName.productSearchPage.name);
                          },
                        ),
                        InkWell(
                          child: MenuItemWidget(
                            icon: 'assets/images/promotion.json',
                            label: 'jayne.home_page.promotion'.tr(),
                          ),
                          onTap: () {
                            ServiceProvider().requestProduct(
                              userContent: '',
                              botContent: '',
                              inputText: 'ขอข้อมูลโปรโมชัน',
                              minPrice: 1000,
                              maxPrice: 99999,
                              minDiscountPc: 0,
                              minDiscountValue: 0,
                              minPoint: 0,
                            );
                            context.pushNamed(RouteName.promotionPage.name);
                          },
                        ),
                        InkWell(
                          child: MenuItemWidget(
                            icon: 'assets/images/verification.json',
                            label: 'jayne.home_page.verification'.tr(),
                          ),
                          onTap: () {
                            context.pushNamed(RouteName.verificationSuccessPage.name);
                          },
                        ),
                        InkWell(
                          child: MenuItemWidget(
                            icon: 'assets/images/chatbot.json',
                            label: 'jayne.home_page.talk_with_janey'.tr(),
                          ),
                          onTap: () {
                            context.pushNamed(RouteName.aiAssistantPage.name);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // TODO Handle language change
                    context.read<ApplicationCubit>().changeLanguage('th');
                    context.read<ApplicationCubit>().changeLocale(context, const Locale('th'));
                  },
                  child: Image.asset(
                    'assets/images/th_flag.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    // TODO Handle language change
                    context.read<ApplicationCubit>().changeLanguage('en');
                    context.read<ApplicationCubit>().changeLocale(context, const Locale('en'));
                  },
                  child: Image.asset(
                    'assets/images/en_flag.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // TODO Handle staff call
                  launchUrlString("tel:0123456789");
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                ),
                child: ResponsiveText(
                  content: 'jayne.home_page.call_staff'.tr(),
                  textStyle: JTextTheme.title2.copyWith(
                    color: Colors.white,
                    fontFamily: "",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final String icon;
  final String label;

  const MenuItemWidget({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ResponsiveImage(
            icon,
            assetType: AssetType.animation,
            baseWidth: 500,
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
