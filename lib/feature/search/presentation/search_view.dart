import 'dart:async';
import 'package:character_hub/core/utils/colors/app_colors.dart';
import 'package:character_hub/feature/home/presentation/character_cubit/character_cubit.dart';
import 'package:character_hub/feature/search/presentation/widgets/custom_search_bar.dart';
import 'package:character_hub/feature/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  Timer? _debounceTimer;
  final TextEditingController _searchController = TextEditingController();
  String _currentQuery = '';

  void _onSearchQueryChanged(String query) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        final cleanQuery = query.trim();
        print('🚀 API Request Sent for query: "$cleanQuery"');

        context.read<CharacterCubit>().getAllCharacter(name: cleanQuery);

        setState(() {
          _currentQuery = cleanQuery;
        });
      }
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            context.read<CharacterCubit>().getAllCharacter(name: '');
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CustomSearchBar(
            controller: _searchController,
            autofocus: true,
            onChanged: _onSearchQueryChanged, 
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: SearchViewBody(query: _currentQuery),
      ),
    );
  }
}
