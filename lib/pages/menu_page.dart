import 'package:flutter/material.dart';
import 'package:pos_kerjaku/services/order_service.dart';
import 'package:pos_kerjaku/utils/poppins_text.dart';
import 'package:pos_kerjaku/widgets/button_icon.dart';
import 'package:pos_kerjaku/widgets/diningMenu/Appetizer_menu.dart';
import 'package:pos_kerjaku/widgets/diningMenu/beverages_menu.dart';
import 'package:pos_kerjaku/widgets/diningMenu/bread_menu.dart';
import 'package:pos_kerjaku/widgets/diningMenu/food_menu.dart';
import 'package:pos_kerjaku/widgets/diningMenu/snack_menu.dart';
import 'package:pos_kerjaku/widgets/filter_button.dart';
import 'package:pos_kerjaku/widgets/no_outline_text_field.dart';
import 'package:pos_kerjaku/widgets/diningMenu/coffee_menu.dart';
import '../theme.dart';

class DiningPage extends StatefulWidget {
  final int id;
  const DiningPage({super.key, this.id = 0});

  @override
  State<DiningPage> createState() => _DiningPageState();
}

class _DiningPageState extends State<DiningPage> {
  int _currentIndex = 0;
  int _currentIndexFilter = 0;
  TextEditingController searchController = TextEditingController();

  final List<Widget> pagesMenu = [
    const CoffeeMenu(),
    const BeveragesMenu(),
    const FoodMenu(),
    const AppetizerMenu(),
    const BreadMenu(),
    const SnackMenu(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar();
    final bodyHeight = height -
        appBarHeight.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Row(
        children: [
          sideBar(width, bodyHeight),
          Container(
            width: width * 0.27,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1,
                  color: Color(0xffE4E4E4),
                ),
              ),
            ),
            child: Column(
              children: [
                filterBar(),
                searchMenu(),
                menuBar(),
              ],
            ),
          ),
          orderDetail(),
        ],
      ),
    );
  }

  Widget sideBar(double width, double bodyHeight) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 110),
      width: width * 0.1,
      height: bodyHeight,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1,
            color: Color(0xffE4E4E4),
          ),
        ),
      ),
      child: Column(
        children: [
          ButtonIconCol(
            icon: Icons.coffee,
            text: 'Coffee',
            isActive: _currentIndex == 0,
            onTap: () {
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
          const Spacer(),
          ButtonIconCol(
            icon: Icons.local_drink_outlined,
            text: 'Beverages',
            isActive: _currentIndex == 1,
            onTap: () {
              setState(() {
                _currentIndex = 1;
              });
            },
          ),
          const Spacer(),
          ButtonIconCol(
            icon: Icons.fastfood_outlined,
            text: 'Food',
            isActive: _currentIndex == 2,
            onTap: () {
              setState(() {
                _currentIndex = 2;
              });
            },
          ),
          const Spacer(),
          ButtonIconCol(
            icon: Icons.fastfood_outlined,
            text: 'Appetizer',
            isActive: _currentIndex == 3,
            onTap: () {
              setState(() {
                _currentIndex = 3;
              });
            },
          ),
          const Spacer(),
          ButtonIconCol(
            icon: Icons.fastfood_outlined,
            text: 'Bread',
            isActive: _currentIndex == 4,
            onTap: () {
              setState(() {
                _currentIndex = 4;
              });
            },
          ),
          const Spacer(),
          ButtonIconCol(
            icon: Icons.fastfood_outlined,
            text: 'Snack',
            isActive: _currentIndex == 5,
            onTap: () {
              setState(() {
                _currentIndex = 5;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget filterBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xffE4E4E4),
          ),
        ),
      ),
      child: Row(
        children: [
          FilterButton(
              text: 'All',
              isActive: _currentIndexFilter == 0,
              onTap: () {
                setState(() {
                  _currentIndexFilter = 0;
                });
              }),
          const Spacer(),
          FilterButton(
              text: 'Chicken',
              isActive: _currentIndexFilter == 1,
              onTap: () {
                setState(() {
                  _currentIndexFilter = 1;
                });
              }),
          const Spacer(),
          FilterButton(
              text: 'Seafood',
              isActive: _currentIndexFilter == 2,
              onTap: () {
                setState(() {
                  _currentIndexFilter = 2;
                });
              }),
        ],
      ),
    );
  }

  Widget searchMenu() {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 1,
              color: Color(0xffE4E4E4),
            ),
            bottom: BorderSide(
              width: 1,
              color: Color(0xffE4E4E4),
            ),
          ),
        ),
        child: NoOutlineTextField(
          controller: searchController,
          hintText: 'Search menu...',
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xff19191C),
          ),
        ),
      ),
    );
  }

  Widget menuBar() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Color(0xffE4E4E4),
            ),
          ),
        ),
        child: pagesMenu[_currentIndex],
      ),
    );
  }

  Widget orderDetail() {
    final orderList = Order.getOrderList();

    void removeList(int index) {
      setState(() {
        Order.removeOrderAt(index);
      });
    }

    double calculateSubtotal() {
      double subtotal = 0.0;
      for (var order in orderList) {
        subtotal += order['total'];
      }
      return subtotal;
    }

    double calculateTax(double subtotal) {
      return subtotal * 0.1;
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Poppins.bold(
              text: 'Order Details',
              fontSize: 20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: [
                    DataColumn(
                        label: Poppins.light(
                            color: const Color(0xff9C9C9C), text: 'ITEM NAME')),
                    DataColumn(
                        label: Poppins.light(
                            color: const Color(0xff9C9C9C), text: 'Notes')),
                    DataColumn(
                        label: Poppins.light(
                            color: const Color(0xff9C9C9C), text: 'QTY')),
                    DataColumn(
                        label: Poppins.light(
                            color: const Color(0xff9C9C9C), text: 'PRICE')),
                    DataColumn(
                        label: Poppins.light(
                            color: const Color(0xff9C9C9C), text: 'Action')),
                  ],
                  rows: List.generate(orderList.length, (index) {
                    final order = orderList[index];
                    return DataRow(
                      cells: [
                        DataCell(Poppins.light(text: order['title'])),
                        DataCell(Poppins.light(text: order['notes'] ?? '-')),
                        DataCell(
                            Poppins.light(text: order['quantity'].toString())),
                        DataCell(Poppins.light(
                            text: 'Rp. ${order['total'].toString()}')),
                        DataCell(
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              removeList(index);
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            transaction(calculateSubtotal(), calculateTax(calculateSubtotal())),
          ],
        ),
      ),
    );
  }

  Widget transaction(double subtotal, double tax) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Poppins.light(
                        text: 'SUBTOTAL',
                        color: const Color(0xff9C9C9C),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: 120,
                        child: Poppins.light(
                          text: 'Rp. ${subtotal.toString()}',
                          color: black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Poppins.light(
                        text: 'SUBCHARGE',
                        color: const Color(0xff9C9C9C),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: 120,
                        child: Poppins.light(text: 'Rp. 0', color: black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Poppins.light(
                        text: 'ORDER DISCOUNT',
                        color: const Color(0xff9C9C9C),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: 120,
                        child: Poppins.light(text: 'Rp. 0', color: black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Poppins.light(
                        text: 'TAX',
                        color: const Color(0xff9C9C9C),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: 120,
                        child: Poppins.light(
                            text: 'Rp. ${tax.toString()}', color: black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Poppins.light(
                        text: 'Cash',
                        color: const Color(0xff9C9C9C),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: 120,
                        child: Poppins.light(text: 'Rp. 0', color: black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Poppins.light(
                        text: 'BILL AMOUT',
                        color: black,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: 140,
                        child: Poppins.bold(
                            text: 'Rp. ${(subtotal + tax).toString()}',
                            color: gradientGreenStart),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Poppins.light(
                        text: 'CHANGE',
                        color: black,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: 140,
                        child: Poppins.bold(text: 'Rp. 0', color: danger),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Poppins.regular(
                      text: 'Payment Method',
                      color: const Color(0xff828487),
                      fontSize: 12,
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money, color: gradientGreenStart),
                        Poppins.light(text: 'Cash', color: black),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [gradientBlueStart, gradientBlueEnd],
                        ),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Center(
                          child: Poppins.bold(
                              text: '% Select Discount', color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 77),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [gradientGreenStart, gradientGreenEnd],
                        ),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Center(
                          child: Poppins.bold(
                              text: 'Pay Now', color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
