import 'package:flutter/material.dart';
import 'package:pos_kerjaku/utils/poppins_text.dart';
import '../../theme.dart';

class SnackMenu extends StatelessWidget {
  const SnackMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Color(0xffE4E4E4),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Poppins.bold(
                text: 'Snack Bakar',
                fontSize: 12,
                color: black,
              ),
              const SizedBox(height: 8),
              Poppins.light(
                text:
                    'Burger dengan isian daging sapi bakar+selada+keju+pickles.',
                fontSize: 8,
                color: black,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Poppins.bold(
                text: 'Rp. 40.000,00',
                fontSize: 12,
                color: gradientGreenStart,
              ),
            ],
          ),
        );
      },
    );
  }
}
