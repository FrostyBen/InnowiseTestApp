part of 'weatherbloc_bloc.dart';

@immutable
abstract class WeatherblocState {}

class WeatherblocInitial extends WeatherblocState {}

class WeatherStateLoading extends WeatherblocState{}
class WeatherStateError extends WeatherblocState{}
class WeatherStateLoaded extends WeatherblocState{
final TodayWeather todayWeather;

  WeatherStateLoaded(this.todayWeather);

}