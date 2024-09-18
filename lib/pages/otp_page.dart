import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_kerjaku/navigator/navigator_page.dart';
import 'package:pos_kerjaku/utils/poppins_text.dart';
import 'package:pos_kerjaku/widgets/button_fill_text.dart';
import 'package:pos_kerjaku/widgets/button_icon.dart';

import '../theme.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController otpController = TextEditingController();
  late Timer _timer;
  int _start = 240;
  String _timeDisplay = '04:00';

  @override
  void initState() {
    super.initState();
    otpController.addListener(() {
      setState(() {});
    });
    startTimer();
  }

  @override
  void dispose() {
    otpController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
          int minutes = _start ~/ 60;
          int seconds = _start % 60;
          _timeDisplay =
              '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [gradientGreenStart, gradientGreenEnd],
              ),
            ),
          ),
          Image.asset(
            'assets/images/bg_paper.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/half_circle.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          content(),
        ],
      ),
    );
  }

  Widget content() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 300, vertical: 121),
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 60, left: 57, right: 57, top: 56),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/logo.png',
                      width: 108, fit: BoxFit.cover),
                  Poppins.extraBold(
                    text: 'Please Enter\nOTP Verification',
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 26),
              Align(
                alignment: Alignment.centerLeft,
                child: Poppins.bold(
                  text: 'Code was sent to r******@gmail.com',
                  color: const Color.fromARGB(126, 0, 0, 0),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Poppins.bold(
                      text: 'This code will expire in ',
                      color: const Color.fromARGB(126, 0, 0, 0),
                    ),
                    Poppins.bold(
                      text: _timeDisplay,
                      color: danger,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              OtpTextField(
                numberOfFields: 4,
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  otpController.text = code;
                },
                onSubmit: (String verificationCode) {
                  otpController.text = verificationCode;
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         title: const Text("Verification Code"),
                  //         content: Text('Code entered is $verificationCode'),
                  //       );
                  //     });
                },
                textStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 26),
                obscureText: true,
                fieldHeight: 66,
                fieldWidth: 68,
                filled: true,
                fillColor: const Color(0xff323232).withOpacity(0.1),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff323232).withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Poppins.bold(text: "Didn't receive an OTP?"),
                  ButtonIcon(
                      icon: Icons.refresh_sharp, text: 'Resend', onTap: () {}),
                ],
              ),
              const SizedBox(height: 52),
              otpController.text.length != 4
                  ? const ContainerText(text: 'Sign In')
                  : ButtonFillText(
                      text: 'Sign In',
                      onTap: () {
                        print('tap');
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                            return NavigatorPage();
                          }),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
