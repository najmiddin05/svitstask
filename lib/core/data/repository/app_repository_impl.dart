import 'package:flutter/material.dart';
import 'package:svitstask/config/constants/app_keys.dart';
import 'package:svitstask/core/data/data_source/local/local_data_source.dart';
import 'package:svitstask/core/domain/repository/app_repository.dart';

/// [AppRepositoryImpl] is an implementation of [AppRepository]
/// that manages the application's theme mode using a local data source.
class AppRepositoryImpl extends AppRepository {
  final LocalDataSource localDS;

  const AppRepositoryImpl({required this.localDS});

  /// Changes the application's theme mode and stores it in the local data source.
  ///
  /// [themeMode]: The new theme mode to be set.
  ///
  /// Returns a [Future] that completes with `true` if the theme was successfully changed,
  /// and `false` otherwise.
  @override
  Future<bool> changeAppTheme({required ThemeMode themeMode}) async {
    try {
      await localDS.store(StorageKey.theme, themeMode.name);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Retrieves the current theme mode from the local data source.
  ///
  /// Returns the current [ThemeMode].
  @override
  ThemeMode get theme {
    final String? theme = localDS.read(StorageKey.theme);
    if (theme != null) {
      return AppConvertor.stringToThemeMode(theme);
    }
    return ThemeMode.system;
  }
}

/// [AppConvertor] is a utility class that provides methods to convert
/// between strings and [ThemeMode] values.
class AppConvertor {
  /// Converts a string value to a [ThemeMode].
  ///
  /// [value]: The string value to be converted.
  ///
  /// Returns the corresponding [ThemeMode].
  static ThemeMode stringToThemeMode(String value) {
    if (value == ThemeMode.light.name) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }
}
