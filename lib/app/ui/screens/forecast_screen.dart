import 'package:flutter/material.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('London'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text('TODAY'),
          const Divider(
            color: Colors.blue,
            height: 30,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Row(
                
                children: [
                  const Icon(
                    Icons.wb_sunny,
                    size: 70,
                  ),
                
              
              const SizedBox(width: 20,),
              Column(
                mainAxisAlignment:MainAxisAlignment.start,
                children: const [
                  Text('13:00', style: TextStyle(fontSize: 18),),
                  Text('Clear', style: TextStyle(fontSize:18),),
                ],
              ),
                ],
              ),
              const Text('22°', style: TextStyle(fontSize: 50, color: Colors.blue),)
            ],
          ),
            const Divider(
            color: Colors.blue,
            height: 20,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Row(
                children: [
                  const Icon(
                    Icons.umbrella,
                    size: 70,
                  ),
                
              
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('16:00', style: TextStyle(fontSize: 18),),
                  Text('Rain Showers', style: TextStyle(fontSize: 18),),
                ],
              ),
                ],),
              const Text('18°', style: TextStyle(fontSize: 50, color: Colors.blue),)
            ],
          ),
          const Divider(indent: 100,thickness: 2,
          height: 20,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Row(
                children: [
                  const Icon(
                    Icons.mode_night,
                    size: 70,
                  ),
                
              
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('19:00', style: TextStyle(fontSize: 18),),
                  Text('Rain Showers', style: TextStyle(fontSize: 18),),
                ],
              ),
                ],),
              const Text('15°', style: TextStyle(fontSize: 50, color: Colors.blue),)
            ],
          ),
           const Divider(indent: 100,thickness: 2,
          height: 20,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Row(
                
                children: [
                  const Icon(
                    Icons.nights_stay,
                    size: 70,
                  ),
                
              
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('22:00', style: TextStyle(fontSize: 18),),
                  Text('Few Clouds', style: TextStyle(fontSize: 18),),
                ],
              ),
                ],),
              const Text('15°', style: TextStyle(fontSize: 50, color: Colors.blue),),
            ],
          ),
          const Divider(thickness: 2, height: 20,),
          
          const Text('LONDON'),

          const Divider(thickness: 2, height:20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Row(
                
                children: [
                  const Icon(
                    Icons.mode_night,
                    size: 70,
                  ),
                
              
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('19:00', style: TextStyle(fontSize: 18),),
                  Text('Clear', style: TextStyle(fontSize: 18),),
                ],
              ),
                ],
              ),
              const Text('15°', style: TextStyle(fontSize: 50, color: Colors.blue),)
            ],
          ),
        ],
      ),
    );
  }
}
