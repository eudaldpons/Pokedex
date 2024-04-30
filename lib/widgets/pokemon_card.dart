import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/style/app_styles.dart';
import 'package:go_router/go_router.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context.go('/gallery/pokemonDetails', extra: pokemon),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.52,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.2,
                        bottom: 22),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.52,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.11),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Text(
                              pokemon.name[0].toUpperCase() +
                                  pokemon.name.substring(1),
                              style: AppStyles.galleryPokemonName),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Height',
                                    style: AppStyles.galleryPokemonInfoSubtitle,
                                  ),
                                  Text("${pokemon.height} dm"),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Weight',
                                    style: AppStyles.galleryPokemonInfoSubtitle,
                                  ),
                                  Text("${pokemon.weight} hg"),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "#${pokemon.id.padLeft(3, '0')}",
                            style: AppStyles.galleryPokemonId,
                          )
                        ],
                      ),
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: pokemon.imageUrl,
                    width: MediaQuery.of(context).size.width * 0.45,
                  ),
                  Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Capture',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ))
                ],
              )),
        ));
  }
}
