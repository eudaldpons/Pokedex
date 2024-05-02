import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/app_strings.dart';
import 'package:flutter_pokedex/data/custom_search_delegate.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/style/app_spacing.dart';
import 'package:flutter_pokedex/style/app_styles.dart';
import 'package:flutter_pokedex/widgets/pokemon_card.dart';

class SectionListPokemons extends StatefulWidget {
  const SectionListPokemons({super.key, required this.pokemonList});

  final List<Pokemon> pokemonList;

  @override
  State<SectionListPokemons> createState() => _SectionListPokemonsState();
}

class _SectionListPokemonsState extends State<SectionListPokemons> {
  String sortBy = 'id';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sM),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.sL),
                  ),
                  onTap: () async {
                    await showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(widget.pokemonList),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.sM, vertical: AppSpacing.sM),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 5),
                          Text(
                            AppStrings.textSearchBar,
                            style: AppStyles.searchText,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (sortBy == 'id') {
                        widget.pokemonList
                            .sort((a, b) => a.name.compareTo(b.name));
                        sortBy = 'name';
                      } else if (sortBy == 'name') {
                        widget.pokemonList
                            .sort((a, b) => a.types[0].compareTo(b.types[0]));
                        sortBy = 'type';
                      } else {
                        widget.pokemonList.sort((a, b) =>
                            int.parse(a.id).compareTo(int.parse(b.id)));
                        sortBy = 'id';
                      }
                    });
                  },
                  child: SizedBox(
                    width: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Sorted by $sortBy",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 239, 188, 69)),
                        ),
                        const Icon(
                          Icons.sort_rounded,
                          color: Color.fromARGB(255, 239, 188, 69),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.pokemonList.length,
                itemBuilder: (_, index) {
                  return PokemonCard(pokemon: widget.pokemonList[index]);
                }),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
