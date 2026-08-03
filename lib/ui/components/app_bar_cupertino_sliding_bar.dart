import 'package:flutter/cupertino.dart';

class AppBarCupertinoSlidingBar<T extends Object> extends StatelessWidget{
  final T groupValue;
  final ValueChanged<T?> onValueChanged;
  final Map<T, Widget> children;

  const AppBarCupertinoSlidingBar({
    super.key,
    required this.groupValue,
    required this.onValueChanged,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<T>(
      groupValue: groupValue,
      children: children,
      onValueChanged: onValueChanged,
    );
  }
}