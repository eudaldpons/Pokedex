import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/app_strings.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/style/app_spacing.dart';
import 'package:flutter_pokedex/style/app_styles.dart';
import 'package:flutter_pokedex/widgets/pokemon_near.dart';

class SectionNearPokemons extends StatelessWidget {
  const SectionNearPokemons({super.key, required this.pokemonList});

  final List<Pokemon> pokemonList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.sM),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.nearYou,
                style: AppStyles.subtitleGallery,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: constraints.maxWidth < 700 ? 3 : 6),
                    itemBuilder: (BuildContext context, int index) {
                      return PokemonNear(
                          pokemon: pokemonList[Random().nextInt(150) + 1]);
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
