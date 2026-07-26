
import 'package:character_hub/core/utils/constant/endpoints.dart';
import 'package:character_hub/core/utils/service/api_service.dart';
import 'package:character_hub/feature/home/data_source/model/character_model.dart';

class CharacterRemoteDataSource {
  final ApiService apiService;

  CharacterRemoteDataSource({required this.apiService});

  Future<List<CharacterModel>> getAllCharacter({
    String? status,
    String? name,
  }) async {
    final Map<String, dynamic> queryParameters = {};

    if (status != null && status.isNotEmpty && status.toLowerCase() != 'all') {
      queryParameters['status'] = status.toLowerCase();
    }

    if (name != null && name.trim().isNotEmpty) {
      queryParameters['name'] = name.trim();
    }

    final response = await apiService.get(
      EndPoints.character,
      queryParameters: queryParameters, 
    );
    
    final List results = response['results'];
    
    return results
        .map((characterJson) => CharacterModel.fromJson(characterJson))
        .toList();
  }
}