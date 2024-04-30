import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:go_router/go_router.dart';

class PokemonNear extends StatelessWidget {
  const PokemonNear({super.key, required this.pokemon});

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context.go('/gallery/pokemonDetails', extra: pokemon),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            fit: BoxFit.cover,
            child: CachedNetworkImage(
              imageUrl: pokemon.imageUrl,
            ),
          ),
        ));
  }
}
