import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex/constants/app_strings.dart';

class ErrorLoadingWidget extends StatelessWidget {
  const ErrorLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              const SizedBox(height: 100),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/error.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              const Text(
                AppStrings.textErrorWidget,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          )),
    );
  }
}
