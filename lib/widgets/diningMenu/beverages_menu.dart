import 'package:flutter/material.dart';
import 'package:pos_kerjaku/services/order_service.dart';
import 'package:pos_kerjaku/widgets/diningMenu/available_stock.dart';
import 'package:pos_kerjaku/widgets/diningMenu/no_stock.dart';

class BeveragesMenu extends StatefulWidget {
  const BeveragesMenu({super.key});

  @override
  State<BeveragesMenu> createState() => _BeveragesMenuState();
}

class _BeveragesMenuState extends State<BeveragesMenu> {
  final Map<int, int> _selectedQuantity = {};
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: beverageData.length,
      itemBuilder: (context, index) {
        final beverageItem = beverageData[index];

        Map<String, dynamic> orderData = {
          'title': beverageItem['Name'],
          'quantity': _selectedQuantity[index] ?? 0,
          'notes': noteController.text.isNotEmpty ? noteController.text : '-',
          'total': ((beverageItem['Price'] as double?) ?? 0) *
              (_selectedQuantity[index] ?? 0),
        };

        if (beverageItem['Quantity'] == 0) {
          return NoStockCard(
              title: beverageItem['Name'] as String,
              desc: beverageItem['Desc'] as String,
              price: beverageItem['Price'] as double,
              stock: beverageItem['Quantity'] as int);
        }

        if (!_selectedQuantity.containsKey(index)) {
          _selectedQuantity[index] = 0;
        }

        return AvailableStock(
          title: beverageItem['Name'] as String,
          desc: beverageItem['Desc'] as String,
          stock: beverageItem['Quantity'] as int,
          price: beverageItem['Price'] as double,
          currentQuantity: _selectedQuantity[index]!,
          // onAdd: () {
          //   setState(() {
          //     final int maxQuantity = beverageItem['Quantity'] as int;
          //     if (_selectedQuantity[index]! < maxQuantity) {
          //       _selectedQuantity[index] = _selectedQuantity[index]! + 1;
          //     }
          //   });
          // },
          // onRemove: () {
          //   setState(() {
          //     if (_selectedQuantity[index]! > 0) {
          //       _selectedQuantity[index] = _selectedQuantity[index]! - 1;
          //     }
          //   });
          // },
          onQuantityChange: (newQuantity) {
            setState(() {
              _selectedQuantity[index] = newQuantity;
            });
          },
          onAddOrder: (orderData) {
            Order.addOrderToList(orderData);
          },
          orderData: orderData,
        );
      },
    );
  }
}

final beverageData = [
  {
    'Name': 'Iced Tea',
    'Desc': 'Teh dingin yang disajikan dengan es batu dan lemon.',
    'Quantity': 20,
    'Price': 15000,
  },
  {
    'Name': 'Hot Chocolate',
    'Desc': 'Minuman cokelat panas yang lembut dengan topping krim kocok.',
    'Quantity': 12,
    'Price': 25000,
  },
  {
    'Name': 'Green Smoothie',
    'Desc': 'Smoothie segar berbasis sayuran hijau dengan rasa buah.',
    'Quantity': 18,
    'Price': 30000,
  },
  {
    'Name': 'Lemonade',
    'Desc': 'Minuman segar dari lemon yang diperas dengan sedikit gula.',
    'Quantity': 25,
    'Price': 20000,
  },
  {
    'Name': 'Matcha Latte',
    'Desc':
        'Minuman latte dengan bubuk matcha yang memberikan rasa khas dan warna hijau.',
    'Quantity': 10,
    'Price': 35000,
  },
  {
    'Name': 'Chai Latte',
    'Desc': 'Latte dengan campuran teh chai dan rempah-rempah khas.',
    'Quantity': 8,
    'Price': 30000,
  },
  {
    'Name': 'Fruit Punch',
    'Desc': 'Campuran jus buah-buahan yang menyegarkan dan penuh warna.',
    'Quantity': 15,
    'Price': 25000,
  },
  {
    'Name': 'Coconut Water',
    'Desc': 'Air kelapa segar yang alami dan menyegarkan.',
    'Quantity': 30,
    'Price': 20000,
  },
  {
    'Name': 'Berry Smoothie',
    'Desc': 'Smoothie yang terbuat dari berbagai jenis beri segar.',
    'Quantity': 22,
    'Price': 32000,
  },
  {
    'Name': 'Mint Mojito',
    'Desc': 'Minuman berbasis mint dengan soda dan sedikit lemon.',
    'Quantity': 14,
    'Price': 27000,
  },
  {
    'Name': 'Cold Brew Tea',
    'Desc':
        'Teh yang diseduh dingin untuk rasa yang lebih ringan dan menyegarkan.',
    'Quantity': 18,
    'Price': 22000,
  },
  {
    'Name': 'Hot Apple Cider',
    'Desc': 'Minuman apel panas dengan rasa kayu manis dan rempah-rempah.',
    'Quantity': 11,
    'Price': 28000,
  },
  {
    'Name': 'Iced Coffee',
    'Desc': 'Kopi dingin yang disajikan dengan es batu dan sedikit susu.',
    'Quantity': 13,
    'Price': 27000,
  },
  {
    'Name': 'Almond Milk Latte',
    'Desc':
        'Latte dengan susu almond yang memberikan rasa yang unik dan lembut.',
    'Quantity': 16,
    'Price': 34000,
  },
];
