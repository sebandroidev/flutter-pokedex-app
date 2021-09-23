import 'package:flutter/material.dart';

import 'views/screens/pokemon_screen.dart';

void main() => runApp(const PokedexApp());

class PokedexApp extends StatelessWidget {
  const PokedexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Pokedex',
      home: PokemonScreen(),
    );
  }
}
