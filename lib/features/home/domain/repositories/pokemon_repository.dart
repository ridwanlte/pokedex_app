import 'package:pokedex_app/features/home/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getAllPokemon();
}