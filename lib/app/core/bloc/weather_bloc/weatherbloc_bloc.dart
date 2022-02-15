
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_weather/app/core/models/today_weather.dart';
part 'weatherbloc_event.dart';
part 'weatherbloc_state.dart';

class WeatherblocBloc extends Bloc<WeatherblocEvent, WeatherblocState> {
  WeatherblocBloc() : super(WeatherblocInitial()) {
    on<WeatherblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
