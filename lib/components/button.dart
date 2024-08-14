// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bricoun/constant/constant.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const MainButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kBlueButton,
          padding: const EdgeInsets.symmetric(vertical: 17),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: kMediumTextStyle.copyWith(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final void Function() onTap;
  const MyButton({
    super.key,
    required this.title,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: kMediumTextStyle.copyWith(fontSize: 14, color: textColor),
        ),
      ),
    );
  }
}
