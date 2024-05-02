import 'package:flutter/material.dart';

class ColorFromPokemonType {
  static Color getColorByType(String type) {
    switch (type.toLowerCase()) {
      case 'bug':
        return const Color(0xFF94BC4A);
      case 'dark':
        return const Color(0xFF736C75);
      case 'dragon':
        return const Color(0xFF6A7BAF);
      case 'electric':
        return const Color(0xFFE5C531);
      case 'fairy':
        return const Color(0xFFE397D1);
      case 'fighting':
        return const Color(0xFFCB5F48);
      case 'fire':
        return const Color(0xFFEA7A3C);
      case 'flying':
        return const Color(0xFF7DA6DE);
      case 'ghost':
        return const Color(0xFF846AB6);
      case 'grass':
        return const Color(0xFF71C558);
      case 'ground':
        return const Color(0xFFCC9F4F);
      case 'ice':
        return const Color(0xFF70CBD4);
      case 'normal':
        return const Color(0xFFAAB09F);
      case 'poison':
        return const Color(0xFFB468B7);
      case 'psychic':
        return const Color(0xFFE5709B);
      case 'rock':
        return const Color(0xFFB2A061);
      case 'steel':
        return const Color(0xFF89A1B0);
      case 'water':
        return const Color(0xFF539AE2);
      default:
        return const Color(0xFFAAB09F);
    }
  }
}
