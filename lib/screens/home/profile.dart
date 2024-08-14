import 'package:bricoun/components/appbar_button.dart';
import 'package:bricoun/components/button.dart';
import 'package:bricoun/components/shadow_container.dart';
import 'package:bricoun/constant/constant.dart';
import 'package:bricoun/screens/pages/update_profile.dart';
import 'package:bricoun/services/image.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String nama = "default";
  String image = "null";
  String? tanggal;
  int totalDurasi = 0;
  int durasiTerakhir = 0;

  Future<void> _navigateAndDisplayResult(BuildContext context) async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const UpdateProfile()));

    // Check what was returned and act accordingly
    if (result != null) {
      //await _fetchUserData();
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 242,
            color: kBlueSign,
            child: SafeArea(
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: (image == "null")
                              ? Image.asset(
                                  'images/profile.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : MyNetworkImage(
                                  imageURL: image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          nama,
                          style: kSemiBoldTextStyle.copyWith(
                              fontSize: 20, color: kWhite),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        onTap: () async {
                          await _navigateAndDisplayResult(context);
                        },
                        child: const AppBarButton(child: Icon(Icons.settings))),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            color: kWhite,
            padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 20),
            child: Column(
              children: [
                ShadowContainer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      '"ceritakan apa yang kamu rasakan pada teman atau keluargamu. Mereka ada untuk mendengarkan dan mendukungmu."',
                      textAlign: TextAlign.center,
                      style: kMediumTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                MyButton(
                    title: 'Logout',
                    color: kRedText,
                    textColor: kWhite,
                    onTap: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
