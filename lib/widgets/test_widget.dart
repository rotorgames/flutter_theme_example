import 'package:flutter/material.dart';
import 'package:theming_example/themes/test_color.sheme.dart';
import 'package:theming_example/themes/test_text_theme.dart';

import '../styles/test_text_style.dart';

class TestText extends StatelessWidget {
  final String text;
  final TestTextStyle? style;
  final Color? backgroundColor;

  const TestText({
    Key? key,
    required this.text,
    this.backgroundColor,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _getBackgroundColor(context),
      child: Text(
        text,
        style: TextStyle(
          color: _getTextColor(context),
          fontSize: _getFontSize(context),
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    final testColorScheme = TestColorTheme.of(context);
    final textTheme = TestTextTheme.of(context);

    return backgroundColor ??
        style?.backgroundColor ??
        textTheme.backgroundColor ??
        testColorScheme.primaryColor;
  }

  Color _getTextColor(BuildContext context) {
    final testColorScheme = TestColorTheme.of(context);
    final textTheme = TestTextTheme.of(context);

    return style?.textColor ??
        textTheme.textColor ??
        testColorScheme.primaryColor;
  }

  double _getFontSize(BuildContext context) {
    final textTheme = TestTextTheme.of(context);

    return style?.fontSize ?? textTheme.fontSize;
  }
}
