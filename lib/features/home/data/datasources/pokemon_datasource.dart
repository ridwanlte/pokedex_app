import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_app/core/utils/dio_client.dart';
import 'package:pokedex_app/features/home/data/models/pokemon_model/pokemon_model.dart';

class PokemonDatasource {
  final Dio dio;

  PokemonDatasource() : dio = DioClient.instance;

  Future<List<PokemonModel>> getPokemon() async {
    final response = await dio.get('');
    final jsonData = jsonDecode(response.data) as List;
      final List<PokemonModel> pokemonList = jsonData.map((e) {
        if (e is Map<String, dynamic>) {
          return PokemonModel.fromJson(e);
        }
        return null;
      }).cast<PokemonModel>().toList();
      return pokemonList;
  }
}
