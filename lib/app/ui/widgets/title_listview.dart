import 'package:flutter/material.dart';

import 'package:test_flutter_weather/app/core/network/API/model/forecast_weather.dart';
import 'package:test_flutter_weather/app/ui/widgets/forecast_list.dart';
import 'package:intl/intl.dart';

class TitleListView extends StatefulWidget {
  const TitleListView({
    Key? key,
    required this.forecastList,
  }) : super(key: key);

  final List<ListElement>? forecastList;

  @override
  State<TitleListView> createState() => _TitleListViewState();
}

class _TitleListViewState extends State<TitleListView> {
  late final List<Widget> widgets;

  List<Widget> dayTitle(List<Widget> elements, {int skip = 0}) {
    final List<ListElement> elementsLocal =
        widget.forecastList!.skip(skip).toList();
    late final DateTime currentDate;
    final List<ListElement> newElems = List.empty(growable: true);
    late String title;
    if (widget.forecastList!.length == skip) {
      return elements;
    }

    currentDate = widget.forecastList![skip].dtTxt!.toLocal();
    title = currentDate.day == DateTime.now().day
        ? 'Today'
        : DateFormat('EEEE').format(currentDate);
    for (var i = 0; i < elementsLocal.length; i++,) {
      final date = elementsLocal[i].dtTxt!.toLocal();
      skip++;
      if (date.day == currentDate.day) {
        newElems.add(elementsLocal[i]);
      } else {
        break;
      }
    }
    elements.add(ForecastList(title: title, elements: newElems));
    return dayTitle(elements, skip: skip);
  }

  @override
  void initState() {
    widgets = dayTitle(<Widget>[]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      semanticChildCount: widgets.length,
      children: widgets,
    );
  }
}
