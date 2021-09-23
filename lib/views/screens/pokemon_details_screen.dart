import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/views/utils/contants.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({Key? key, required this.pokemon})
      : super(key: key);
  final Pokemon pokemon;

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  // Functions
  Pokemon get pokemon => widget.pokemon;
  // End Functions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              color: Constants.getTypeColor(type: pokemon.type[0]),
            ),
            Positioned(
              top: -30,
              left: -90,
              child: SvgPicture.asset(
                'assets/images/blob.svg',
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            Positioned(
              right: -20,
              top: 170,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  Constants.whitePokeball,
                  height: 200,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
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
