import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/app_blocs.dart';
import 'package:flutter_pokedex/blocs/app_events.dart';
import 'package:flutter_pokedex/blocs/app_states.dart';
import 'package:flutter_pokedex/data/pokeapi.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_pokedex/style/app_styles.dart';
import 'package:flutter_pokedex/widgets/pokemon_card.dart';
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
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Pokédex Code Challenge'),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Pokédex",
                  style: AppStyles.titleGallery,
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
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          color: Colors.red,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: pokemonList.length,
                              itemBuilder: (_, index) {
                                return PokemonCard(pokemon: pokemonList[index]);
                              }),
                        );
                      }

                      return Container();
                    },
                  ),
                ),
                const Center(child: Text('Lee el README para comenzar')),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: IconButton(
            icon: const Icon(
              Icons.catching_pokemon,
              size: 80,
              color: Colors.red,
            ),
            onPressed: () {
              context.go('/captured');
            },
          )),
    );
  }
}
