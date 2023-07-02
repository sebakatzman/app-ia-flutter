import 'package:app_demo/chat_page.dart';
import 'package:app_demo/image_page.dart';
import 'package:app_demo/my_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const MyHomePage(),
        '/chat': (context) => const ChatPage(),
        '/image': (context) => const ImagePage(),
      },
      initialRoute: '/',
    );
  }
}
