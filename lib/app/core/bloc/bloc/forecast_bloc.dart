import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:test_flutter_weather/app/core/network/API/model/forecast_weather.dart';
import 'package:test_flutter_weather/app/core/repositories/weather_repository/weather_repository_base.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final WeatherRepositoryBase weatherRepositoryBase;

  ForecastBloc({required this.weatherRepositoryBase})
      : super(ForecastInitial()) {
    on<ForecastEvent>((event, emit) async {
      emit(ForecastLoadingState());
      final items = await weatherRepositoryBase.getForecastWeather();
      emit(ForecastLoadedState(items));
    });
  }
}
