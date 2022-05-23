part of 'weatherbloc_bloc.dart';

@immutable
abstract class WeatherEvent {}

class GetWeather extends WeatherEvent {
 
}

class ShareWeatherEvent extends WeatherEvent {}
class InternetConnection extends WeatherEvent{}
