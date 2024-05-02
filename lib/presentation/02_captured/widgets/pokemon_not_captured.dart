import 'package:flutter/material.dart';

class PokemonNotCaptured extends StatelessWidget {
  const PokemonNotCaptured({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.question_mark,
            size: 50,
            color: Colors.grey[400],
          )),
    );
  }
}
