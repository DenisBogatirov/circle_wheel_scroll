import 'package:flutter/material.dart';

import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: WheelExample(),
        ),
      ),
    );
  }
}

class WheelExample extends StatelessWidget {
  const WheelExample({ super.key });


  Widget _buildItem(int i) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: 80,
          padding: const EdgeInsets.all(20),
          color: Colors.blue[100 * ((i % 8) + 1)],
          child: Center(
            child: Text(
              i.toString(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wheel example'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            // height: 260,
            // width: 160,
            child: CircleListScrollView(
              physics: const CircleFixedExtentScrollPhysics(),
              axis: Axis.vertical,
              itemExtent: 80,
              radius: MediaQuery.of(context).size.width * 0.6,
              onSelectedItemChanged: (int index) =>
                  print('Current index: $index'),
              children: List.generate(20, _buildItem),
            ),
          ),
        ),
      ),
    );
  }
}
