import 'package:flutter/material.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
      ),
      body: Center(
        
        child: Column(
          children: [
            const SizedBox(height:15),
            const Icon(
              Icons.wb_sunny_outlined,
              size: 170,
            ),
            const SizedBox(
              height: 10
            ),
            const Text('London,UK', style: TextStyle(fontSize: 20),),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '22℃| Sunny',
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
                    const Text('57%')
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
                    const Text('1019 hPa')
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                      ),
                      child: const Icon(Icons.device_thermostat_outlined),
                    ),
                    const Text('1019 hPa')
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
                    const Text('1019 hPa')
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
            const Text(
              'Share',
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
