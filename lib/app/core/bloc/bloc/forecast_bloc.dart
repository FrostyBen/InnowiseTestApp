import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:test_flutter_weather/app/core/network/API/API_client.dart';
import 'package:test_flutter_weather/app/core/network/API/model/forecast_weather.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  ForecastBloc() : super(ForecastInitial()) {
    on<ForecastEvent>((event, emit) async{
      emit (ForecastLoadingState());
      final items = await APIClient().getForecast();
      emit(ForecastLoadedState(items));
    });
  }
}
