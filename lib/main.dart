import 'package:flutter/material.dart';
import 'package:svitstask/app.dart';
import 'package:svitstask/config/di/setup_locator.dart';

/// The entry point of the application.
/// It initializes the dependency injection setup and runs the [MyApp] widget.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}
