// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './ui/widgets/bottom_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 230, 167, 31),
        ),
      ),
      home: Scaffold(
        
        bottomNavigationBar: BottomNavigation()),
    );
  }
}
