import 'package:cached_network_image/cached_network_image.dart';
import 'package:character_hub/core/utils/colors/app_colors.dart';
import 'package:character_hub/core/utils/styles/app_style.dart';
import 'package:character_hub/feature/home/domain/entity/character_entity.dart';
import 'package:character_hub/feature/home/presentation/widgets/info_detail_card.dart';
import 'package:flutter/material.dart';

class CharacterDetailsView extends StatelessWidget {
  final CharacterEntity character;

  const CharacterDetailsView({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color:AppColors.lightBackground),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Character Details',
          style: AppStyle.text16.copyWith(color: AppColors.lightBackground),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.statusAlive.withOpacity(0.15),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: character.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: AppColors.darkBorder.withOpacity(0.3)),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.broken_image, color: AppColors.greyColor),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              character.name,
              textAlign: TextAlign.center,
              style: AppStyle.screenTitle.copyWith(
                color: AppColors.lightBackground,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 24),

            InfoDetailsCard(
              icon: Icons.favorite_outline,
              title: 'Status',
              value: character.status,
              valueColor:context.statusColor (character.status),
            ),
            InfoDetailsCard(
              icon: Icons.category_outlined,
              title: 'Species',
              value: character.species,
            ),
            InfoDetailsCard(
              icon: Icons.person_outline,
              title: 'Gender',
              value: character.gender,
            ),
            InfoDetailsCard(
              icon: Icons.merge_type_outlined,
              title: 'Type',
              value: character.type.isEmpty ? 'None' : character.type,
            ),
            InfoDetailsCard(
              icon: Icons.public_outlined,
              title: 'Origin',
              value: character.originName,
            ),
            InfoDetailsCard(
              icon: Icons.location_on_outlined,
              title: 'Last Location',
              value: character.locationName,
            ),
          ],
        ),
      ),
    );
  }

}
