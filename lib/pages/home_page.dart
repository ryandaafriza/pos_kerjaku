import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:pos_kerjaku/utils/poppins_text.dart';
import 'package:pos_kerjaku/widgets/card_stat.dart';

import '../theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ChartData> chartData = [
    ChartData('Martabak Manis', 25),
    ChartData('Roti Bakar', 38),
    ChartData('Kopi Susu', 34),
    ChartData('Lemon Tea', 52),
    ChartData('Kopi Mandja', 21)
  ];

  final List<SalesData> data = [
    SalesData('1-2AM', 1400),
    SalesData('2-3AM', 2300),
    SalesData('3-4AM', 2400),
    SalesData('4-5AM', 2200),
    SalesData('5-6AM', 2400),
    SalesData('6-7AM', 4200),
    SalesData('7-8AM', 2000),
    SalesData('8-9AM', 2400),
    SalesData('9-10AM', 3000),
    SalesData('10-11AM', 2450),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueSkyBg,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 60.0),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  statContent(),
                  SizedBox(height: 16),
                  cashDrawerStat(),
                  SizedBox(height: 8),
                  hourlySalesReport(),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  topSellingMenu(),
                  const SizedBox(height: 12),
                  orderHistory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget statContent() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardStat(
          icon: Icons.menu_book_outlined,
          numberStat: '120',
          nameStat: 'Total Orders',
        ),
        CardStat(
          icon: Icons.refresh_sharp,
          numberStat: '11',
          nameStat: 'Waiting Orders',
        ),
        CardStat(
          icon: Icons.check_circle_sharp,
          numberStat: '109',
          nameStat: 'Complete Orders',
        ),
      ],
    );
  }

  Widget cashDrawerStat() {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              offset: Offset(-1, 0),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(children: [
              CircleAvatar(
                radius: 11,
                backgroundColor: gradientGreenStart,
                child: const Center(
                  child: Icon(
                    Icons.attach_money_sharp,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Poppins.bold(text: 'Cash Drawer Status', fontSize: 16),
            ]),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Poppins.regular(text: 'Total Cash:'),
                Poppins.regular(text: 'Rp. 2.450.000'),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Poppins.regular(text: 'Last Change:'),
                Poppins.bold(text: '-Rp. 50.000', color: danger),
              ],
            ),
            const Divider(),
          ],
        ));
  }

  Widget hourlySalesReport() {
    return Container(
      padding: EdgeInsets.only(left: 29, right: 29, top: 24, bottom: 20),
      height: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hourly sales report',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelRotation: 90,
                labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff828487),
                ),
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff828487),
                ),
                minimum: 0,
                maximum: 4500,
                interval: 1500,
              ),
              series: <CartesianSeries>[
                ColumnSeries<SalesData, String>(
                  dataSource: data,
                  xValueMapper: (SalesData sales, _) => sales.timeRange,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  color: Color(0xff8FBFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  dataLabelSettings: DataLabelSettings(isVisible: false),
                ),
              ],
              tooltipBehavior: TooltipBehavior(enable: true),
            ),
          ),
        ],
      ),
    );
  }

  Widget topSellingMenu() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 27),
      height: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined,
                  size: 20, color: gradientGreenEnd),
              SizedBox(width: 4),
              Poppins.bold(text: 'Top Selling Menu'),
            ],
          ),
          Expanded(
            child: SfCircularChart(
              legend: Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.scroll,
                position: LegendPosition.right,
              ),
              series: <CircularSeries>[
                DoughnutSeries<ChartData, String>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    name: 'Gold')
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget orderHistory() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 250,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(50, 0, 0, 0),
            offset: Offset(-1, 0),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.note_alt_outlined,
                  size: 20, color: gradientGreenStart),
              SizedBox(width: 4),
              Poppins.bold(text: 'Order History'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Poppins.bold(text: 'Order Id', fontSize: 12),
              Poppins.bold(text: 'Cs Name', fontSize: 12),
              Poppins.bold(text: 'Order Status', fontSize: 12),
            ],
          ),
          Divider(color: Colors.black),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: List.generate(10, (index) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Poppins.regular(text: 'XX-XX', fontSize: 12),
                        Poppins.bold(text: 'Ryanda', fontSize: 12),
                        Poppins.bold(
                            text: 'Dibatalkan', fontSize: 12, color: danger),
                      ],
                    ),
                    SizedBox(height: 4),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class SalesData {
  SalesData(this.timeRange, this.sales);

  final String timeRange;
  final double sales;
}
