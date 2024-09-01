import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoOutlineTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry contentPadding;
  final bool isPassword;

  const NoOutlineTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.contentPadding =
        const EdgeInsets.only(left: 15, bottom: 13, top: 13, right: 15),
    this.isPassword = false,
  }) : super(key: key);

  @override
  _NoOutlineTextFieldState createState() => _NoOutlineTextFieldState();
}

class _NoOutlineTextFieldState extends State<NoOutlineTextField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: GoogleFonts.poppins(
            fontSize: 12, color: const Color(0xff898989).withOpacity(0.8)),
        contentPadding: widget.contentPadding,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : null,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
