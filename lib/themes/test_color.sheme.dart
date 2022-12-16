import 'package:flutter/material.dart';

class TestColorTheme extends ThemeExtension<TestColorTheme> {
  final Color primaryColor;
  final Color secondaryColor;

  TestColorTheme({
    required this.primaryColor,
    required this.secondaryColor,
  });

  factory TestColorTheme.of(BuildContext context) =>
      Theme.of(context).extension<TestColorTheme>()!;

  @override
  ThemeExtension<TestColorTheme> copyWith({
    primaryColor,
    secondaryColor,
  }) {
    return TestColorTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
    );
  }

  @override
  ThemeExtension<TestColorTheme> lerp(
      ThemeExtension<TestColorTheme>? other, double t) {
    if (other is! TestColorTheme) {
      return this;
    }

    return TestColorTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
    );
  }
}
