import 'package:character_hub/core/utils/colors/app_colors.dart';
import 'package:character_hub/core/utils/styles/app_style.dart';
import 'package:character_hub/feature/home/presentation/character_cubit/character_cubit.dart';
import 'package:character_hub/feature/home/presentation/widgets/character_details.dart';
import 'package:character_hub/feature/home/presentation/widgets/character_grid_card.dart';
import 'package:character_hub/feature/home/presentation/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterGrid extends StatelessWidget {
  const CharacterGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterSuccess) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.characterList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return CharacterGridCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CharacterDetailsView(
                        character: state.characterList[index],
                      ),
                    ),
                  );
                },
                characterEntity: state.characterList[index],
              );
            },
          );
        } else if (state is CharacterFailure) {
          return Center(
            child: Text(
              state.message,
              style: AppStyle.text18.copyWith(color: AppColors.lightBackground),
            ),
          );
        } else {
          return const ShimmerLoading();
        }
      },
    );
  }
}
