import 'package:dio/dio.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';

class PokemonRepository {
  String pokemonUrl = 'https://pokeapi.co/api/v2/pokemon/?limit=151&offset=0';

  Future<List<Pokemon>> getPokemons() async {
    try {
      Response responsePage = await Dio().get(pokemonUrl);

      if (responsePage.statusCode == 200) {
        final List<dynamic> pokemonList = responsePage.data['results'];

        final List<Response> pokemonDetails = await Future.wait(
          pokemonList.map((pokemon) => Dio().get(pokemon['url'])),
        );

        final List<Pokemon> pokemons = pokemonDetails.map((response) {
          return Pokemon.fromJson(response.data);
        }).toList();
        return pokemons;
      } else {
        throw Exception(responsePage.statusMessage);
      }
    } catch (e) {
      throw Exception('Error al obtener los Pokémon: $e');
    }
  }
}
