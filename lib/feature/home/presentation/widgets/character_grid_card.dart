import 'package:cached_network_image/cached_network_image.dart';
import 'package:character_hub/core/utils/colors/app_colors.dart';
import 'package:character_hub/core/utils/styles/app_style.dart';
import 'package:character_hub/feature/home/domain/entity/character_entity.dart';
import 'package:flutter/material.dart';

class CharacterGridCard extends StatelessWidget {
  final CharacterEntity characterEntity;
  final VoidCallback? onTap;

  const CharacterGridCard({
    super.key,
    this.onTap,
    required this.characterEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: characterEntity.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: AppColors.darkBorder.withOpacity(0.3)),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(
                        Icons.broken_image,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                characterEntity.name,
                style: AppStyle.characterName.copyWith(
                  color: AppColors.lightBackground,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                '${characterEntity.species} · ${characterEntity.status}',
                style: AppStyle.characterSubtitle.copyWith(
                  color: AppColors.blueGrey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: context
                      .statusColor(characterEntity.status)
                      .withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  characterEntity.status,
                  style: AppStyle.statusBadge.copyWith(
                    color: context.statusColor(characterEntity.status),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
