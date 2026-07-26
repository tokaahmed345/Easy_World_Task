

import 'package:character_hub/core/utils/colors/app_colors.dart';
import 'package:character_hub/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class SearchNotFoundWidget extends StatelessWidget {
  final String query;

  const SearchNotFoundWidget({
    super.key,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('😞', style: TextStyle(fontSize: 70)),
          const SizedBox(height: 16),
          Text(
            'No character found for "$query"',
            textAlign: TextAlign.center,
            style: AppStyle.text16.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Please check the spelling or try another name',
            textAlign: TextAlign.center,
            style: AppStyle.text14.copyWith(color: AppColors.blueGrey),
          ),
        ],
      ),
    );
  }
}
