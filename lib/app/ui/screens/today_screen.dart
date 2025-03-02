import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/bloc/weather_bloc/weatherbloc_bloc.dart';



class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  String getDirection(int direction) {
    if (direction < 45 && direction >= 0) {
      return 'N';
    } else if (direction < 90 && direction >= 45) {
      return 'NE';
    } else if (direction < 135 && direction >= 90) {
      return 'E';
    } else if (direction <= 180 && direction >= 135) {
      return 'SE';
    } else if (direction < 225 && direction >= 180) {
      return 'S';
    } else if (direction <= 280 && direction >= 225) {
      return 'SW';
    } else if (direction < 325 && direction >= 280) {
      return 'W';
    } else {
      return 'NW';
    }
  }
 var subscription;
  var connectionStatus;
  
  @override
  
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
 
          if (state is WeatherStateLoaded) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Image.asset(
                      'assets/${state.currentWeather.weather!.first.icon!}.png',
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.height * 0.15,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.currentWeather.name!,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      (state.currentWeather.main!.temp!.toInt() - 273)
                              .toString() +
                          ' °C',
                      style: const TextStyle(color: Colors.blue, fontSize: 35),
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
                            Text(state.currentWeather.main!.humidity!
                                    .toString() +
                                ' %')
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
                              child:
                                  const Icon(Icons.device_thermostat_outlined),
                            ),
                            Text(state.currentWeather.main!.pressure!
                                    .toString() +
                                ' hPa')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
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
                            Text(state.currentWeather.wind!.speed!
                                    .toInt()
                                    .toString() +
                                ' km/h')
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
                      onTap: () {
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
                      height: MediaQuery.of(context).size.height * 0.03,
                    )
                  ],
                ),
              ),
            );
          }
         
          if (state is WeatherStateError) {
            return const Center(
              child: Text('check your internt connection', style: TextStyle(fontSize: 20),),
            );
          }
          return Container();
        },
      ),
    );
  }
}
