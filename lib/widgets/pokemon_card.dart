import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:go_router/go_router.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required Pokemon pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed('/pokemonDetails'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            color: Theme.of(context).primaryColor,
            child: const ListTile(
                title: Text(
                  'Test',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'testtt',
                  style: TextStyle(color: Colors.white),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png'),
                ))),
      ),
    );
  }
}
