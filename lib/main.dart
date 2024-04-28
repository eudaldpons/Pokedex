import 'package:flutter/material.dart';
import 'package:flutter_pokedex/screens/01_gallery/gallery.dart';
import 'package:flutter_pokedex/screens/02_captured/captured.dart';
import 'package:flutter_pokedex/screens/pokemon_details.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const Pokedex());
}

final _router = GoRouter(
  initialLocation: '/gallery',
  routes: [
    GoRoute(
      name: 'gallery',
      path: '/gallery',
      builder: (context, state) => PokedexGalleryScreen(),
    ),
    GoRoute(
      name: 'captured',
      path: '/captured',
      builder: (context, state) => CapturedScreen(),
    ),
    GoRoute(
      name: 'pokemonDetails',
      path: '/pokemonDetails',
      builder: (context, state) => PokemonDetailsScreen(),
    ),
  ],
);

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Pokédex Code Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ),
      ),
    );
  }
}
