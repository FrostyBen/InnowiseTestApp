part of 'weatherbloc_bloc.dart';

@immutable
abstract class WeatherEvent {}

class GetWeather extends WeatherEvent{
  final String city;
  
  GetWeather(this.city);
  
}

class ShareWeatherEvent extends WeatherEvent{
  
}