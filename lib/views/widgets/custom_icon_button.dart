import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.isWhite = false})
      : super(key: key);

  final String icon;
  final bool isWhite;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: SvgPicture.asset(icon,
            color: isWhite ? Colors.white : Colors.black),
      ),
    );
  }
}
