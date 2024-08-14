import 'package:bricoun/components/button.dart';
import 'package:bricoun/constant/constant.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, kLightBlue])),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Welcome to',
                        style: kMediumTextStyle.copyWith(
                            fontSize: 20, color: kDarkBlue),
                      ),
                      Text(
                        'BRICOUN',
                        style: kSemiBoldTextStyle.copyWith(
                            fontSize: 32, color: kDarkBlue),
                      ),
                      const Spacer(),
                      Image.asset('images/stepper.png'),
                      const Spacer(),
                      MainButton(
                          title: 'Get Started',
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
