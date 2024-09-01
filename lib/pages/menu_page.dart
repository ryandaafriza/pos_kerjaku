import 'package:flutter/material.dart';
import 'package:pos_kerjaku/widgets/button_icon.dart';
import 'package:pos_kerjaku/widgets/diningMenu/Appetizer_menu.dart';
import 'package:pos_kerjaku/widgets/diningMenu/beverages_menu.dart';
import 'package:pos_kerjaku/widgets/diningMenu/bread_menu.dart';
import 'package:pos_kerjaku/widgets/diningMenu/food_menu.dart';
import 'package:pos_kerjaku/widgets/diningMenu/snack_menu.dart';
import 'package:pos_kerjaku/widgets/filter_button.dart';
import 'package:pos_kerjaku/widgets/no_outline_text_field.dart';
import 'package:pos_kerjaku/widgets/diningMenu/coffee_menu.dart';

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
    CoffeeMenu(),
    BeveragesMenu(),
    FoodMenu(),
    AppetizerMenu(),
    BreadMenu(),
    SnackMenu(),
  ];

  @override
  void initState() {
    // TODO: implement initState
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
}
