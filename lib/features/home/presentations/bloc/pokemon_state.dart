part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

final class PokemonInitial extends PokemonState {}

final class PokemonLoading extends PokemonState {}

final class PokemonSuccess extends PokemonState {
  final List<PokemonEntity> pokemon;
  final List<PokemonEntity> searchPokemon;

  const PokemonSuccess({required this.pokemon, required this.searchPokemon});

  @override
  List<Object> get props => [pokemon, searchPokemon];
}

final class PokemonError extends PokemonState {
  final String message;
  const PokemonError({required this.message});
  @override
  List<Object> get props => [message];
}

// final class PokemonSearchQuery extends PokemonState {
//   final Pokemon Pokemon;
//   final int page;

//   const PokemonSearchQuery({required this.Pokemon, required this.page});

//   @override
//   List<Object> get props => [Pokemon, page];
// }
