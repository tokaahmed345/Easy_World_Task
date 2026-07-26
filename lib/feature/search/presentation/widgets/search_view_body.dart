import 'package:character_hub/core/utils/colors/app_colors.dart';
import 'package:character_hub/core/utils/styles/app_style.dart';
import 'package:character_hub/feature/home/presentation/character_cubit/character_cubit.dart';
import 'package:character_hub/feature/home/presentation/widgets/character_grid.dart';
import 'package:character_hub/feature/search/presentation/widgets/search_not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  final String query;

  const SearchViewBody({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_rounded,
              size: 80,
              color: AppColors.blueGrey,
            ),
            const SizedBox(height: 16),
            Text(
              'Search characters by name',
              style: AppStyle.text16.copyWith(
                color: AppColors.blueGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.statusAlive),
          );
        } else if (state is CharacterSuccess) {
          if (state.characterList.isEmpty) {
            return SearchNotFoundWidget(query: query);
          }
          return const CharacterGrid();
        } else if (state is CharacterFailure) {
          return SearchNotFoundWidget(query: query);
        }

        return const SizedBox();
      },
    );
  }
}
