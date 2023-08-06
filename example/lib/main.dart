import 'package:flutter/material.dart';

import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';

class WheelExample extends StatelessWidget {
  Widget _buildItem(int i) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: 80,
          padding: EdgeInsets.all(20),
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
        title: Text('Wheel example'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            // height: 260,
            // width: 160,
            child: CircleListScrollView(
              physics: CircleFixedExtentScrollPhysics(),
              axis: Axis.vertical,
              itemExtent: 80,
              children: List.generate(20, _buildItem),
              radius: MediaQuery.of(context).size.width * 0.6,
              onSelectedItemChanged: (int index) =>
                  print('Current index: $index'),
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WheelExample(),
    );
  }
}

void main() => runApp(MyApp());
