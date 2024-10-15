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
    //context.read<ApplicationCubit>().changeLanguage(context.locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // Added SingleChildScrollView here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  const ResponsiveText(
                    content: 'One stop service for buying smartphone of jaymart shop.',
                    textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                            icon: Icons.phone_android,
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
                            icon: Icons.local_offer,
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
                            icon: Icons.person,
                            label: 'jayne.home_page.verification'.tr(),
                          ),
                          onTap: () {
                            context.pushNamed(RouteName.verificationSuccessPage.name);
                          },
                        ),
                        InkWell(
                          child: MenuItemWidget(
                            icon: Icons.smart_toy,
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
                  //textStyle: const TextStyle(color: Colors.white),
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
  final IconData icon;
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.black),
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
