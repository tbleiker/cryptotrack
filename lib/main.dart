import 'package:flutter/material.dart';
import 'package:cryptotrack/views/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinTrack',
      theme: ThemeData(
        // Scaffold
        scaffoldBackgroundColor: Colors.white,

        // App Bar
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.blue),
          titleTextStyle:
              TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
          centerTitle: true,
          elevation: 1.5,
          backgroundColor: Colors.white,
        ),

        // Bottom Navigation
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(
            size: 28,
          ),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 8,
        ),
      ),
      home: const MainView(),
    );
  }
}
