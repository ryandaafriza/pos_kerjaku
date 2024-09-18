import 'package:flutter/material.dart';
import 'package:pos_kerjaku/services/order_service.dart';
import 'package:pos_kerjaku/widgets/diningMenu/available_stock.dart';
import 'package:pos_kerjaku/widgets/diningMenu/no_stock.dart';

class CoffeeMenu extends StatefulWidget {
  const CoffeeMenu({super.key});

  @override
  _CoffeeMenuState createState() => _CoffeeMenuState();
}

class _CoffeeMenuState extends State<CoffeeMenu> {
  final Map<int, int> _selectedQuantity = {};
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coffeeData.length,
      itemBuilder: (context, index) {
        final coffeeItem = coffeeData[index];

        Map<String, dynamic> orderData = {
          'title': coffeeItem['Name'],
          'quantity': _selectedQuantity[index] ?? 0,
          'notes': noteController.text.isNotEmpty ? noteController.text : '-',
          'total': ((coffeeItem['Price'] as double?) ?? 0) *
              (_selectedQuantity[index] ?? 0),
        };

        if (coffeeItem['Quantity'] == 0) {
          return NoStockCard(
            title: coffeeItem['Name'] as String,
            desc: coffeeItem['Desc'] as String,
            price: coffeeItem['Price'] as double,
            stock: coffeeItem['Quantity'] as int,
          );
        }

        if (!_selectedQuantity.containsKey(index)) {
          _selectedQuantity[index] = 0;
        }

        return AvailableStock(
          title: coffeeItem['Name'] as String,
          desc: coffeeItem['Desc'] as String,
          stock: coffeeItem['Quantity'] as int,
          price: coffeeItem['Price'] as double,
          currentQuantity: _selectedQuantity[index]!,
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

final coffeeData = [
  {
    'Name': 'Espresso',
    'Desc':
        'Kopi pekat dengan rasa kuat, diseduh dengan teknik tekanan tinggi.',
    'Quantity': 15,
    'Price': 25000
  },
  {
    'Name': 'Latte',
    'Desc':
        'Kopi dengan campuran susu yang lembut dan sedikit busa di atasnya.',
    'Quantity': 20,
    'Price': 30000
  },
  {
    'Name': 'Cappuccino',
    'Desc': 'Perpaduan espresso, susu, dan busa susu yang seimbang.',
    'Quantity': 10,
    'Price': 35000
  },
  {
    'Name': 'Americano',
    'Desc':
        'Espresso yang ditambahkan air panas untuk rasa kopi yang lebih ringan.',
    'Quantity': 5,
    'Price': 20000
  },
  {
    'Name': 'Mocha',
    'Desc':
        'Kombinasi antara kopi, susu, dan cokelat untuk rasa manis dan lembut.',
    'Quantity': 8,
    'Price': 40000
  },
  {
    'Name': 'Macchiato',
    'Desc': 'Espresso dengan sedikit tambahan busa susu di atasnya.',
    'Quantity': 12,
    'Price': 35000
  },
  {
    'Name': 'Flat White',
    'Desc': 'Perpaduan espresso dan susu kukus tanpa busa yang kental.',
    'Quantity': 18,
    'Price': 32000
  },
  {
    'Name': 'Affogato',
    'Desc': 'Espresso yang disajikan di atas es krim vanila.',
    'Quantity': 0,
    'Price': 38000
  },
  {
    'Name': 'Cortado',
    'Desc':
        'Espresso dengan susu dalam perbandingan yang sama, menghasilkan rasa seimbang.',
    'Quantity': 7,
    'Price': 30000
  },
  {
    'Name': 'Irish Coffee',
    'Desc': 'Kopi dengan tambahan wiski Irlandia, gula, dan krim.',
    'Quantity': 4,
    'Price': 45000
  },
  {
    'Name': 'Doppio',
    'Desc': 'Dua shot espresso untuk rasa yang lebih kuat.',
    'Quantity': 0,
    'Price': 27000
  },
  {
    'Name': 'Cold Brew',
    'Desc':
        'Kopi yang diseduh dengan air dingin dalam waktu lama untuk hasil yang segar dan lembut.',
    'Quantity': 25,
    'Price': 35000
  },
  {
    'Name': 'Nitro Cold Brew',
    'Desc':
        'Cold brew dengan tambahan nitrogen untuk tekstur lembut dan berbusa.',
    'Quantity': 10,
    'Price': 40000
  },
  {
    'Name': 'Frappe',
    'Desc':
        'Kopi dingin berbusa yang dicampur dengan es, susu, dan berbagai rasa.',
    'Quantity': 0,
    'Price': 37000
  },
];
