import 'package:flutter/material.dart';
import 'package:pos_kerjaku/services/order_service.dart';
import 'package:pos_kerjaku/widgets/diningMenu/available_stock.dart';
import 'package:pos_kerjaku/widgets/diningMenu/no_stock.dart';

class BreadMenu extends StatefulWidget {
  const BreadMenu({super.key});

  @override
  State<BreadMenu> createState() => _BreadMenuState();
}

class _BreadMenuState extends State<BreadMenu> {
  final Map<int, int> _selectedQuantity = {};
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: breadData.length,
      itemBuilder: (context, index) {
        final breadItem = breadData[index];

        Map<String, dynamic> orderData = {
          'title': breadItem['Name'],
          'quantity': _selectedQuantity[index] ?? 0,
          'notes': noteController.text.isNotEmpty ? noteController.text : '-',
          'total': ((breadItem['Price'] as double?) ?? 0) *
              (_selectedQuantity[index] ?? 0),
        };

        if (breadItem['Quantity'] == 0) {
          return NoStockCard(
              title: breadItem['Name'] as String,
              desc: breadItem['Desc'] as String,
              price: breadItem['Price'] as double,
              stock: breadItem['Quantity'] as int);
        }

        if (!_selectedQuantity.containsKey(index)) {
          _selectedQuantity[index] = 0;
        }

        return AvailableStock(
          title: breadItem['Name'] as String,
          desc: breadItem['Desc'] as String,
          stock: breadItem['Quantity'] as int,
          price: breadItem['Price'] as double,
          currentQuantity: _selectedQuantity[index]!,
          // onAdd: () {
          //   setState(() {
          //     final int maxQuantity = breadItem['Quantity'] as int;
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

final breadData = [
  {
    'Name': 'Baguette',
    'Desc':
        'Roti Prancis yang panjang dan tipis, dengan kerak renyah dan daging roti lembut di dalamnya.',
    'Quantity': 0,
    'Price': 25000,
  },
  {
    'Name': 'Sourdough',
    'Desc':
        'Roti dengan rasa asam khas yang dihasilkan dari fermentasi alami, dengan kerak yang renyah dan daging roti lembut.',
    'Quantity': 20,
    'Price': 35000,
  },
  {
    'Name': 'Ciabatta',
    'Desc':
        'Roti Italia dengan tekstur berpori, kerak renyah, dan daging roti yang lembut.',
    'Quantity': 25,
    'Price': 30000,
  },
  {
    'Name': 'Focaccia',
    'Desc':
        'Roti Italia datar yang biasanya diolesi dengan minyak zaitun dan ditaburi dengan rempah-rempah atau bahan tambahan lainnya.',
    'Quantity': 0,
    'Price': 32000,
  },
  {
    'Name': 'Rye Bread',
    'Desc':
        'Roti yang terbuat dari tepung gandum hitam dengan rasa sedikit asam dan tekstur padat.',
    'Quantity': 15,
    'Price': 28000,
  },
  {
    'Name': 'Multigrain Bread',
    'Desc':
        'Roti yang terbuat dari berbagai jenis biji-bijian dan biji-bijian, memberikan rasa yang kaya dan tekstur yang beragam.',
    'Quantity': 22,
    'Price': 33000,
  },
  {
    'Name': 'Brioche',
    'Desc':
        'Roti Prancis yang lembut dan manis dengan tekstur ringan, sering kali digunakan untuk membuat roti panggang atau hamburger.',
    'Quantity': 10,
    'Price': 40000,
  },
  {
    'Name': 'Whole Wheat Bread',
    'Desc':
        'Roti yang dibuat dari tepung gandum utuh, kaya serat dan memiliki rasa yang lebih dalam dibandingkan roti putih.',
    'Quantity': 25,
    'Price': 27000,
  },
  {
    'Name': 'Pita Bread',
    'Desc':
        'Roti datar yang biasanya memiliki kantong di tengahnya, ideal untuk diisi dengan berbagai bahan.',
    'Quantity': 0,
    'Price': 25000,
  },
  {
    'Name': 'Challah',
    'Desc':
        'Roti manis dan lembut khas Yahudi yang biasanya dipanggang dalam bentuk anyaman.',
    'Quantity': 12,
    'Price': 35000,
  },
  {
    'Name': 'English Muffins',
    'Desc':
        'Roti kecil berbentuk bundar dengan tekstur berpori, sering kali dipanggang dan digunakan untuk sandwich sarapan.',
    'Quantity': 20,
    'Price': 28000,
  },
  {
    'Name': 'Garlic Bread',
    'Desc':
        'Roti yang diolesi dengan mentega bawang putih dan dipanggang hingga renyah, sering disajikan sebagai pendamping.',
    'Quantity': 15,
    'Price': 30000,
  },
  {
    'Name': 'Cornbread',
    'Desc':
        'Roti manis yang dibuat dengan tepung jagung, biasanya memiliki tekstur berbutir dan rasa yang sedikit manis.',
    'Quantity': 0,
    'Price': 32000,
  },
  {
    'Name': 'Pretzels',
    'Desc':
        'Roti yang dipanggang dengan bentuk khusus dan dilapisi dengan garam, memiliki kerak renyah dan daging roti lembut.',
    'Quantity': 25,
    'Price': 35000,
  },
];
