import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_weather/app/core/models/title.dart';
import 'package:test_flutter_weather/app/ui/widgets/forecast_list.dart';
import 'package:test_flutter_weather/app/ui/widgets/title_listview.dart';

import '../../core/bloc/bloc/forecast_bloc.dart';

class ForecastScreen extends StatelessWidget {
  ForecastScreen({Key? key}) : super(key: key);
  // List<TitleMainList> titles = [
  //   TitleMainList('today'),
  //   TitleMainList('friday'),
  //   TitleMainList('saturday')
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  BlocBuilder<ForecastBloc, ForecastState>(
          builder: (context, state) {
            if(state is ForecastLoadingState){
return Container();

            }
            if (state is ForecastLoadedState){

            
            return Text(state.forecastWeather.city!.name!);
          }
          return Container();
          }
          
        ),
      ),
      body: BlocBuilder<ForecastBloc, ForecastState>(
        builder: (context, state) {
          if (state is ForecastLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ForecastLoadedState) {
            return CustomScrollView(slivers: [
              SliverToBoxAdapter(
                  child: TitleListView(
                forecastList: state.forecastWeather.list,
              )),
            ]);
          }
          if (state is ForecastErrorState) {
            return Center(
              child: Text('You have an error'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
