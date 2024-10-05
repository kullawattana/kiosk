import 'package:equatable/equatable.dart';

enum AppBottomNavigateBarStatus {
  init,
  processing,
  unableToProceed,
  cameraPermanentlyDenied,
  cameraNotGranted,
  goToQrPage,
}

class AppBottomNavigateBarState extends Equatable {
  final int currentBottomNavigationIndex;
  final int initBottomNavigationIndex;
  final String? errorCode;
  final AppBottomNavigateBarStatus? status;

  const AppBottomNavigateBarState({
    this.currentBottomNavigationIndex = 0,
    this.initBottomNavigationIndex = 0,
    this.errorCode,
    this.status,
  });

  AppBottomNavigateBarState copyWith({
    int? currentBottomNavigationIndex,
    int? initBottomNavigationIndex,
    String? errorCode,
    AppBottomNavigateBarStatus? status,
  }) {
    return AppBottomNavigateBarState(
      currentBottomNavigationIndex: currentBottomNavigationIndex ?? this.currentBottomNavigationIndex,
      initBottomNavigationIndex: initBottomNavigationIndex ?? this.initBottomNavigationIndex,
      errorCode: errorCode ?? this.errorCode,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        currentBottomNavigationIndex,
        initBottomNavigationIndex,
        errorCode,
        status,
      ];
}
