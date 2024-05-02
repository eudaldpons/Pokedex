import 'dart:math';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:hive/hive.dart';

class StorageController {
  static const _boxName = 'captured_pokemon';

  static String capturePokemon(Pokemon pokemon) {
    try {
      var box = Hive.box<Pokemon>(_boxName);
      box.put(pokemon.id, pokemon);
      return getMostCapturedType();
    } catch (e) {
      return 'default';
    }
  }

  static String deletePokemon(Pokemon pokemon) {
    try {
      var box = Hive.box<Pokemon>(_boxName);
      box.delete(pokemon.id);
      return getMostCapturedType();
    } catch (e) {
      return 'default';
    }
  }

  static bool isCaptured(Pokemon pokemonTmp) {
    var box = Hive.box<Pokemon>(_boxName);
    return box.values.any((pokemon) => pokemon.id == pokemonTmp.id);
  }

  static List<Pokemon> getCapturedPokemons() {
    var box = Hive.box<Pokemon>(_boxName);
    return box.values.toList();
  }

  static String getMostCapturedType() {
    var box = Hive.box<Pokemon>(_boxName);
    var typeCounts = <String, int>{};
    for (var pokemon in box.values) {
      for (var type in pokemon.types) {
        typeCounts[type] = (typeCounts[type] ?? 0) + 1;
      }
    }
    var maxCount = typeCounts.values.fold(0, max);
    var maxTypes = typeCounts.entries
        .where((entry) => entry.value == maxCount)
        .map((entry) => entry.key)
        .toList();

    if (maxTypes.length > 1) {
      return 'default';
    }
    return maxTypes[0];
  }
}
