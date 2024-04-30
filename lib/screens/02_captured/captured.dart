import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/app_blocs.dart';
import 'package:flutter_pokedex/blocs/app_events.dart';
import 'package:flutter_pokedex/blocs/app_states.dart';
import 'package:flutter_pokedex/data/pokeapi.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/style/app_styles.dart';
import 'package:flutter_pokedex/widgets/pokemon_captured.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CapturedScreen extends StatefulWidget {
  const CapturedScreen({super.key});

  @override
  State<CapturedScreen> createState() => _CapturedScreenState();
}

class _CapturedScreenState extends State<CapturedScreen> {
  late Box<Pokemon> capturedPokemons;

  @override
  void initState() {
    super.initState();
    capturedPokemons = Hive.box<Pokemon>('captured_pokemon');
  }

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
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Captured",
                      style: AppStyles.titleGallery,
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
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: GridView.builder(
                                itemCount: pokemonList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4),
                                itemBuilder: (BuildContext context, int index) {
                                  return PokemonCaptured(
                                    pokemon: pokemonList[index],
                                    isCaptured: capturedPokemons
                                        .containsKey(pokemonList[index].id),
                                  );
                                }),
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
            icon: Icon(
              Icons.explore,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              context.go('/gallery');
            },
          )),
    );
  }
}
