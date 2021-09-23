import 'package:flutter/material.dart';

class PokemonTypeItem extends StatelessWidget {
  const PokemonTypeItem({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        type,
        style: const TextStyle(
            fontSize: 11, fontFamily: 'Product Sans', color: Colors.white),
      ),
    );
  }
}
