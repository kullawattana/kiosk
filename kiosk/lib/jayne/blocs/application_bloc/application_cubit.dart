import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kiosk/jayne/blocs/application_bloc/application_state.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(const ApplicationState());

  Future<void> getScreenSize(BuildContext context) async {
    emit(state.copyWith(
      screenWidth: MediaQuery.of(context).size.width,
      screenHeight: MediaQuery.of(context).size.height,
    ));
  }

  Future<R> loadingEffect<R>(
    bool isInitialLoading,
    Future<R> Function() effect, [
    String? effectKey,
    int delayTimeMilliseconds = 0,
  ]) async {
    try {
      emit(state.copyWith(
        loadingKeys: effectKey != null ? [...state.loadingKeys, effectKey] : state.loadingKeys,
        toggleLoading: true,
      ));
      return await effect();
    } finally {
      final loadingKeys = effectKey != null
          ? //
          [...state.loadingKeys..remove(effectKey)]
          : state.loadingKeys;

      emit(
        state.copyWith(
          loadingKeys: loadingKeys,
          toggleLoading: loadingKeys.isNotEmpty,
        ),
      );
    }
  }
}
