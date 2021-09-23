import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
