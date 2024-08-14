import 'package:bricoun/components/button.dart';
import 'package:bricoun/constant/constant.dart';
import 'package:flutter/material.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, kLightBlue])),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 180,
                height: 180,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFE0FFE5)),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF4CD964)),
                  child: const Icon(
                    Icons.check,
                    size: 54,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Login berhasil',
                style: kMediumTextStyle.copyWith(fontSize: 28),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: MyButton(
                    title: 'Next',
                    color: kBlueButton,
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.pushNamed(context, '/question');
                    }),
              )
            ],
          ),
        )),
      ),
    );
  }
}
