import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/theme/cubit/theme_cubit.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/routes/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  await Hive.initFlutter();
  Hive.registerAdapter(PokemonAdapter());
  await Hive.openBox<Pokemon>('captured_pokemon');
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeCubit())],
      child: const Pokedex()));
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, themeData) {
        return MaterialApp.router(
          theme: themeData,
          routerConfig: AppRoutes.router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
