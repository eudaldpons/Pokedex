import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:go_router/go_router.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  CustomSearchDelegate(this.pokemonList);

  final List<Pokemon> pokemonList;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Pokemon> suggestionList = query.isEmpty
        ? []
        : pokemonList
            .where(
                (item) => item.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name[0].toUpperCase() +
              suggestionList[index].name.substring(1)),
          onTap: () {
            close(context, suggestionList[index].name);
            context.go('/gallery/pokemonDetails', extra: suggestionList[index]);
          },
        );
      },
    );
  }
}
