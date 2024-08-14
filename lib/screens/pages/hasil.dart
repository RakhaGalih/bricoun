// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bricoun/components/button.dart';
import 'package:bricoun/constant/constant.dart';
import 'package:flutter/material.dart';

class HasilPage extends StatelessWidget {
  final int totalScore;
  const HasilPage({
    super.key,
    required this.totalScore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hasil Pre-Counseling',
          style: kSemiBoldTextStyle.copyWith(fontSize: 20, color: kDarkBlue),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          RichText(
              text: TextSpan(
                  style: kSemiBoldTextStyle.copyWith(fontSize: 32),
                  children: <InlineSpan>[
                const TextSpan(
                    text: 'KAMU ', style: TextStyle(color: kDarkBlue)),
                TextSpan(
                    text: (totalScore > 15)
                        ? 'DEPRESI BERAT'
                        : (totalScore < 10)
                            ? 'NORMAL'
                            : 'DEPRESI SEDANG',
                    style: TextStyle(
                        color: (totalScore > 15)
                            ? kRedText
                            : (totalScore < 10)
                                ? kGreenText
                                : kYellowText))
              ])),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: Text(
              (totalScore > 15)
                  ? 'Segera hubungi guru BK, keluarga, atau teman terdekat untuk mengkonsultasikan permasalahanmu. Jangan takut untuk bercerita.'
                  : (totalScore < 10)
                      ? 'Kondisi Mental Anda Terjaga. Tetap jaga selalu kesehatan mental anda. berbicara dengan orang-orang terdekat ketika merasa cemas atau stres.'
                      : 'Silakan hubungi guru BK, keluarga, atau teman terdekat untuk mengkonsultasikan permasalahanmu. Jangan takut untuk bercerita.',
              textAlign: TextAlign.center,
              style: kRegularTextStyle.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Spacer(),
          Image.asset(
            (totalScore > 15)
                ? 'images/berat.png'
                : (totalScore < 10)
                    ? 'images/normal1.png'
                    : 'images/sedang.png',
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: MyButton(
                  title: 'HOMEPAGE',
                  color: kBlueButton,
                  textColor: kWhite,
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  }),
            ),
          )
        ],
      ),
    );
  }
}
