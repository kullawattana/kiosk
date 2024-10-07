import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk/jayne/blocs/bottom_navigate_bar_bloc/bottom_navigate_bar_state.dart';

class BottomNavigateBarCubit extends Cubit<BottomNavigateBarState> {
  BottomNavigateBarCubit() : super(const BottomNavigateBarState());

  init({required int bottomNavigationIndex}) {
    emit(state.copyWith(
      initBottomNavigationIndex: bottomNavigationIndex,
      currentBottomNavigationIndex: bottomNavigationIndex,
      status: BottomNavigateBarStatus.init,
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
    emit(state.copyWith(status: BottomNavigateBarStatus.processing));
    emit(state.copyWith(status: BottomNavigateBarStatus.init));
  }
}
