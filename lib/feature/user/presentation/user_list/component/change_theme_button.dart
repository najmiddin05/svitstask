import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svitstask/config/constants/colors.dart';
import 'package:svitstask/config/constants/dimens.dart';

/// [ChangeThemeButton] is a stateless widget that represents a button to change the app theme.
/// It uses a [CupertinoButton] with an icon that changes based on the current theme mode.
class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({super.key, required this.themeMode, required this.onPressed});

  /// The current theme mode of the app.
  final ThemeMode themeMode;

  /// The callback function to be called when the button is pressed.
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Dimens.padding),
      child: CupertinoButton(
        onPressed: onPressed,
        child: Icon(
          themeMode == ThemeMode.dark ? CupertinoIcons.sun_max_fill : CupertinoIcons.moon_fill,
          color: themeMode == ThemeMode.dark ? AppColors.white : AppColors.black,
        ),
      ),
    );
  }
}
