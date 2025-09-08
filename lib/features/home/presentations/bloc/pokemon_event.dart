part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class LoadAllPokemon extends PokemonEvent {}

class GetAllPokemon extends PokemonEvent {

  const GetAllPokemon();

  @override
  List<Object> get props => [];
}

class GetSearchPokemon extends PokemonEvent {
  final String query;

  const GetSearchPokemon({required this.query});

  @override
  List<Object> get props => [query];
}
