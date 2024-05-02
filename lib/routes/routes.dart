import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/presentation/01_gallery/gallery.dart';
import 'package:flutter_pokedex/presentation/02_captured/captured.dart';
import 'package:flutter_pokedex/presentation/03_pokemon_details/pokemon_details.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static GoRouter router = GoRouter(
    initialLocation: '/gallery',
    routes: [
      GoRoute(
        name: 'gallery',
        path: '/gallery',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PokedexGalleryScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
        routes: [
          GoRoute(
            path: 'pokemonDetails',
            builder: (context, state) {
              final pokemon = state.extra as Pokemon;
              return PokemonDetailsScreen(pokemon: pokemon);
            },
          ),
        ],
      ),
      GoRoute(
        name: 'captured',
        path: '/captured',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const CapturedScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
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
