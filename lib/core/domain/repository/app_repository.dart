import 'package:flutter/material.dart';

/// [AppRepository] is an abstract class that defines the contract
/// for changing and retrieving the application's theme mode.
abstract class AppRepository {
  const AppRepository();

  /// Changes the application's theme mode.
  ///
  /// [themeMode]: The new theme mode to be set.
  ///
  /// Returns a [Future] that completes with `true` if the theme was successfully changed,
  /// and `false` otherwise.
  Future<bool> changeAppTheme({required ThemeMode themeMode});

  /// Retrieves the current theme mode of the application.
  ///
  /// Returns the current [ThemeMode].
  ThemeMode get theme;
}
