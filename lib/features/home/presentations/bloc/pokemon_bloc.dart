import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/home/domain/repositories/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository pokemonRepository;
  PokemonBloc(this.pokemonRepository) : super(PokemonInitial()) {
    on<GetAllPokemon>(_onGetAllPokemon);
    on<GetSearchPokemon>(_onGetSearchPokemon);
  }

  Future<void> _onGetAllPokemon(
      GetAllPokemon event, Emitter<PokemonState> emit) async {
    emit(PokemonLoading());
    try {
      final List<PokemonEntity> data = await pokemonRepository.getAllPokemon();
      emit(PokemonSuccess(pokemon: data, searchPokemon: data));
    } catch (e) {
      emit(PokemonError(message: e.toString()));
    }
  }

  Future<void> _onGetSearchPokemon(
      GetSearchPokemon event, Emitter<PokemonState> emit) async {
    if (state is PokemonSuccess) {
      final pokemonSuccessState = state as PokemonSuccess;
      final pokemon = pokemonSuccessState.pokemon;
      final query = event.query.toLowerCase();

      final searchPokemon = pokemon.where((pokemon) {
        final pokemonName = pokemon.name?.toLowerCase() ?? '';
        return pokemonName.contains(query);
      }).toList();

      emit(PokemonSuccess(
        pokemon: pokemon,
        searchPokemon: searchPokemon,
      ));
    }
  }
}
