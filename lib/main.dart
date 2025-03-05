import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CheckIn App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),   // 홈화면
        '/menu': (context) => const MenuPage(), // 메뉴화면
      },
    );
  }
}
