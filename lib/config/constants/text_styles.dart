// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

/// [TextStyles] is a class that defines text style constants used in the application.
class TextStyles extends ThemeExtension<TextStyles> {
  final TextStyle plusJakartaSansSemiBold16;
  final TextStyle plusJakartaSansSemiBold18;
  final TextStyle plusJakartaSansMedium14;
  final TextStyle plusJakartaSansMedium16;

  const TextStyles({
    required this.plusJakartaSansMedium14,
    required this.plusJakartaSansMedium16,
    required this.plusJakartaSansSemiBold16,
    required this.plusJakartaSansSemiBold18,
  });

  /// A static instance of [TextStyles] with predefined text styles.
  static TextStyles textStyles = TextStyles(
    plusJakartaSansMedium14: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.jakarta.name,
    ),
    plusJakartaSansMedium16: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.jakarta.name,
    ),
    plusJakartaSansSemiBold16: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.jakarta.name,
    ),
    plusJakartaSansSemiBold18: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.jakarta.name,
    ),
  );

  @override
  TextStyles copyWith({
    TextStyle? plusJakartaSansSemiBold16,
    TextStyle? plusJakartaSansSemiBold18,
    TextStyle? plusJakartaSansMedium14,
    TextStyle? plusJakartaSansMedium16,
  }) {
    return TextStyles(
      plusJakartaSansSemiBold16: plusJakartaSansSemiBold16 ?? this.plusJakartaSansSemiBold16,
      plusJakartaSansSemiBold18: plusJakartaSansSemiBold18 ?? this.plusJakartaSansSemiBold18,
      plusJakartaSansMedium14: plusJakartaSansMedium14 ?? this.plusJakartaSansMedium14,
      plusJakartaSansMedium16: plusJakartaSansMedium16 ?? this.plusJakartaSansMedium16,
    );
  }

  @override
  ThemeExtension<TextStyles> lerp(covariant ThemeExtension<TextStyles>? other, double t) {
    if (other is! TextStyles) {
      return this;
    }

    return TextStyles(
      plusJakartaSansMedium14: TextStyle.lerp(plusJakartaSansMedium14, other.plusJakartaSansMedium14, t)!,
      plusJakartaSansMedium16: TextStyle.lerp(plusJakartaSansMedium16, other.plusJakartaSansMedium16, t)!,
      plusJakartaSansSemiBold16: TextStyle.lerp(plusJakartaSansSemiBold16, other.plusJakartaSansSemiBold16, t)!,
      plusJakartaSansSemiBold18: TextStyle.lerp(plusJakartaSansSemiBold18, other.plusJakartaSansSemiBold18, t)!,
    );
  }
}

/// [FontFamily] is an enumeration of font families used in the application.
enum FontFamily { jakarta }
