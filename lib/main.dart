import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const HandWrite2TypeApp());
}

class HandWrite2TypeApp extends StatelessWidget {
  const HandWrite2TypeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HandWrite2Type',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
