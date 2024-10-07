import 'package:equatable/equatable.dart';

enum BottomNavigateBarStatus {
  init,
  processing,
  unableToProceed,
  cameraPermanentlyDenied,
  cameraNotGranted,
  goToQrPage,
}

class BottomNavigateBarState extends Equatable {
  final int currentBottomNavigationIndex;
  final int initBottomNavigationIndex;
  final String? errorCode;
  final BottomNavigateBarStatus? status;

  const BottomNavigateBarState({
    this.currentBottomNavigationIndex = 0,
    this.initBottomNavigationIndex = 0,
    this.errorCode,
    this.status,
  });

  BottomNavigateBarState copyWith({
    int? currentBottomNavigationIndex,
    int? initBottomNavigationIndex,
    String? errorCode,
    BottomNavigateBarStatus? status,
  }) {
    return BottomNavigateBarState(
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
