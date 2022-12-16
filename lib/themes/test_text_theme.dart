import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class TestTextTheme extends ThemeExtension<TestTextTheme> {
  final double fontSize;
  final Color? textColor;
  final Color? backgroundColor;

  TestTextTheme({
    required this.fontSize,
    this.textColor,
    this.backgroundColor,
  });

  factory TestTextTheme.of(BuildContext context) =>
      Theme.of(context).extension<TestTextTheme>()!;

  @override
  ThemeExtension<TestTextTheme> copyWith({
    fontSize,
    textColor,
    backgroundColor,
  }) {
    return TestTextTheme(
      fontSize: fontSize ?? this.fontSize,
      textColor: textColor ?? this.textColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  ThemeExtension<TestTextTheme> lerp(
      ThemeExtension<TestTextTheme>? other, double t) {
    if (other is! TestTextTheme) {
      return this;
    }

    return TestTextTheme(
      fontSize: ui.lerpDouble(fontSize, other.fontSize, t)!,
      textColor: Color.lerp(textColor, other.textColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }
}
