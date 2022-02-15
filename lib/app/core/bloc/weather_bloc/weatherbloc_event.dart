part of 'weatherbloc_bloc.dart';

@immutable
abstract class WeatherblocEvent {}

class GetWeather extends WeatherblocEvent{
  final String city;
  
  GetWeather(this.city);
  
}