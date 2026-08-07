import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/ui/components/app_button.dart';

class AppButtonCarousel extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;
  final ValueChanged<int>? onTap;

  const AppButtonCarousel({
    super.key,
    required this.items,
    required this.selectedIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;

          return SizedBox(
            width: 140,
            child: AppButton(
              text: items[index],
              onPressed: isSelected
                  ? null
                  : () => onTap?.call(index),
            ),
          );
        },
      ),
    );
  }
}