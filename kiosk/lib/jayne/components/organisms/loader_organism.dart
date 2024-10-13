import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk/jayne/blocs/application_bloc/application_cubit.dart';
import 'package:kiosk/jayne/blocs/application_bloc/application_state.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/enhances/condition.dart';

class CircularProgress extends StatelessWidget {
  final Widget child;

  const CircularProgress({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationCubit, ApplicationState>(
      buildWhen: (prev, current) => prev.toggleLoading != current.toggleLoading,
      builder: (BuildContext context, state) {
        return Stack(
          children: <Widget>[
            child,
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
    );
  }
}
