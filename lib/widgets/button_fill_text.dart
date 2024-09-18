import 'package:flutter/material.dart';
import 'package:pos_kerjaku/utils/poppins_text.dart';
import '../theme.dart';

class ButtonFillText extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const ButtonFillText({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [gradientGreenStart, gradientGreenEnd],
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: InkWell(
        onTap: onTap,
        child: Poppins.bold(text: text, color: Colors.white),
      ),
    );
  }
}

class ContainerText extends StatelessWidget {
  final String text;
  const ContainerText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Poppins.bold(text: text, color: Colors.white),
    );
  }
}
