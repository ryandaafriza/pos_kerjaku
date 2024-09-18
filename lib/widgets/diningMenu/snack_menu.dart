import 'package:flutter/material.dart';
import 'package:pos_kerjaku/services/order_service.dart';
import 'package:pos_kerjaku/widgets/diningMenu/available_stock.dart';
import 'package:pos_kerjaku/widgets/diningMenu/no_stock.dart';

class SnackMenu extends StatefulWidget {
  const SnackMenu({super.key});

  @override
  State<SnackMenu> createState() => _SnackMenuState();
}

class _SnackMenuState extends State<SnackMenu> {
  final Map<int, int> _selectedQuantity = {};
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snackData.length,
      itemBuilder: (context, index) {
        final snackItem = snackData[index];

        Map<String, dynamic> orderData = {
          'title': snackItem['Name'],
          'quantity': _selectedQuantity[index] ?? 0,
          'notes': noteController.text.isNotEmpty ? noteController.text : '-',
          'total': ((snackItem['Price'] as double?) ?? 0) *
              (_selectedQuantity[index] ?? 0),
        };

        if (snackItem['Quantity'] == 0) {
          return NoStockCard(
              title: snackItem['Name'] as String,
              desc: snackItem['Desc'] as String,
              price: snackItem['Price'] as double,
              stock: snackItem['Quantity'] as int);
        }

        if (!_selectedQuantity.containsKey(index)) {
          _selectedQuantity[index] = 0;
        }

        return AvailableStock(
          title: snackItem['Name'] as String,
          desc: snackItem['Desc'] as String,
          stock: snackItem['Quantity'] as int,
          price: snackItem['Price'] as double,
          currentQuantity: _selectedQuantity[index]!,
          // onAdd: () {
          //   setState(() {
          //     final int maxQuantity = snackItem['Quantity'] as int;
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

final snackData = [
  {
    'Name': 'Potato Chips',
    'Desc': 'Keripik kentang renyah dengan berbagai rasa, cocok untuk camilan.',
    'Quantity': 25,
    'Price': 15000,
  },
  {
    'Name': 'Pretzels',
    'Desc': 'Camilan gurih berbentuk khas dengan kerak renyah dan rasa asin.',
    'Quantity': 0,
    'Price': 20000,
  },
  {
    'Name': 'Nuts Mix',
    'Desc':
        'Campuran kacang-kacangan panggang, termasuk almond, kenari, dan cashew.',
    'Quantity': 10,
    'Price': 25000,
  },
  {
    'Name': 'Granola Bars',
    'Desc': 'Bar sehat yang terbuat dari granola, madu, dan buah kering.',
    'Quantity': 5,
    'Price': 18000,
  },
  {
    'Name': 'Popcorn',
    'Desc': 'Camilan popcorn gurih dan renyah, cocok untuk menonton film.',
    'Quantity': 30,
    'Price': 12000,
  },
  {
    'Name': 'Cheese Sticks',
    'Desc':
        'Stik keju yang digoreng dengan lapisan tepung roti, lezat dan gurih.',
    'Quantity': 0,
    'Price': 22000,
  },
  {
    'Name': 'Fruit Chips',
    'Desc':
        'Keripik buah kering dari berbagai jenis buah, camilan sehat dan renyah.',
    'Quantity': 12,
    'Price': 17000,
  },
  {
    'Name': 'Cookies',
    'Desc':
        'Kue kering yang manis dan lezat dengan berbagai rasa, seperti coklat chip atau oatmeal.',
    'Quantity': 8,
    'Price': 20000,
  },
  {
    'Name': 'Trail Mix',
    'Desc':
        'Campuran kacang, buah kering, dan coklat, ideal untuk energi ekstra.',
    'Quantity': 15,
    'Price': 22000,
  },
  {
    'Name': 'Rice Cakes',
    'Desc':
        'Kue beras ringan dan renyah, bisa dimakan dengan berbagai topping.',
    'Quantity': 0,
    'Price': 15000,
  },
];
