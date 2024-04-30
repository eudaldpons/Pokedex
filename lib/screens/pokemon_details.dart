import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/style/app_styles.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({super.key, required this.pokemon});

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context)
          .primaryColor
          .withGreen((Theme.of(context).primaryColor.green + 255) ~/ 2)
          .withBlue((Theme.of(context).primaryColor.green + 255) ~/ 2)
          .withRed((Theme.of(context).primaryColor.red + 255) ~/ 2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 100),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  ],
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3.0, horizontal: 15),
                  child: Text(
                    "#${pokemon.id.padLeft(3, '0')}",
                    style: AppStyles.detailsPokemonId,
                  ),
                )),
            Text(pokemon.name[0].toUpperCase() + pokemon.name.substring(1)),
          ],
        ),
      ),
    );
  }
}
