import 'dart:io';

import 'package:bricoun/components/appbar_button.dart';
import 'package:bricoun/components/button.dart';
import 'package:bricoun/constant/constant.dart';
import 'package:bricoun/services/image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String nama = "loading...";
  String image = "null";
  final bool _showSpinner = false;

  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  String name = 'daffa12';
  String email = 'daffa123@gmail.com';
  String error = "";

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        color: kBlue,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                height: 242,
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
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: (image == "null")
                                          ? const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child:
                                                    CircularProgressIndicator(
                                                  color: kWhite,
                                                ),
                                              ),
                                            )
                                          : (_imageFile == null)
                                              ? MyNetworkImage(
                                                  imageURL: image,
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  _imageFile!,
                                                  width: 120,
                                                  height: 120,
                                                  fit: BoxFit.cover,
                                                )),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: GestureDetector(
                                      onTap: _pickImage,
                                      child: const AppBarButton(
                                        width: 35,
                                        height: 35,
                                        child: Icon(Icons.edit),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              nama,
                              style: kSemiBoldTextStyle.copyWith(
                                  fontSize: 20, color: kWhite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                color: kWhite,
                padding:
                    const EdgeInsets.symmetric(vertical: 45, horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    MainButton(
                      title: 'Save',
                      onTap: () async {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      error,
                      textAlign: TextAlign.center,
                      style: kSemiBoldTextStyle.copyWith(
                          color: const Color(0xFFCD1A1A)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
