import 'package:character_hub/core/utils/service_locator/service_locator.dart';
import 'package:character_hub/feature/home/presentation/character_cubit/character_cubit.dart';
import 'package:character_hub/feature/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:character_hub/core/utils/colors/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CharacterCubit>()..getAllCharacter(),
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        body: const SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
