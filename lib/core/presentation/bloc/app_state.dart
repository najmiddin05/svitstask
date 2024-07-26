part of 'app_bloc.dart';

/// [AppState] represents the state of the application, including the theme mode and status.
class AppState extends Equatable {
  const AppState({
    this.status = AppStatus.initial,
    this.message,
    required this.themeMode,
  });

  /// The current status of the application.
  final AppStatus status;

  /// An optional message related to the current state.
  final String? message;

  /// The current theme mode of the application.
  final ThemeMode themeMode;

  @override
  List<Object?> get props => [status, message, themeMode];

  /// Creates a copy of the current state with updated values.
  AppState copyWith({
    AppStatus? status,
    String? message,
    ThemeMode? themeMode,
  }) {
    return AppState(
      status: status ?? this.status,
      message: message ?? this.message,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

/// The possible statuses for the application state.
enum AppStatus {
  initial,
  loading,
  success,
  failure,
  successChangeTheme,
}
