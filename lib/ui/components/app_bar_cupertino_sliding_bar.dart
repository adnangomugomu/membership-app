import 'package:flutter/cupertino.dart';

class AppBarCupertinoSlidingBar<T extends Object> extends StatelessWidget {
  final T groupValue;
  final ValueChanged<T?> onValueChanged;
  final Map<T, Widget> children;

  const AppBarCupertinoSlidingBar({
    super.key,
    required this.groupValue,
    required this.onValueChanged,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final items = children.entries.toList();
    final selectedIndex = items.indexWhere(
      (item) => item.key == groupValue,
    );

    return Container(
      height: 44,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey5,
        borderRadius: BorderRadius.circular(999),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = constraints.maxWidth / items.length;

          return Stack(
            children: [
              // Selected capsule
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                left: selectedIndex * itemWidth,
                top: 0,
                bottom: 0,
                width: itemWidth,
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),

              // Buttons
              Row(
                children: items.map((item) {
                  return SizedBox(
                    width: itemWidth,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        onValueChanged(item.key);
                      },
                      child: Center(
                        child: item.value,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}