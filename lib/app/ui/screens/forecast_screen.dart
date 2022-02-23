import 'package:flutter/material.dart';
import 'package:test_flutter_weather/app/core/models/title.dart';
import 'package:test_flutter_weather/app/ui/widgets/title_listview.dart';

class ForecastScreen extends StatelessWidget {
  ForecastScreen({Key? key}) : super(key: key);
  List<TitleMainList> titles = [
    TitleMainList('today'),
    TitleMainList('friday'),
    TitleMainList('saturday')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('London'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.builder(
              itemBuilder: ((context, index) {
                return TitleListView(
                  titleList: titles[index],
                );
              }),
              itemCount: titles.length,
            ),
          ],
        ),
      ),
    );
  }
}
