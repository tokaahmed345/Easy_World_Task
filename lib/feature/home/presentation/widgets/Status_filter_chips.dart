import 'package:character_hub/core/utils/colors/app_colors.dart';
import 'package:character_hub/core/utils/styles/app_style.dart';
import 'package:character_hub/feature/home/presentation/character_cubit/character_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusFilterChips extends StatefulWidget {
  const StatusFilterChips({super.key});

  @override
  State<StatusFilterChips> createState() => _StatusFilterChipsState();
}

class _StatusFilterChipsState extends State<StatusFilterChips> {
  final List<String> statusOptions = ['All', 'Alive', 'Dead', 'Unknown'];

  @override
  Widget build(BuildContext context) {
    final selectedStatus = context.select<CharacterCubit, String>(
      (cubit) => cubit.selectedStatus,
    );

    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: statusOptions.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final status = statusOptions[index];
          final isSelected = selectedStatus == status;

          return ChoiceChip(
            label: Text(status),
            selected: isSelected,
            onSelected: (selected) {
              if (selected) {
                context.read<CharacterCubit>().getAllCharacter(
                      status: status == 'All' ? null : status,
                    );
              }
            },
            selectedColor: AppColors.primary,
            backgroundColor: AppColors.darkSurfaceElevated,
            labelStyle: AppStyle.text14.copyWith(
              color: isSelected ? AppColors.whiteColor : AppColors.blueGrey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: BorderSide(
              color: isSelected ? AppColors.primary : AppColors.darkBorder,
            ),
            showCheckmark: false,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          );
        },
      ),
    );
  }
}