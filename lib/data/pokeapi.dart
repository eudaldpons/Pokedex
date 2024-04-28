import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';

class PokemonRepository {
  String pokemonUrl = 'https://pokeapi.co/api/v2/pokemon/?limit=151&offset=0';

  Future<List<Pokemon>> getPokemons() async {
    Response response = await Dio().get(pokemonUrl);

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.data)['data']['results'];
      return result.map((e) => Pokemon.fromJson(e)).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
