// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_weather/app/core/network/API/API_client.dart';
import 'package:test_flutter_weather/app/core/repositories/weather_repository/weather_repository_base.dart';
import 'package:test_flutter_weather/app/core/repositories/weather_repository/weather_repository_implement.dart';
import 'package:test_flutter_weather/app/core/services/geolocation_service.dart';
import './ui/widgets/bottom_navigation.dart';
import 'core/bloc/bloc/forecast_bloc.dart';
import 'core/bloc/weather_bloc/weatherbloc_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<GeolocationServiceBase>(
      create: (context) => GeolocationServiceImpl(),
      child: RepositoryProvider<WeatherRepositoryBase>(
        create: (context) => WeatherRepositoryImpl(
            apiClient: APIClient(),
            geoService: context.read<GeolocationServiceBase>()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ForecastBloc(
                  weatherRepositoryBase: context.read<WeatherRepositoryBase>())..add(GetForecastEvent())
                
            ),
            BlocProvider(
              create: (context) => WeatherBloc(
                  weatherRepositoryBase: context.read<WeatherRepositoryBase>())..add(GetWeather())
  
            ),
          ],
          child: MaterialApp(
            theme: ThemeData.light().copyWith(
              iconTheme: const IconThemeData(
                color: Color.fromARGB(255, 230, 167, 31),
              ),
            ),
            home: Scaffold(bottomNavigationBar: BottomNavigation()),
          ),
        ),
      ),
    );
  }
}
