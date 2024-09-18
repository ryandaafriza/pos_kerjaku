import 'package:flutter/material.dart';
import 'package:pos_kerjaku/utils/poppins_text.dart';
import '../theme.dart';

class CardStat extends StatelessWidget {
  final IconData icon;
  final String numberStat, nameStat;
  const CardStat(
      {super.key,
      required this.icon,
      required this.numberStat,
      required this.nameStat});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        width: 145,
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientGreenStart, gradientGreenEnd],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Spacer(),
            Poppins.bold(text: numberStat, color: Colors.white),
            SizedBox(height: 4),
            Poppins.bold(text: nameStat, color: Colors.white, fontSize: 12),
          ],
        ));
  }
}
