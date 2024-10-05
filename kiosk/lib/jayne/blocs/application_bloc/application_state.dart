import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:kiosk/jayne/common/app_styles.dart';

enum ApplicationStatus {
  init,
}
class ApplicationState extends Equatable {
  final ConnectivityResult connectionType;
  final ApplicationStatus status;
  final bool toggleLoading;
  final double keyboardHeight;
  final double screenWidth;
  final double screenHeight;
  final String? currentSelectLocale;
  final bool physicalDevice;
  final List<String> loadingKeys;

  bool get isScreenSizeS => screenWidth <= screenSizeS;
  bool get isScreenSizeM => screenWidth > screenSizeS && screenWidth < screenSizeL;
  bool get isScreenSizeL => screenWidth >= screenSizeL;
  double get responsiveImageRatio => isScreenSizeL ? imageRatioL : 1;

  const ApplicationState({
    this.connectionType = ConnectivityResult.none,
    this.status = ApplicationStatus.init,
    this.toggleLoading = false,
    this.keyboardHeight = 0,
    this.screenWidth = 0,
    this.screenHeight = 0,
    this.physicalDevice = false,
    this.currentSelectLocale,
    this.loadingKeys = const [],
  });

  ApplicationState copyWith({
    ConnectivityResult? connectionType,
    ApplicationStatus? status,
    bool? toggleLoading,
    double? keyboardHeight,
    double? screenWidth,
    double? screenHeight,
    bool? physicalDevice,
    String? customerNumber,
    String? mobileNumber,
    String? currentSelectLocale,
    List<String>? loadingKeys,
  }) {
    return ApplicationState(
      connectionType: connectionType ?? this.connectionType,
      status: status ?? this.status,
      toggleLoading: toggleLoading ?? this.toggleLoading,
      screenWidth: screenWidth ?? this.screenWidth,
      screenHeight: screenHeight ?? this.screenHeight,
      physicalDevice: physicalDevice ?? this.physicalDevice,
      keyboardHeight: keyboardHeight ?? this.keyboardHeight,
      currentSelectLocale: currentSelectLocale ?? this.currentSelectLocale,
      loadingKeys: loadingKeys ?? this.loadingKeys,
    );
  }

  @override
  List<Object?> get props => [
        connectionType,
        status,
        toggleLoading,
        keyboardHeight,
        screenWidth,
        screenHeight,
        physicalDevice,
        currentSelectLocale,
        loadingKeys,
      ];
}
