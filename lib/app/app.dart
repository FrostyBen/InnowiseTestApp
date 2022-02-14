import 'package:flutter/material.dart';
import './ui/screens/forecast_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      theme:ThemeData.light().copyWith(iconTheme: const IconThemeData(color: Color.fromARGB(255, 230, 167, 31))),
      
      home: ForecastScreen(),
    );
  }
}