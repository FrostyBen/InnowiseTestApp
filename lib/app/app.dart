// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './ui/widgets/bottom_navigation.dart';
import 'core/bloc/weather_bloc/weatherbloc_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc()..add(GetWeather('hui')),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 230, 167, 31),
          ),
        ),
        home: Scaffold(bottomNavigationBar: BottomNavigation()),
      ),
    );
  }
}
