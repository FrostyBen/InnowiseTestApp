part of 'forecast_bloc.dart';

@immutable
abstract class ForecastState {}

class ForecastInitial extends ForecastState {}

class ForecastLoadingState extends ForecastState {}

class ForecastErrorState extends ForecastState {}

class ForecastLoadedState extends ForecastState {
  final ForecastWeather forecastWeather;

  ForecastLoadedState(this.forecastWeather);
}
