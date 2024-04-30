import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/screens/01_gallery/gallery.dart';
import 'package:flutter_pokedex/screens/02_captured/captured.dart';
import 'package:flutter_pokedex/screens/pokemon_details.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static GoRouter router = GoRouter(
    initialLocation: '/gallery',
    routes: [
      GoRoute(
        name: 'gallery',
        path: '/gallery',
        builder: (context, state) => const PokedexGalleryScreen(),
        routes: [
          GoRoute(
              path: 'pokemonDetails',
              builder: (context, state) {
                final pokemon = state.extra as Pokemon;
                return PokemonDetailsScreen(pokemon: pokemon);
              }),
        ],
      ),
      GoRoute(
        name: 'captured',
        path: '/captured',
        builder: (context, state) => const CapturedScreen(),
        routes: [
          GoRoute(
              path: 'pokemonDetails',
              builder: (context, state) {
                final pokemon = state.extra as Pokemon;
                return PokemonDetailsScreen(pokemon: pokemon);
              }),
        ],
      ),
    ],
  );
}
