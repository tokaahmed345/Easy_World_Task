import 'package:character_hub/core/utils/colors/app_colors.dart';
import 'package:character_hub/core/utils/service/excel_export_file.dart';
import 'package:character_hub/core/utils/styles/app_style.dart';
import 'package:character_hub/core/utils/widgets/snackbar.dart';
import 'package:character_hub/feature/home/presentation/character_cubit/character_cubit.dart';
import 'package:character_hub/feature/home/presentation/widgets/character_grid.dart';
import 'package:character_hub/feature/home/presentation/widgets/status_filter_chips.dart';
import 'package:character_hub/feature/search/presentation/search_view.dart';
import 'package:character_hub/feature/search/presentation/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: CustomSearchBar(
                  readOnly: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (newContext) => BlocProvider.value(
                          value: BlocProvider.of<CharacterCubit>(context),
                          child: const SearchView(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: AppColors.darkSurfaceElevated,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.darkBorder),
                ),
                child: IconButton(
                  tooltip: 'Export to Excel',
                  onPressed: () async {
                    final currentState = context.read<CharacterCubit>().state;

                    if (currentState is CharacterSuccess &&
                        currentState.characterList.isNotEmpty) {
                      showSnackBarFuction(
                        context,
                        "Downloading Excel file...",
                        isError: false,
                      );

                      final path =
                          await ExcelExportService.exportCharactersToExcel(
                            currentState.characterList,
                          );

                      if (path != null && context.mounted) {
                                showSnackBarFuction(
                        context,
                        "Saved successfully to Downloads folder!",
                        isError: false,
                      );
                       
                      }
                    } else {
                      showSnackBarFuction(
                        context,
                        " No characters available to export!",
                        isError: true,
                      );
                      
                    }
                  },
                  icon: const Icon(
                    Icons.file_download_outlined,
                    color: AppColors.statusAlive,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          const StatusFilterChips(),
          const SizedBox(height: 16),

          Text(
            'Characters',
            style: AppStyle.screenTitle.copyWith(
              color: AppColors.lightBackground,
            ),
          ),
          const SizedBox(height: 12),
          const Expanded(child: CharacterGrid()),
        ],
      ),
    );
  }
}
