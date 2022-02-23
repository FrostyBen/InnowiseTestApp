part of 'weatherbloc_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherblocInitial extends WeatherState {}

class WeatherStateLoading extends WeatherState{}
class WeatherStateError extends WeatherState{}
class WeatherStateLoaded extends WeatherState{
final CurrentWeather currentWeather;

  WeatherStateLoaded(this.currentWeather);

}