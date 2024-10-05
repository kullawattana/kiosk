import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk/jayne/blocs/app_bottom_navigate_bar_bloc/main_bottom_navigate_bar_state.dart';

class AppBottomNavigateBarCubit extends Cubit<AppBottomNavigateBarState> {
  AppBottomNavigateBarCubit() : super(const AppBottomNavigateBarState());

  init({required int bottomNavigationIndex}) {
    emit(state.copyWith(
      initBottomNavigationIndex: bottomNavigationIndex,
      currentBottomNavigationIndex: bottomNavigationIndex,
      status: AppBottomNavigateBarStatus.init,
    ));
  }

  Future<void> changeBottomNavigationIndex(int index, String pageName) async {
    // await application.loadingEffect(() async {
    //   emit(state.copyWith(
    //     status: AppBottomNavigateBarStatus.processing,
    //   ));
    //   if (index == 0) {
    //     //TODO
    //   } else if (index == 1) {
    //     //TODO
    //   } else if (index == 2) {
    //     //TODO
    //   } else {
    //     //TODO
    //   }
    // });
  }

  resetBottomNavigationIndex() {
    emit(state.copyWith(
      currentBottomNavigationIndex: state.initBottomNavigationIndex,
    ));
  }

  rebuild() {
    emit(state.copyWith(status: AppBottomNavigateBarStatus.processing));
    emit(state.copyWith(status: AppBottomNavigateBarStatus.init));
  }
}
