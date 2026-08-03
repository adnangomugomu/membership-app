import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Widget? label;

  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        if (label != null)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: label!,
            ),
          ),
      ],
    );
  }
}