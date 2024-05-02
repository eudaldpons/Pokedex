import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/theme/cubit/theme_cubit.dart';
import 'package:flutter_pokedex/constants/app_strings.dart';
import 'package:flutter_pokedex/data/storage_controller.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/style/app_styles.dart';

class ButonCaptureOrDeletePokemon extends StatefulWidget {
  const ButonCaptureOrDeletePokemon({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<ButonCaptureOrDeletePokemon> createState() =>
      _ButonCaptureDeletePokemonState();
}

class _ButonCaptureDeletePokemonState
    extends State<ButonCaptureOrDeletePokemon> {
  bool _isCaptured = false;

  @override
  void initState() {
    _isCaptured = StorageController.isCaptured(widget.pokemon);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isCaptured) {
      return GestureDetector(
        onTap: () async {
          var newTheme = StorageController.deletePokemon(widget.pokemon);
          context.read<ThemeCubit>().changeTheme(newTheme);
          setState(() {
            _isCaptured = false;
          });
        },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              AppStrings.deletePokemon,
              style: AppStyles.textDeletePokemon,
            )),
      );
    } else {
      return GestureDetector(
        onTap: () {
          var newTheme = StorageController.capturePokemon(widget.pokemon);
          context.read<ThemeCubit>().changeTheme(newTheme);
          setState(() {
            _isCaptured = true;
          });
        },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(2),
            ),
            child: const Text(
              AppStrings.capturePokemon,
              style: AppStyles.textCapturePokemon,
            )),
      );
    }
  }
}
