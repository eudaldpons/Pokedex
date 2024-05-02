import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/storage_controller.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/style/app_spacing.dart';
import 'package:flutter_pokedex/style/app_styles.dart';
import 'package:flutter_pokedex/presentation/02_captured/widgets/pokemon_captured.dart';
import 'package:flutter_pokedex/presentation/02_captured/widgets/pokemon_not_captured.dart';
import 'package:go_router/go_router.dart';

class CapturedScreen extends StatefulWidget {
  const CapturedScreen({super.key});

  @override
  State<CapturedScreen> createState() => _CapturedScreenState();
}

class _CapturedScreenState extends State<CapturedScreen> {
  late List<Pokemon> capturedPokemons;

  @override
  void initState() {
    capturedPokemons = StorageController.getCapturedPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: kIsWeb ? true : false,
        backgroundColor: Colors.white,
        title: const Text(
          "Captured",
          style: AppStyles.titleGallery,
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(
          top: 30,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sM),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return GridView.builder(
                        itemCount: 151,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: constraints.maxWidth < 700 ? 4 : 8),
                        itemBuilder: (BuildContext context, int index) {
                          var capturedPokemon = capturedPokemons.firstWhere(
                              (pokemon) => pokemon.id == (index + 1).toString(),
                              orElse: () => Pokemon(
                                  id: '152',
                                  name: 'null',
                                  imageUrl: 'null',
                                  height: '',
                                  weight: '',
                                  types: []));
                          if (capturedPokemon.name != 'null') {
                            return PokemonCaptured(
                              pokemon: capturedPokemon,
                            );
                          } else {
                            return const PokemonNotCaptured();
                          }
                        },
                      );
                    },
                  ),
                )
              ],
            ),
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
            Icons.explore,
            size: 80,
            color: Theme.of(context).primaryColor,
          ),
        ),
        onPressed: () {
          context.go('/gallery');
        },
      ),
    );
  }
}
