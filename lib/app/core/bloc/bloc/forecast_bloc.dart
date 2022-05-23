import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

import 'package:test_flutter_weather/app/core/network/API/model/forecast_weather.dart';
import 'package:test_flutter_weather/app/core/repositories/weather_repository/weather_repository_base.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  StreamSubscription? subscription;
  final WeatherRepositoryBase weatherRepositoryBase;

  ForecastBloc({required this.weatherRepositoryBase})
      : super(ForecastInitial()) {
    on<GetForecastEvent>((event, emit) async {
      try {
      emit(ForecastLoadingState());
      final items = await weatherRepositoryBase.getForecastWeather();
      emit(ForecastLoadedState(items));
      }catch(e) {
       
       return emit(ForecastErrorState());
        
      }
    });
    // on<InternetConnection>(((event, emit) {
    //   emit(NoInternetConnectionState());
    // }));
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(GetForecastEvent());
      } else {
        
      }
    });
  }
   @override
    Future<void> close() {
      subscription?.cancel();
      
      return super.close();
    
    }
}
