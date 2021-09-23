import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/views/screens/pokemon_details_screen.dart';
import 'package:pokedex_app/views/utils/contants.dart';

import 'pokemon_type_item.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PokemonDetailsScreen(pokemon: pokemon),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Constants.getTypeColor(type: pokemon.type[0]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              right: -10,
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(Constants.whitePokeball, height: 100),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        (pokemon.name.length > 10)
                            ? '${pokemon.name.substring(0, 10)}...'
                            : pokemon.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          color: Colors.white,
                          fontSize: (pokemon.name.length > 10) ? 14 : 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      for (var type in pokemon.type)
                        PokemonTypeItem(type: type),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.image,
                      fit: BoxFit.contain,
                      placeholder: (context, image) =>
                          const CupertinoActivityIndicator(),
                      height: 62,
                      width: 62,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
