import 'package:flutter/material.dart';
import 'package:pos_kerjaku/services/order_service.dart';
import 'package:pos_kerjaku/widgets/diningMenu/available_stock.dart';
import 'package:pos_kerjaku/widgets/diningMenu/no_stock.dart';

class FoodMenu extends StatefulWidget {
  const FoodMenu({super.key});

  @override
  State<FoodMenu> createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  final Map<int, int> _selectedQuantity = {};
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodData.length,
      itemBuilder: (context, index) {
        final foodItem = foodData[index];

        Map<String, dynamic> orderData = {
          'title': foodItem['Name'],
          'quantity': _selectedQuantity[index] ?? 0,
          'notes': noteController.text.isNotEmpty ? noteController.text : '-',
          'total': ((foodItem['Price'] as double?) ?? 0) *
              (_selectedQuantity[index] ?? 0),
        };

        if (foodItem['Quantity'] == 0) {
          return NoStockCard(
              title: foodItem['Name'] as String,
              desc: foodItem['Desc'] as String,
              price: foodItem['Price'] as double,
              stock: foodItem['Quantity'] as int);
        }

        if (!_selectedQuantity.containsKey(index)) {
          _selectedQuantity[index] = 0;
        }

        return AvailableStock(
          title: foodItem['Name'] as String,
          desc: foodItem['Desc'] as String,
          stock: foodItem['Quantity'] as int,
          price: foodItem['Price'] as double,
          currentQuantity: _selectedQuantity[index]!,
          // onAdd: () {
          //   setState(() {
          //     final int maxQuantity = foodItem['Quantity'] as int;
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

final foodData = [
  {
    'Name': 'Burger Cheeseburger',
    'Desc': 'Burger daging sapi dengan keju, selada, tomat, dan saus spesial.',
    'Quantity': 12,
    'Price': 50000,
  },
  {
    'Name': 'Pasta Carbonara',
    'Desc': 'Pasta dengan saus krim telur, bacon, dan keju Parmesan.',
    'Quantity': 8,
    'Price': 60000,
  },
  {
    'Name': 'Margherita Pizza',
    'Desc': 'Pizza dengan saus tomat, mozzarella, dan basil segar.',
    'Quantity': 15,
    'Price': 70000,
  },
  {
    'Name': 'Caesar Salad',
    'Desc':
        'Salad dengan selada romaine, croutons, keju Parmesan, dan saus Caesar.',
    'Quantity': 20,
    'Price': 45000,
  },
  {
    'Name': 'Chicken Tenders',
    'Desc': 'Potongan ayam goreng renyah dengan saus celup.',
    'Quantity': 18,
    'Price': 55000,
  },
  {
    'Name': 'Sushi Roll',
    'Desc': 'Roll sushi dengan isian ikan segar, sayuran, dan nasi.',
    'Quantity': 10,
    'Price': 75000,
  },
  {
    'Name': 'Vegetable Stir-Fry',
    'Desc': 'Sayuran segar yang ditumis dengan saus kecap dan bumbu.',
    'Quantity': 22,
    'Price': 40000,
  },
  {
    'Name': 'Beef Tacos',
    'Desc': 'Tacos dengan daging sapi cincang, selada, tomat, dan keju.',
    'Quantity': 14,
    'Price': 50000,
  },
  {
    'Name': 'Grilled Salmon',
    'Desc': 'Salmon panggang dengan bumbu lemon dan herba.',
    'Quantity': 9,
    'Price': 80000,
  },
  {
    'Name': 'Falafel Wrap',
    'Desc': 'Wrap dengan falafel, sayuran segar, dan saus tahini.',
    'Quantity': 16,
    'Price': 45000,
  },
  {
    'Name': 'Lasagna',
    'Desc': 'Lasagna dengan lapisan daging, saus tomat, dan keju.',
    'Quantity': 7,
    'Price': 65000,
  },
  {
    'Name': 'Chicken Curry',
    'Desc': 'Ayam dalam saus kari yang kaya rempah dengan nasi.',
    'Quantity': 11,
    'Price': 55000,
  },
  {
    'Name': 'Chocolate Brownie',
    'Desc': 'Brownie cokelat yang lezat dengan potongan kacang.',
    'Quantity': 25,
    'Price': 30000,
  },
  {
    'Name': 'Greek Salad',
    'Desc': 'Salad dengan tomat, mentimun, olive, feta cheese, dan oregano.',
    'Quantity': 13,
    'Price': 42000,
  },
];
