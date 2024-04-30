import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/app_blocs.dart';
import 'package:flutter_pokedex/blocs/app_events.dart';
import 'package:flutter_pokedex/blocs/app_states.dart';
import 'package:flutter_pokedex/data/pokeapi.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/style/app_spacing.dart';
import 'package:flutter_pokedex/style/app_styles.dart';
import 'package:flutter_pokedex/widgets/pokemon_card.dart';
import 'package:flutter_pokedex/widgets/pokemon_near.dart';
import 'package:go_router/go_router.dart';

class PokedexGalleryScreen extends StatelessWidget {
  const PokedexGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonBloc>(
          create: (context) => PokemonBloc(PokemonRepository()),
        ),
      ],
      child: Scaffold(
          body: SafeArea(
            minimum: const EdgeInsets.only(
              top: 30,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.sM),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pokédex",
                        style: AppStyles.titleGallery,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSpacing.sM),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSpacing.sL),
                      ),
                      onTap: () => context.go('/search'),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.sM,
                              vertical: AppSpacing.sM),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 5),
                              Text(
                                "Search a Pokémon to catch",
                                style: AppStyles.searchText,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => PokemonBloc(
                      PokemonRepository(),
                    )..add(LoadPokemonEvent()),
                    child: BlocBuilder<PokemonBloc, PokemonState>(
                      builder: (context, state) {
                        if (state is PokemonListLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is PokemonListErrorState) {
                          return const Center(child: Text("Error"));
                        }
                        if (state is PokemonListLoadedState) {
                          List<Pokemon> pokemonList = state.pokemons;
                          return Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: pokemonList.length,
                                    itemBuilder: (_, index) {
                                      return PokemonCard(
                                          pokemon: pokemonList[index]);
                                    }),
                              ),
                              const SizedBox(height: 20),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSpacing.sM),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Near you",
                                    style: AppStyles.subtitleGallery,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 6,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return PokemonNear(
                                          pokemon: pokemonList[
                                              Random().nextInt(150) + 1]);
                                    }),
                              )
                            ],
                          );
                        }

                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: IconButton(
            icon: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.catching_pokemon,
                size: 80,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {
              context.go('/captured');
            },
          )),
    );
  }
}
