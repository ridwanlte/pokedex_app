import 'package:pokedex_app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/home/domain/repositories/pokemon_repository.dart';

class RequestPokemon {
  final PokemonRepository repository;

  RequestPokemon(this.repository);

  Future<List<PokemonEntity>> getAllNews() {
    return repository.getAllPokemon();
  }
}