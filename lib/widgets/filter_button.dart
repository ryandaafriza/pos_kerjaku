import 'package:flutter/material.dart';
import 'package:pos_kerjaku/utils/poppins_text.dart';
import '../theme.dart';

class FilterButton extends StatefulWidget {
  final String text;
  final bool isActive;
  final void Function() onTap;
  const FilterButton(
      {super.key,
      required this.text,
      required this.isActive,
      required this.onTap});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.5, horizontal: 16),
      decoration: BoxDecoration(
          color: widget.isActive ? Color(0xffFFF5EE) : Colors.white,
          border: Border.all(
            color:
                widget.isActive ? gradientGreenStart : const Color(0xffE4E4E4),
          ),
          borderRadius: BorderRadius.circular(40)),
      child: InkWell(
        onTap: widget.onTap,
        child: Center(
          child: Poppins.bold(
            text: widget.text,
            fontSize: 12,
            color:
                widget.isActive ? gradientGreenStart : const Color(0xff19191C),
          ),
        ),
      ),
    );
  }
}
