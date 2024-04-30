import 'package:flutter/material.dart';
import 'package:flutter_pokedex/style/app_theme.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeData> {
  ThemeCubit() : super(AppTheme.defaultTheme);

  final ThemeData _theme = AppTheme.defaultTheme;

  ThemeData get theme => _theme;

  @override
  ThemeData fromJson(Map<String, dynamic> json) {
    return getThemeFromString(json['theme'].toString());
  }

  @override
  Map<String, dynamic>? toJson(ThemeData state) {
    return <String, String>{'theme': getStringFromTheme(state)};
  }

  void changeTheme(String themeString) {
    emit((getThemeFromString(themeString)));
  }

  ThemeData getThemeFromString(String theme) {
    switch (theme) {
      case 'default':
        return AppTheme.defaultTheme;
      case 'bug':
        return AppTheme.bugTheme;
      case 'dark':
        return AppTheme.darkTheme;
      case 'dragon':
        return AppTheme.dragonTheme;
      case 'electric':
        return AppTheme.electricTheme;
      case 'fairy':
        return AppTheme.fairyTheme;
      case 'fighting':
        return AppTheme.fightingTheme;
      case 'fire':
        return AppTheme.fireTheme;
      case 'flying':
        return AppTheme.flyingTheme;
      case 'ghost':
        return AppTheme.ghostTheme;
      case 'grass':
        return AppTheme.grassTheme;
      case 'ground':
        return AppTheme.groundTheme;
      case 'ice':
        return AppTheme.iceTheme;
      case 'normal':
        return AppTheme.normalTheme;
      case 'poison':
        return AppTheme.poisonTheme;
      case 'psychic':
        return AppTheme.psychicTheme;
      case 'rock':
        return AppTheme.rockTheme;
      case 'steel':
        return AppTheme.steelTheme;
      case 'water':
        return AppTheme.waterTheme;
      default:
        return AppTheme.defaultTheme;
    }
  }

  String getStringFromTheme(ThemeData theme) {
    if (theme == AppTheme.defaultTheme) {
      return 'default';
    } else if (theme == AppTheme.bugTheme) {
      return 'bug';
    } else if (theme == AppTheme.darkTheme) {
      return 'dark';
    } else if (theme == AppTheme.dragonTheme) {
      return 'dragon';
    } else if (theme == AppTheme.electricTheme) {
      return 'electric';
    } else if (theme == AppTheme.fairyTheme) {
      return 'fairy';
    } else if (theme == AppTheme.fightingTheme) {
      return 'fighting';
    } else if (theme == AppTheme.fireTheme) {
      return 'fire';
    } else if (theme == AppTheme.flyingTheme) {
      return 'flying';
    } else if (theme == AppTheme.ghostTheme) {
      return 'ghost';
    } else if (theme == AppTheme.grassTheme) {
      return 'grass';
    } else if (theme == AppTheme.groundTheme) {
      return 'ground';
    } else if (theme == AppTheme.iceTheme) {
      return 'ice';
    } else if (theme == AppTheme.normalTheme) {
      return 'normal';
    } else if (theme == AppTheme.poisonTheme) {
      return 'poison';
    } else if (theme == AppTheme.psychicTheme) {
      return 'psychic';
    } else if (theme == AppTheme.rockTheme) {
      return 'rock';
    } else if (theme == AppTheme.steelTheme) {
      return 'steel';
    } else if (theme == AppTheme.waterTheme) {
      return 'water';
    } else {
      return 'default';
    }
  }
}
