import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pos_kerjaku/main.dart';
import 'package:pos_kerjaku/pages/menu_page.dart';
import 'package:pos_kerjaku/utils/poppins_text.dart';
import 'package:pos_kerjaku/widgets/button_icon.dart';
import 'package:pos_kerjaku/widgets/button_text.dart';
import 'package:pos_kerjaku/pages/home_page.dart';

import '../theme.dart';

class NavigatorPage extends StatefulWidget {
  final int id;
  const NavigatorPage({super.key, this.id = 0});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _currentIndex = 0;
  late Timer _timer;
  String _formattedTime = '';
  String _formattedDate = '';

  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
    DiningPage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.id;
    _updateTimeAndDate();
    _timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => _updateTimeAndDate());
  }

  void _updateTimeAndDate() {
    final DateTime now = DateTime.now();
    setState(() {
      _formattedTime = DateFormat('HH:mm:ss').format(now);
      _formattedDate = DateFormat('dd/MM/yyyy').format(now);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueSkyBg,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 22.0, right: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Poppins.bold(text: "Dchick"),
                    Poppins.light(text: "D'chick-1"),
                  ],
                ),
                const SizedBox(width: 120),
                ButtonIcon(
                  icon: Icons.home,
                  text: 'Home',
                  isActive: _currentIndex == 0,
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                ),
                const Spacer(),
                ButtonIcon(
                    icon: Icons.date_range,
                    text: 'Order',
                    onTap: () {
                      setState(() {
                        _currentIndex = 3;
                      });
                    },
                    isActive: _currentIndex == 3),
                const Spacer(),
                ButtonIcon(
                  icon: Icons.menu_book,
                  text: 'Menu',
                  isActive: _currentIndex == 2,
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                ),
                ButtonIcon(
                  icon: Icons.timelapse,
                  text: 'History',
                  onTap: () {},
                ),
                const Spacer(),
                ButtonIcon(
                  icon: Icons.table_bar_outlined,
                  text: 'Table',
                  onTap: () {},
                ),
                const Spacer(),
                ButtonText(
                    onTap: () {
                      setState(() {
                        _currentIndex = 3;
                      });
                    },
                    isActive: _currentIndex == 3),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Poppins.light(text: _formattedTime),
                    ),
                    const SizedBox(width: 6),
                    Poppins.light(text: _formattedDate),
                  ],
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.transparent,
              height: 1.0,
              child: const Divider(
                color: Color(0xffE4E4E4),
                thickness: 1.0,
              ),
            ),
          ),
        ),
      ),
      body: pages[_currentIndex],
    );
  }
}
