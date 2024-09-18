import 'package:flutter/material.dart';
import 'package:pos_kerjaku/services/order_service.dart';
import 'package:pos_kerjaku/widgets/diningMenu/available_stock.dart';
import 'package:pos_kerjaku/widgets/diningMenu/no_stock.dart';

class AppetizerMenu extends StatefulWidget {
  const AppetizerMenu({super.key});

  @override
  State<AppetizerMenu> createState() => _AppetizerMenuState();
}

class _AppetizerMenuState extends State<AppetizerMenu> {
  final Map<int, int> _selectedQuantity = {};
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appetizerData.length,
      itemBuilder: (context, index) {
        final appetizerItem = appetizerData[index];

        Map<String, dynamic> orderData = {
          'title': appetizerItem['Name'],
          'quantity': _selectedQuantity[index] ?? 0,
          'notes': noteController.text.isNotEmpty ? noteController.text : '-',
          'total': ((appetizerItem['Price'] as double?) ?? 0) *
              (_selectedQuantity[index] ?? 0),
        };

        if (appetizerItem['Quantity'] == 0) {
          return NoStockCard(
              title: appetizerItem['Name'] as String,
              desc: appetizerItem['Desc'] as String,
              price: appetizerItem['Price'] as double,
              stock: appetizerItem['Quantity'] as int);
        }

        if (!_selectedQuantity.containsKey(index)) {
          _selectedQuantity[index] = 0;
        }

        return AvailableStock(
          title: appetizerItem['Name'] as String,
          desc: appetizerItem['Desc'] as String,
          stock: appetizerItem['Quantity'] as int,
          price: appetizerItem['Price'] as double,
          currentQuantity: _selectedQuantity[index]!,
          // onAdd: () {
          //   setState(() {
          //     final int maxQuantity = appetizerItem['Quantity'] as int;
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

final appetizerData = [
  {
    'Name': 'Spring Rolls',
    'Desc':
        'Rolls sayuran segar dalam kulit tipis yang digoreng renyah, disajikan dengan saus celup.',
    'Quantity': 20,
    'Price': 45000,
  },
  {
    'Name': 'Bruschetta',
    'Desc':
        'Roti panggang dengan topping tomat segar, basil, dan minyak zaitun.',
    'Quantity': 15,
    'Price': 40000,
  },
  {
    'Name': 'Stuffed Mushrooms',
    'Desc':
        'Jamur yang diisi dengan campuran keju dan bumbu, kemudian dipanggang.',
    'Quantity': 12,
    'Price': 50000,
  },
  {
    'Name': 'Chicken Wings',
    'Desc':
        'Sayap ayam yang digoreng dan dibumbui dengan saus pedas atau manis.',
    'Quantity': 25,
    'Price': 55000,
  },
  {
    'Name': 'Nachos',
    'Desc':
        'Keripik tortilla yang disajikan dengan keju leleh, salsa, dan guacamole.',
    'Quantity': 18,
    'Price': 60000,
  },
  {
    'Name': 'Mozzarella Sticks',
    'Desc':
        'Stik keju mozzarella yang digoreng dengan balutan tepung roti, disajikan dengan saus marinara.',
    'Quantity': 22,
    'Price': 45000,
  },
  {
    'Name': 'Deviled Eggs',
    'Desc':
        'Telur rebus yang diisi dengan campuran kuning telur, mayones, dan rempah-rempah.',
    'Quantity': 30,
    'Price': 40000,
  },
  {
    'Name': 'Hummus Platter',
    'Desc': 'Hummus yang disajikan dengan pita, sayuran segar, dan zaitun.',
    'Quantity': 10,
    'Price': 55000,
  },
  {
    'Name': 'Calamari',
    'Desc': 'Cumi-cumi yang digoreng renyah dengan saus aioli atau marinara.',
    'Quantity': 14,
    'Price': 65000,
  },
  {
    'Name': 'Quesadilla',
    'Desc':
        'Tortilla isi keju dan pilihan bahan tambahan seperti ayam atau jamur, dipanggang hingga keju meleleh.',
    'Quantity': 16,
    'Price': 50000,
  },
  {
    'Name': 'Cucumber Sandwiches',
    'Desc': 'Roti sandwich kecil dengan isian mentimun dan krim keju.',
    'Quantity': 24,
    'Price': 42000,
  },
  {
    'Name': 'Bacon-Wrapped Dates',
    'Desc':
        'Kurma manis yang dibungkus dengan daging bacon, dipanggang hingga crispy.',
    'Quantity': 18,
    'Price': 55000,
  },
  {
    'Name': 'Pigs in a Blanket',
    'Desc': 'Sosis mini yang dibungkus dengan adonan pastry dan dipanggang.',
    'Quantity': 20,
    'Price': 50000,
  },
  {
    'Name': 'Cheese Platter',
    'Desc':
        'Platter dengan berbagai jenis keju, disajikan dengan crackers dan buah-buahan.',
    'Quantity': 12,
    'Price': 70000,
  },
];
