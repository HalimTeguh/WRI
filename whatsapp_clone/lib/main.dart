import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Pages/HomePage.dart';
import 'package:whatsapp_clone/Pages/SettingsPage.dart';

import 'Pages/ChatPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Color(0xff005C4B),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.black.withOpacity(0),
        ),
      ),
      routes: {
        "/": (context) => const HomePage(),
        "settingsPage": (context) => const SettingsPage(),
        "chatPage": (context) => const ChatPage(),
      },
    );
  }
}
