import 'package:flutter/material.dart';

class PokemonTypeItem extends StatelessWidget {
  const PokemonTypeItem({
    Key? key,
    required this.type,
    this.isBig = false,
  }) : super(key: key);

  final String type;
  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isBig
          ? const EdgeInsets.symmetric(horizontal: 12, vertical: 6)
          : const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: isBig
          ? const EdgeInsets.only(right: 10)
          : const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius:
            isBig ? BorderRadius.circular(20) : BorderRadius.circular(10),
      ),
      child: Text(
        type,
        style: TextStyle(
          fontSize: isBig ? 14 : 11,
          fontFamily: 'Product Sans',
          color: Colors.white,
        ),
      ),
    );
  }
}
