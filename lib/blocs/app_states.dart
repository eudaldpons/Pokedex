import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.dart';

@immutable
abstract class PokemonState extends Equatable {}

class PokemonListLoadingState extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonListLoadedState extends PokemonState {
  final List<Pokemon> pokemons;
  PokemonListLoadedState(this.pokemons);
  @override
  List<Object?> get props => [pokemons];
}

class PokemonListErrorState extends PokemonState {
  final String error;
  PokemonListErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
