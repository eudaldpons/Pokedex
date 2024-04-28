import 'package:flutter/material.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Pokédex Code Challenge'),
        ),
        body: const Center(child: Text('Lee el README para comenzar')));
  }
}
