import 'package:flutter/material.dart';
import 'package:pos_kerjaku/utils/poppins_text.dart';
import '../../theme.dart';

class NoStockCard extends StatelessWidget {
  final String title, desc;
  final int stock;
  final double price;
  NoStockCard(
      {super.key,
      required this.title,
      required this.desc,
      required this.stock,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xffE4E4E4),
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Color(0xffD9D9D9).withOpacity(0.6),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Poppins.bold(
                      text: title,
                      fontSize: 12,
                      color: black,
                    ),
                    Poppins.bold(
                      text: 'Out of stocks',
                      fontSize: 12,
                      color: danger,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Poppins.light(
                  text: desc,
                  fontSize: 8,
                  color: black,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Poppins.bold(
                  text: 'Rp. ${price.toString()}',
                  fontSize: 12,
                  color: gradientGreenStart,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
