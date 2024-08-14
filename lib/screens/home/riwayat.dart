import 'package:bricoun/components/appbar_button.dart';
import 'package:bricoun/components/calendar.dart';
import 'package:bricoun/constant/constant.dart';
import 'package:bricoun/screens/pages/notification.dart';
import 'package:bricoun/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SelectedDateProvider>(context, listen: false).fetchDataTrip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              height: 242,
              color: kBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: AppBarButton(
                      child: const Icon(Icons.notifications),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notifcation()));
                      },
                    ),
                  ),
                  Text(
                    'Kesehatan Anda',
                    style: kMediumTextStyle.copyWith(
                        fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                   Text(
                    'NORMAL',
                    style: kSemiBoldTextStyle.copyWith(
                        fontSize: 32, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const MyCalendar()
          ],
        ),
      ),
    );
  }
}
