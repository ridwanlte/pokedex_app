import 'package:pokedex_app/features/home/data/datasources/pokemon_datasource.dart';
import 'package:pokedex_app/features/home/data/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex_app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/home/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource datasource;

  PokemonRepositoryImpl(this.datasource);

  @override
  Future<List<PokemonModel>> getAllPokemon() async {
    return datasource.getPokemon();
  }
}