import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/services/local_json.dart';
import 'package:pokedex_app/views/widgets/pokemon_card.dart';

import '../utils/contants.dart';
import '../widgets/custom_icon_button.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  // State Variables
  bool _searchState = false;
  String _titleText = 'Pokedex';
  // final ApiServices _apiServices = ApiServices();
  final _localJson = LocalJson();
  // End State Variables

  // Functions
  void _switchSearchState() {
    setState(() {
      if (_searchState) {
        _searchState = false;
        _titleText = 'Pokedex';
      } else {
        _searchState = true;
        _titleText = 'Search Pokemon';
      }
    });
  }

  Future<List<Pokemon>> _getLocalPokemons(BuildContext context) async {
    List<Pokemon> pokemons = await _localJson.getLocalPokemons(context);
    return pokemons;
  }
  // End Functions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: -40,
                left: -20,
                child: Opacity(
                  opacity: .07,
                  child: Image.asset(
                    Constants.blackPokeball,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Column(
                children: [
                  _buildAppbar(),
                  _buildSearchBar(),
                  _buildPokemonList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppbar() {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              _titleText,
              style: const TextStyle(
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          CustomIconButton(
            icon: 'assets/icons/icon-search.svg',
            onPressed: _switchSearchState,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Visibility(
      visible: _searchState,
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFB1B8C7).withOpacity(0.25),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: TextField(
          style: const TextStyle(fontFamily: 'Product Sans'),
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: SvgPicture.asset('assets/icons/icon-search.svg'),
            hintText: 'Search pokemon',
          ),
        ),
      ),
    );
  }

  Widget _buildPokemonList() {
    return FutureBuilder(
      future: _getLocalPokemons(context),
      builder: (BuildContext context, AsyncSnapshot<List<Pokemon>> pokemons) {
        if (pokemons.hasData) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: pokemons.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return PokemonCard(pokemon: pokemons.data![index]);
                },
              ),
            ),
          );
        } else if (pokemons.hasError) {
          return Center(
            child: Text(pokemons.error.toString()),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
