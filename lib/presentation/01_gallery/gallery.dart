import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/app_blocs.dart';
import 'package:flutter_pokedex/blocs/app_states.dart';
import 'package:flutter_pokedex/constants/app_strings.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/presentation/01_gallery/widgets/section_list_pokemons.dart';
import 'package:flutter_pokedex/presentation/01_gallery/widgets/section_near_pokemons.dart';
import 'package:flutter_pokedex/style/app_styles.dart';
import 'package:flutter_pokedex/presentation/01_gallery/widgets/error_widget.dart';
import 'package:flutter_pokedex/presentation/01_gallery/widgets/loading_widget.dart';
import 'package:go_router/go_router.dart';

class PokedexGalleryScreen extends StatelessWidget {
  const PokedexGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: kIsWeb ? true : false,
          backgroundColor: Colors.white,
          title: const Text(
            AppStrings.appName,
            style: AppStyles.titleGallery,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                BlocBuilder<PokemonBloc, PokemonState>(
                  builder: (context, state) {
                    if (state is PokemonListLoadingState) {
                      return const LoadingWidget();
                    }
                    if (state is PokemonListErrorState) {
                      return const ErrorLoadingWidget();
                    }
                    if (state is PokemonListLoadedState) {
                      List<Pokemon> pokemonList = state.pokemons;
                      return Column(
                        children: [
                          SectionListPokemons(pokemonList: pokemonList),
                          SectionNearPokemons(pokemonList: pokemonList)
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        ));
  }
}
