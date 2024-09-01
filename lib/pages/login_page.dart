import 'package:flutter/material.dart';
import 'package:pos_kerjaku/pages/otp_page.dart';
import 'package:pos_kerjaku/utils/poppins_text.dart';
import 'package:pos_kerjaku/widgets/button_fill_text.dart';
import 'package:pos_kerjaku/widgets/rounded_text_field.dart';

import '../theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
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
        padding: const EdgeInsets.symmetric(horizontal: 300, vertical: 140),
        child: Container(
          padding: const EdgeInsets.only(bottom: 76, left: 57, right: 57),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png',
                  width: 162, fit: BoxFit.cover),
              Poppins.bold(
                text: 'Manage your product more easier',
                color: const Color.fromARGB(126, 0, 0, 0),
              ),
              const Divider(),
              const SizedBox(height: 48),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Poppins.bold(text: 'Email')),
              const SizedBox(height: 2),
              CustomTextField(
                  controller: emailController, hintText: 'Input your email'),
              const SizedBox(height: 68),
              emailController.text.isEmpty
                  ? const ContainerText(text: 'Sign In')
                  : ButtonFillText(
                      text: 'Sign In',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return OtpPage();
                            },
                          ),
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
