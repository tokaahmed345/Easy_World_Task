
import 'package:character_hub/core/utils/colors/app_colors.dart';
import 'package:character_hub/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class InfoDetailsCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color valueColor;
  const InfoDetailsCard({
    required this.icon,
    required this.title,
    required this.value,
    this.valueColor = AppColors.lightBackground,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.darkSurfaceElevated,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.blueGrey, size: 22),
          const SizedBox(width: 12),
          Text(
            title,
            style: AppStyle.text14.copyWith(color: AppColors.blueGrey),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Text(
              value,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppStyle.text14.copyWith(
                color: valueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
