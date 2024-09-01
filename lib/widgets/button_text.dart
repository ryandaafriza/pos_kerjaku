import 'package:flutter/material.dart';
import 'package:pos_kerjaku/utils/poppins_text.dart';
import '../theme.dart';

class ButtonText extends StatefulWidget {
  final void Function() onTap;
  final bool isActive;
  const ButtonText({super.key, required this.onTap, required this.isActive});

  @override
  State<ButtonText> createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: widget.isActive ? Color(0xffEFFDDE) : Colors.black12,
        borderRadius: BorderRadius.circular(58),
      ),
      child: InkWell(
        onTap: () {
          widget.onTap();
        },
        child: Poppins.bold(
            text: 'Dinning option',
            textAlign: TextAlign.center,
            color: widget.isActive ? gradientGreenStart : grayText),
      ),
    );
  }
}
