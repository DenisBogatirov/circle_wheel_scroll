import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'package:flutter/cupertino.dart';

class CircleListWheelChildLoopingListDelegate extends CircleListChildDelegate {
  /// Constructs the delegate from a concrete list of children.
  CircleListWheelChildLoopingListDelegate({required this.children});

  /// The list containing all children that can be supplied.
  final List<Widget> children;

  @override
  int? get estimatedChildCount => null;

  @override
  int trueIndexOf(int index) => index % children.length;

  @override
  Widget? build(BuildContext context, int index) {
    if (children.isEmpty) return null;
    return IndexedSemantics(
        index: index, child: children[index % children.length]);
  }

  @override
  bool shouldRebuild(
      covariant CircleListWheelChildLoopingListDelegate oldDelegate) {
    return children != oldDelegate.children;
  }
}
