import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:svitstask/core/domain/repository/app_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

/// [AppBloc] is a BLoC class that manages the state of the application.
/// It handles events related to changing the theme mode and updates the state accordingly.
class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository repository;

  AppBloc({required this.repository}) : super(AppState(themeMode: repository.theme)) {
    on<ChangeAppThemeEvent>(_changeAppTheme);
  }

  /// Handles the [ChangeAppThemeEvent] to change the application's theme mode.
  /// Emits states for loading, success, and failure.
  void _changeAppTheme(ChangeAppThemeEvent event, Emitter<AppState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));

    final response = await repository.changeAppTheme(themeMode: event.themeMode);
    if (response) {
      emit(state.copyWith(status: AppStatus.successChangeTheme, themeMode: event.themeMode));
    } else {
      emit(state.copyWith(status: AppStatus.failure));
    }
  }
}
