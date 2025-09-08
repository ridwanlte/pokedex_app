import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokedex_app/core/styles/style_color.dart';
import 'package:pokedex_app/features/home/data/datasources/pokemon_datasource.dart';
import 'package:pokedex_app/features/home/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_app/features/home/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_app/features/home/presentations/bloc/bottomnavbar_bloc.dart';
import 'package:pokedex_app/features/home/presentations/bloc/pokemon_bloc.dart';
import 'package:pokedex_app/routes/app_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final tempDir = await getTemporaryDirectory();
  PokemonRepository pokemonRepository =
      PokemonRepositoryImpl(PokemonDatasource());
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => PokemonBloc(pokemonRepository)..add(GetAllPokemon()),
      child: MyApp(),
    ),
    BlocProvider(create: (context) => BottomnavbarBloc(), child: MyApp())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokedex App',
      theme: ThemeData(
        scaffoldBackgroundColor: StyleColor.white,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: StyleColor.white),
        useMaterial3: true,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: PredictiveBackPageTransitionsBuilder()
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppPage.router,
    );
  }
}
