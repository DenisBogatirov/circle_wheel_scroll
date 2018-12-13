# Circle Wheel Scroll View packege

Modified version of original [ListWheelScrollView](https://docs.flutter.io/flutter/widgets/ListWheelScrollView-class.html) to create effect of scroling on circle.

![](preview.gif)

## Usage

To use plugin, just import package `import 'package:circle_wheel_scroll/screens/circle_wheel_scroll_view.dart';`

## Example

```
import 'package:flutter/material.dart';

import 'import 'package:circle_wheel_scroll/screens/circle_wheel_scroll_view.dart';';

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
        title: Text('Wheel'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            // height: 260,
            // width: 160,
            child: CircleListScrollView(
              physics: CircleFixedExtentScrollPhysics(),
              axis: Axis.horizontal,
              itemExtent: 80,
              children: List.generate(20, _buildItem),
              radius: MediaQuery.of(context).size.width * 0.6,
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
```