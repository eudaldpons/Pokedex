import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/theme/cubit/theme_cubit.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/style/app_styles.dart';
import 'package:flutter_pokedex/presentation/03_pokemon_details/widgets/button_capture.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(builder: (context, themeData) {
      return Scaffold(
        backgroundColor: themeData.primaryColor
            .withGreen((Theme.of(context).primaryColor.green + 255) ~/ 2)
            .withBlue((Theme.of(context).primaryColor.green + 255) ~/ 2)
            .withRed((Theme.of(context).primaryColor.red + 255) ~/ 2),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 100),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl: pokemon.imageUrl,
                        width: MediaQuery.of(context).size.width * 0.9,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 15),
                    child: Text(
                      "#${pokemon.id.padLeft(3, '0')}",
                      style: AppStyles.detailsPokemonId,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                  style: AppStyles.detailsPokemonName,
                ),
              ),
              Text(
                "Types: ${pokemon.types.map((type) => type).join(', ')}",
                style: AppStyles.detailsPokemonTypes,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${pokemon.height} dm",
                          style: AppStyles.detailsPokemonNumbers,
                        ),
                        const Text(
                          'HEIGHT',
                          style: AppStyles.detailsPokemonSubtitles,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "${pokemon.weight} hg",
                          style: AppStyles.detailsPokemonNumbers,
                        ),
                        const Text(
                          'WEIGHT',
                          style: AppStyles.detailsPokemonSubtitles,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ButonCaptureOrDeletePokemon(pokemon: pokemon),
            ],
          ),
        ),
      );
    });
  }
}
