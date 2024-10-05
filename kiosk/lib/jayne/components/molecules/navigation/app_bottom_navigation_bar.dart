import 'package:flutter/material.dart';
import 'package:kiosk/jayne/common/app_styles.dart';
import 'package:kiosk/jayne/common/theme_data.dart';
import 'package:kiosk/jayne/enhances/responsive_element_functions.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:easy_localization/easy_localization.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int index;
  final Function(int)? onTap;

  const AppBottomNavigationBar({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: ColorTheme.neutral.grey,
            blurRadius: 20,
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: ColorTheme.primary.red,
        selectedLabelStyle: calculateFontSize(MediaQuery.of(context).size.width, JTextTheme.bottomNavigationText),
        unselectedLabelStyle: calculateFontSize(MediaQuery.of(context).size.width, JTextTheme.bottomNavigationText),
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        key: const Key('app_bottom_navigation_bar'),
        items: [
          BottomNavigationBarItem(
            icon: _navigationIcon(
              'assets/images/chat_inactive.svg',
              key: const Key('chat_icon'),
            ),
            activeIcon: _navigationIcon('assets/images/chat.svg'),
            label: 'chat'.tr(),
          ),
          BottomNavigationBarItem(
            icon: _navigationIcon(
              'assets/images/service_inactive.svg',
              key: const Key('service_icon'),
            ),
            activeIcon: _navigationIcon('assets/images/service.svg'),
            label: 'service'.tr(),
          ),
          BottomNavigationBarItem(
            icon: _navigationIcon(
              'assets/images/location_inactive.svg',
              key: const Key('location_icon'),
            ),
            activeIcon: _navigationIcon('assets/images/location.svg'),
            label: 'location'.tr(),
          ),
          BottomNavigationBarItem(
            icon: _navigationIcon(
              'assets/images/profile_inactive.svg',
              key: const Key('profile_icon'),
            ),
            activeIcon: _navigationIcon('assets/images/profile.svg'),
            label: 'profile'.tr(),
          ),
        ],
        currentIndex: widget.index,
        onTap: widget.onTap,
      ),
    );
  }

  Widget _navigationIcon(
    String assetPath, {
    Key? key,
    Color? color,
  }) {
    return ResponsiveImage(
      assetPath,
      assetType: AssetType.svg,
      baseHeight: spaceLarge,
      baseWidth: spaceLarge,
      key: key,
      color: color,
    );
  }
}
