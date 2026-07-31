import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/theme/app_colors.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  // final ValueChanged<int> onTap;

  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                offset: const Offset(0, 8),
                color: Colors.black.withValues(alpha: 0.1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildItem(Icons.home_rounded, 'Beranda', 0),
              _buildItem(Icons.local_offer_rounded, 'Promo', 1),
              _buildItem(Icons.assignment, 'Pricelist', 2),
              _buildItem(Icons.receipt, 'Nota', 3),
              _buildItem(Icons.search, 'Lacak', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(
    IconData icon,
    String label,
    int index,
  ) {
    final isSelected = currentIndex == index;

    return InkWell(
      onTap: () =>  Void,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}