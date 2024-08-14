import 'package:bricoun/components/button.dart';
import 'package:bricoun/components/textfield.dart';
import 'package:bricoun/constant/constant.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0, 28, 32, 28),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: kBlueSign),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BRICOUN',
                      style: kSemiBoldTextStyle.copyWith(
                          fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      'BRILLIANT COUNSELING',
                      style: kSemiBoldTextStyle.copyWith(
                          fontSize: 16, color: Colors.white),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Text(
                'Login to Your Account',
                style: kMediumTextStyle.copyWith(fontSize: 18),
              ),
              Text(
                'Enter your email to login in for this app',
                style: kRegularTextStyle.copyWith(fontSize: 14),
              ),
              const SizedBox(
                height: 40,
              ),
              MyTextField(
                label: 'email',
                controller: _emailController,
              ),
              const SizedBox(
                height: 12,
              ),
              MyTextField(
                label: 'password',
                controller: _passwordController,
                isPassword: true,
              ),
              const SizedBox(
                height: 12,
              ),
              MyButton(
                  color: kBlueButton,
                  textColor: Colors.white,
                  title: 'Sign in with email',
                  onTap: () {
                    Navigator.pushNamed(context, '/loginSuc');
                  }),
              const SizedBox(
                height: 8,
              ),
              MyButton(
                  textColor: Colors.black,
                  color: kGrey,
                  title: 'Registration',
                  onTap: () {
                    Navigator.pushNamed(context, '/signUp');
                  }),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
