import 'package:bricoun/components/appbar_button.dart';
import 'package:bricoun/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _totalScore;

  @override
  void initState() {
    super.initState();
    _loadScore();
  }

  Future<void> _loadScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _totalScore = prefs.getInt('totalScore') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo,',
                      style: kMediumTextStyle.copyWith(fontSize: 20),
                    ),
                    Text(
                      'Bagas',
                      style: kSemiBoldTextStyle.copyWith(
                          fontSize: 24, color: kDarkBlue),
                    ),
                  ],
                ),
                const Spacer(),
                const AppBarButton(child: Icon(Icons.notifications))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'images/homecard.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const Spacer(),
            RichText(
                text: TextSpan(
                    style: kSemiBoldTextStyle.copyWith(fontSize: 32),
                    children: <InlineSpan>[
                  const TextSpan(
                      text: 'KAMU ', style: TextStyle(color: kDarkBlue)),
                  TextSpan(
                      text: (_totalScore > 15)
                          ? 'DEPRESI BERAT'
                          : (_totalScore < 10)
                              ? 'NORMAL'
                              : 'DEPRESI SEDANG',
                      style: TextStyle(
                          color: (_totalScore > 15)
                              ? kRedText
                              : (_totalScore < 10)
                                  ? kGreenText
                                  : kYellowText))
                ])),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Text(
                (_totalScore > 15)
                    ? 'Segera hubungi guru BK, keluarga, atau teman terdekat untuk mengkonsultasikan permasalahanmu. Jangan takut untuk bercerita.'
                    : (_totalScore < 10)
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
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                  (_totalScore > 15)
                      ? 'images/berat.png'
                      : (_totalScore < 10)
                          ? 'images/normal2.png'
                          : 'images/sedang.png',
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width * 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
