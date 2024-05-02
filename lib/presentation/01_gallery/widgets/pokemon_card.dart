import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/style/app_styles.dart';
import 'package:flutter_pokedex/style/types_color.dart';
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
              width: 200,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 20),
                    child: Container(
                      padding: const EdgeInsets.only(top: 80),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 41, 53, 141),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              pokemon.name[0].toUpperCase() +
                                  pokemon.name.substring(1),
                              style: AppStyles.galleryPokemonName),
                          SizedBox(
                            height: 20,
                            child: Center(
                              child: ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 10,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: pokemon.types.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          ColorFromPokemonType.getColorByType(
                                              pokemon.types[index]),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                        pokemon.types[index][0].toUpperCase() +
                                            pokemon.types[index].substring(1),
                                        style: AppStyles.cardPokemonTypes),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Height',
                                    style: AppStyles.galleryPokemonInfoSubtitle,
                                  ),
                                  Text(
                                    "${pokemon.height}dm",
                                    style: AppStyles.cardPokemonInfo,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Weight',
                                    style: AppStyles.galleryPokemonInfoSubtitle,
                                  ),
                                  Text(
                                    "${pokemon.weight}hg",
                                    style: AppStyles.cardPokemonInfo,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: pokemon.imageUrl,
                    width: 200,
                  ),
                  Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 239, 188, 69),
                        ),
                        onPressed: () {},
                        child: Text(
                          "#${pokemon.id.padLeft(3, '0')}",
                          style: AppStyles.galleryPokemonId,
                        ),
                      ))
                ],
              )),
        ));
  }
}
