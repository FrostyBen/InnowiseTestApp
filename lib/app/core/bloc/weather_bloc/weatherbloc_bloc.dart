import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:share_plus/share_plus.dart';

import 'package:test_flutter_weather/app/core/network/API/model/current_weather.dart';
import 'package:test_flutter_weather/app/core/repositories/weather_repository/weather_repository_base.dart';

part 'weatherbloc_event.dart';
part 'weatherbloc_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  StreamSubscription? connectivityStream;
  final WeatherRepositoryBase weatherRepositoryBase;
  WeatherBloc({required this.weatherRepositoryBase})
      : super(WeatherblocInitial()) {
       
    on<GetWeather>((event, emit) async {
      try{
      emit(WeatherStateLoading());
      
      final items = await weatherRepositoryBase.getTodayWeather();
      emit(WeatherStateLoaded(currentWeather: items));
      } catch(e){
        
       return emit(WeatherStateError());
        
      }
    });
      
    // on<InternetConnection>(((event, emit) {
    //   emit(NoInternetConnectionState());
    // }));
    
    connectivityStream = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(GetWeather());
      } else {
        
      }
    });
    on<ShareWeatherEvent>((event, emit) async {
      if (state is WeatherStateLoaded) {
        final currentState = state as WeatherStateLoaded;

        Share.share(
            ' the temperature in ${currentState.currentWeather.name! + (currentState.currentWeather.main!.temp!.toInt() - 273).toString()}' +
                '℃');
      }
    });
    
  }
  @override
    Future<void> close() {
      connectivityStream?.cancel();
      
      return super.close();
    
    }
      
}
