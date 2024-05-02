import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/app_events.dart';
import 'package:flutter_pokedex/blocs/app_states.dart';
import 'package:flutter_pokedex/data/pokeapi.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository _pokemonRepository;

  PokemonBloc(this._pokemonRepository) : super(PokemonListLoadingState()) {
    on<LoadPokemonEvent>((event, emit) async {
      emit(PokemonListLoadingState());
      try {
        final pokemons = await _pokemonRepository.getPokemons();
        emit(PokemonListLoadedState(pokemons));
      } catch (e) {
        emit(PokemonListErrorState(e.toString()));
      }
    });
  }
}
