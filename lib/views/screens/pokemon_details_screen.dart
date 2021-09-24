import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/views/utils/contants.dart';
import 'package:pokedex_app/views/widgets/custom_icon_button.dart';
import 'package:pokedex_app/views/widgets/pokemon_type_item.dart';

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
            SafeArea(
              child: Expanded(
                child: Column(
                  children: [
                    _buildAppbar(),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pokemon.name,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontFamily: 'Product Sans',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      for (var type in pokemon.type)
                                        PokemonTypeItem(
                                          type: type,
                                          isBig: true,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                '#${pokemon.numPokemon}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Product Sans',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          CachedNetworkImage(
                            imageUrl: pokemon.image,
                            height: 200,
                            width: 200,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    )),
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF0F2F6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppbar() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
        bottom: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: 'assets/icons/icon-arrow-back.svg',
            onPressed: () {
              Navigator.of(context).pop();
            },
            isWhite: true,
          ),
          CustomIconButton(
            icon: 'assets/icons/heart.svg',
            onPressed: () {},
            isWhite: true,
          ),
        ],
      ),
    );
  }
}
