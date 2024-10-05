import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk/jayne/blocs/application_bloc/application_cubit.dart';
import 'package:kiosk/jayne/blocs/application_bloc/application_state.dart';
import 'package:kiosk/jayne/common/default_theme_color.dart';
import 'package:kiosk/jayne/common/theme_data.dart';
import 'package:kiosk/jayne/components/atoms/button.dart';
import 'package:kiosk/jayne/enhances/condition.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:kiosk/jayne/enhances/widget_spacer.dart';

class WelcomeStartChatPage extends StatefulWidget {
  const WelcomeStartChatPage({super.key});

  @override
  State<WelcomeStartChatPage> createState() => _WelcomeStartChatPageState();
}

class _WelcomeStartChatPageState extends State<WelcomeStartChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.neutral.white,
      body: BlocBuilder<ApplicationCubit, ApplicationState>(
        buildWhen: (prev, current) => prev.toggleLoading != current.toggleLoading,
        builder: (BuildContext context, state) {
          return Stack(
            children: <Widget>[
              Column(
                children: [
                  const ResponsiveImage(
                    'assets/images/jaymart.png',
                    key: Key("jaymart_logo"),
                    assetType: AssetType.image,
                    baseWidth: 400,
                    baseHeight: 366,
                  ),
                  const WidgetSpacer(),
                  ResponsiveText(
                    content: "Welcome to",
                    textStyle: JTextTheme.body1.copyWith(
                      color: agentNameJoinedChatTextColor,
                    ),
                  ),
                  const WidgetSpacer(),
                  ResponsiveText(
                    content: "Nong Jayne",
                    textStyle: JTextTheme.body1.copyWith(
                      color: agentNameJoinedChatTextColor,
                    ),
                  ),
                  const WidgetSpacer(),
                  ResponsiveText(
                    content: "Start chatting with Chatty AI now.",
                    textStyle: JTextTheme.body1.copyWith(
                      color: agentNameJoinedChatTextColor,
                    ),
                  ),
                  ResponsiveText(
                    content: "You can ask me anything.",
                    textStyle: JTextTheme.body1.copyWith(
                      color: agentNameJoinedChatTextColor,
                    ),
                  ),
                  Button(
                    label: "Start Chat",
                    action: () => {},
                  ),
                ],
              ),
              Condition(
                condition: state.toggleLoading,
                builder: (_) => Scaffold(
                  backgroundColor: ColorTheme.neutral.black.withOpacity(0.5),
                  body: Center(
                    child: CircularProgressIndicator(
                      key: const Key("application_loader"),
                      color: ColorTheme.primary.red,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      //TODO AppBottomNavigateBar
      //   bottomNavigationBar: BlocBuilder<AppBottomNavigateBarCubit, AppBottomNavigateBarState>(
      // buildWhen: (prevState, curState) =>
      // prevState.currentBottomNavigationIndex != curState.currentBottomNavigationIndex //
      //     ||
      //     prevState.status != curState.status,
      // builder: (context, state) {
      //   return MainBottomNavigationBarMolecule(
      //     index: state.currentBottomNavigationIndex,
      //     onTap: (index) async {
      //       if (state.currentBottomNavigationIndex != index) {
      //         switch (index) {
      //           case 0:
      //             context.goNamed(
      //               RouteName.page1.name,
      //             );
      //             break;
      //           case 1:
      //             context.goNamed(
      //               RouteName.page1.name,
      //             );
      //             break;
      //           case 2:
      //             context.goNamed(
      //               RouteName.page2.name,
      //             );
      //             break;
      //           case 3:
      //             context.goNamed(
      //               RouteName.page3.name,
      //             );
      //             break;
      //           default:
      //             break;
      //         }
      //       }
      //       mainBottomCubit.changeBottomNavigationIndex(index, widget.pageName);
      //     },
      //   );
      // },
      // ),
    );
  }
}
