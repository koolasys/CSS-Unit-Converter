import 'package:flutter/material.dart';
import 'pages/convertor_screen.dart';
import './themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Convertor',
      theme: defaultTheme,
      home: const ConvertorView(title: 'Unit Convertor'),
    );
  }
}


//End of code