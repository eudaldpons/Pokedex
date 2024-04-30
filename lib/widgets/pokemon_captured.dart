import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:go_router/go_router.dart';

class PokemonCaptured extends StatelessWidget {
  const PokemonCaptured(
      {super.key, required this.pokemon, required this.isCaptured});

  final Pokemon pokemon;
  final bool isCaptured;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context.go('/captured/pokemonDetails', extra: pokemon),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            fit: BoxFit.cover,
            child: CachedNetworkImage(
              imageUrl: pokemon.imageUrl,
              color: isCaptured ? null : Colors.grey,
            ),
          ),
        ));
  }
}
