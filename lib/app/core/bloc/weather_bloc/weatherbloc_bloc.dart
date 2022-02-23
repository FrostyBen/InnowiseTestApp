import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import 'package:test_flutter_weather/app/core/network/API/API_client.dart';
import 'package:test_flutter_weather/app/core/network/API/model/current_weather.dart';
part 'weatherbloc_event.dart';
part 'weatherbloc_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherblocInitial()) {
    on<GetWeather>((event, emit) async {
      emit(WeatherStateLoading());
      final items = await APIClient().getWeather();
      emit(WeatherStateLoaded(items));
    });
    on<ShareWeatherEvent>((event, emit) async {
      if (state is WeatherStateLoaded) {
        final currentState = state as WeatherStateLoaded;

        Share.share(currentState.currentWeather.name! +
            currentState.currentWeather.main!.humidity!.toString());
      }
    });
  }
}
