part of 'app_bloc.dart';

/// [AppEvent] is the base class for all events related to the application.
sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

/// [ChangeAppThemeEvent] is an event to change the application's theme mode.
class ChangeAppThemeEvent extends AppEvent {
  final ThemeMode themeMode;

  const ChangeAppThemeEvent({required this.themeMode});

  @override
  List<Object?> get props => [themeMode];
}
