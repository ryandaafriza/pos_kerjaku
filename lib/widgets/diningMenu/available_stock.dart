import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_kerjaku/widgets/popUp/add_order.dart';
import '../../theme.dart';

class AvailableStock extends StatefulWidget {
  final String title, desc;
  final int stock;
  final double price;
  final int currentQuantity;
  final Function(int) onQuantityChange;
  final Function(Map<String, dynamic>) onAddOrder;
  final Map<String, dynamic> orderData;

  AvailableStock({
    super.key,
    required this.title,
    required this.desc,
    required this.stock,
    required this.price,
    required this.currentQuantity,
    required this.onQuantityChange,
    required this.onAddOrder,
    required this.orderData,
  });

  @override
  State<AvailableStock> createState() => _AvailableStockState();
}

class _AvailableStockState extends State<AvailableStock> {
  late TextEditingController _noteController;
  late int tempQuantity;
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
    tempQuantity = widget.currentQuantity;
    totalPrice = widget.price * tempQuantity;
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _updateTotalPrice() {
    setState(() {
      totalPrice = widget.price * tempQuantity;
    });
  }

  Map<String, dynamic> createOrderData() {
    return {
      'title': widget.title,
      'quantity': tempQuantity,
      'notes': _noteController.text.isNotEmpty ? _noteController.text : '-',
      'total': widget.price * tempQuantity,
    };
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xffE4E4E4),
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          // Open AlertDialog
          showDialog(
            context: context,
            builder: (context) {
              return AddOrderDialog(
                title: widget.title,
                price: widget.price,
                stock: widget.stock,
                onAddOrder: (orderData) {
                  print(orderData);
                },
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle,
                            color: tempQuantity > 0
                                ? Colors.black
                                : Colors.black38),
                        onPressed: tempQuantity > 0
                            ? () {
                                setState(() {
                                  tempQuantity--;
                                  _updateTotalPrice();
                                  widget.onQuantityChange(tempQuantity);
                                });
                              }
                            : null,
                      ),
                      Text(tempQuantity.toString(),
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(Icons.add_circle,
                            color: tempQuantity < widget.stock
                                ? Colors.black
                                : Colors.black38),
                        onPressed: tempQuantity < widget.stock
                            ? () {
                                setState(() {
                                  tempQuantity++;
                                  _updateTotalPrice();
                                  widget.onQuantityChange(tempQuantity);
                                });
                              }
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(widget.desc,
                  style: GoogleFonts.poppins(fontSize: 8, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
              const SizedBox(height: 2),
              Text('Rp. ${widget.price.toString()}',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
