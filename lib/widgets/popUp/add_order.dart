import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddOrderDialog extends StatefulWidget {
  final String title;
  final double price;
  final int stock;
  final Function(Map<String, dynamic>) onAddOrder;

  AddOrderDialog({
    required this.title,
    required this.price,
    required this.stock,
    required this.onAddOrder,
  });

  @override
  _AddOrderDialogState createState() => _AddOrderDialogState();
}

class _AddOrderDialogState extends State<AddOrderDialog> {
  int tempQuantity = 0;
  double totalPrice = 0;
  final TextEditingController _noteController = TextEditingController();

  void _updateTotalPrice() {
    setState(() {
      totalPrice = tempQuantity * widget.price;
    });
  }

  Map<String, dynamic> createOrderData() {
    return {
      'title': widget.title,
      'price': widget.price,
      'quantity': tempQuantity,
      'notes': _noteController.text,
    };
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Order',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      tempQuantity = 0;
                    });
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close, color: Colors.black),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title,
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Price',
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xff9C9C9C))),
                              Text(
                                'Rp. ${widget.price.toString()}',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.remove_circle,
                                  color: tempQuantity > 0
                                      ? Colors.black
                                      : Colors.black38,
                                ),
                                onPressed: tempQuantity > 0
                                    ? () {
                                        setState(() {
                                          tempQuantity--;
                                          _updateTotalPrice();
                                        });
                                      }
                                    : null,
                              ),
                              Text(
                                tempQuantity.toString(),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add_circle,
                                  color: tempQuantity < widget.stock
                                      ? Colors.black
                                      : Colors.black38,
                                ),
                                onPressed: tempQuantity < widget.stock
                                    ? () {
                                        setState(() {
                                          tempQuantity++;
                                          _updateTotalPrice();
                                        });
                                      }
                                    : null,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 24),
            Text('Add Note',
                style: GoogleFonts.poppins(color: const Color(0xff828487))),
            TextFormField(
              controller: _noteController,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              textAlignVertical: TextAlignVertical.top,
              textAlign: TextAlign.start,
              cursorColor: Colors.black,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Type your note here..',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffC2C2C2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total',
                        style: GoogleFonts.poppins(
                            color: const Color(0xff828487))),
                    Text(
                      'Rp. $totalPrice',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 58),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(58),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.green, Colors.greenAccent],
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Map<String, dynamic> orderData = createOrderData();
                      widget.onAddOrder(orderData);
                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child: Text('Add to order',
                          style: GoogleFonts.poppins(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
