import 'package:flutter/material.dart';
import 'package:theming_example/styles/test_text_style.dart';
import 'package:theming_example/themes/test_text_theme.dart';

import 'themes/test_color.sheme.dart';
import 'widgets/test_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        extensions: [
          // Colors
          TestColorTheme(
            primaryColor: Colors.red,
            secondaryColor: Colors.yellow,
          ),
          // Test Text
          TestTextTheme(
            fontSize: 17,
            backgroundColor: Colors.yellow,
            // textColor will be used from
          ),
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: [
          // Colors
          TestColorTheme(
            primaryColor: Colors.orange,
            secondaryColor: Colors.lightGreen,
          ),
          // Test Text
          TestTextTheme(
            fontSize: 17,
            backgroundColor: Colors.blue,
            // textColor will be used from
          ),
        ],
      ),
      themeMode: ThemeMode.light,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            TestText(
              text: 'Test text',
            ),
            TestText(
              text: 'Test text',
              backgroundColor:
                  Colors.lightBlue, // constructor property will be used
              style: TestTextStyle(
                backgroundColor: Colors.red,
              ),
            ),
            TestText(
              text: 'Test text',
              style: TestTextStyle(
                backgroundColor: Colors.green, // style property will be used
              ),
            ),
            TestText(
              text: 'Test text',
              style: TestTextStyle(
                textColor: Colors.green, // custom color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
