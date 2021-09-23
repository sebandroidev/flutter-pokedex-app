import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/views/utils/contants.dart';

class LocalJson {
  Future<List<Pokemon>> getLocalPokemons(BuildContext context) async {
    String pokemonListString =
        await DefaultAssetBundle.of(context).loadString(Constants.jsonLocation);

    final pokemonsMap = jsonDecode(pokemonListString);

    List<Pokemon> pokemonsList = [];

    for (var pokemon in pokemonsMap['pokemon']) {
      Pokemon pokemonItem = Pokemon.fromJson(pokemon);
      // print(pokemonItem.name);
      pokemonsList.add(pokemonItem);
    }
    return pokemonsList;
  }
}
