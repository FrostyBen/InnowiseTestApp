import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/weather_bloc/weatherbloc_bloc.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({Key? key}) : super(key: key);
  
String getDirection(int direction){
  if(direction < 45 && direction >= 0){
    return 'N';
  }else if( direction < 90 && direction >= 45){
    return 'NE';
  } else if (direction < 135 && direction >= 90){
    return 'E';
  } else if( direction <= 180 && direction >= 135){
    return 'SE';
  } else if ( direction < 225 && direction >= 180){
    return 'S';
  } else if( direction <= 280 && direction >= 225){
    return 'SW';
  } else if( direction < 325 && direction >=280){
    return 'W';
  } else {
    return 'NW';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherStateLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if (state is WeatherStateLoaded){

          
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                   Image.asset(
                    'assets/${state.currentWeather.weather!.first.icon!}.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 10),
                 Text(
                    state.currentWeather.name!,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Text(
                    (state.currentWeather.main!.temp! -273.15).toString() + ' °C' ,
                    style: TextStyle(color: Colors.blue, fontSize: 35),
                  ),
                  const Divider(
                    thickness: 2,
                    indent: 100,
                    endIndent: 100,
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: const Icon(Icons.cloud),
                          ),
                           Text(state.currentWeather.main!.humidity!.toString() + ' %')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: const Icon(Icons.opacity),
                          ),
                          const Text('1.0mm'),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: const Icon(Icons.device_thermostat_outlined),
                          ),
                           Text(state.currentWeather.main!.pressure!.toString() + ' hPa')
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: const Icon(Icons.air),
                          ),
                           Text(state.currentWeather.wind!.speed!.toInt().toString() + ' km/h')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: const Icon(Icons.explore),
                          ),
                           Text(getDirection(state.currentWeather.wind!.deg!))
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    indent: 100,
                    endIndent: 100,
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: (){
                      context.read<WeatherBloc>().add(ShareWeatherEvent());
                    },
                    child: const Text(
                      'Share',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
          }
          if( state is WeatherStateError){
            return Center(child: Text('You have an error'),);
          }
          return Container();
        },
        
      ),
    );
  }
}
