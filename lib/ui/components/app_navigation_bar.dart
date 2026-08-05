import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/theme/app_colors.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          24,
          0,
          24,
          20,
        ),
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
            children: [
              Expanded(
                child: _buildItem(
                  icon: Icons.home_rounded,
                  label: 'Beranda',
                  index: 0,
                ),
              ),
              Expanded(
                child: _buildItem(
                  icon: Icons.local_offer_rounded,
                  label: 'Promo',
                  index: 1,
                ),
              ),
              Expanded(
                child: _buildItem(
                  icon: Icons.assignment_rounded,
                  label: 'Pricelist',
                  index: 2,
                ),
              ),
              Expanded(
                child: _buildItem(
                  icon: Icons.receipt_long_rounded,
                  label: 'Nota',
                  index: 3,
                ),
              ),
              Expanded(
                child: _buildItem(
                  icon: Icons.search_rounded,
                  label: 'Lacak',
                  index: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = currentIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 22,
            color: isSelected ? Colors.white : Colors.white60,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight:
                  isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? Colors.white : Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}