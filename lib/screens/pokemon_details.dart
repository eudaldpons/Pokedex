import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({
    super.key,
  });
  //required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
            "tmp"), //Text(pokemon.name[0].toUpperCase() + pokemon.name.substring(1)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.red,
              child: CachedNetworkImage(
                imageUrl: "pokemon.imageUrl",
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
            Text('Details')
          ],
        ),
      ),
    );
  }
}
