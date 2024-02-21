import 'package:e_health/views/auth/patient/start_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../widgets/bouncing.dart';

class PatientStart2View extends StatefulWidget {
  const PatientStart2View({super.key});

  @override
  State<PatientStart2View> createState() => _PatientStart2ViewState();
}

class _PatientStart2ViewState extends State<PatientStart2View> {
  final Widget personProfile = SvgPicture.asset(
      'assets/icons/person_profile.svg',
      semanticsLabel: 'Acme Logo');

  final Widget editIcon =
      SvgPicture.asset('assets/icons/edit.svg', semanticsLabel: 'Acme Logo');

  final Widget arrowDownIcon = Image.asset('assets/icons/arrow_down.png');

  final Widget cameraIcon = Image.asset('assets/icons/camera.png');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundGreen,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            _buildUserCard(),
            SizedBox(
              height: 20,
            ),
            _buildTextField("Height", false),
            _buildTextField("Weight", false),
            _buildTextField("Blood Type", false),
            _buildTextField("Chronical Diseases", false),
            _buildTextField("Ongoing Medications", false),
            _buildTextField("Emergency Number", true),
            _buildTextField("E-Mail", false),
            _buildTextField("Adress", false),
            Expanded(child: Container()),
            _buildRegisterButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
        ),
        SizedBox(
            width: Get.height / 10,
            height: Get.height / 10,
            child: personProfile),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mrs. Gülsüm Yıldız',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'TCKN: 2864546545',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            Text(
              'Date of Birth: 19/10/2001',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildTextField(String hintText, bool isSuffixIconVisible) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
      child: TextField(
        onChanged: (value) {
          // setState(() {
          //   isTyping = value.isNotEmpty;
          // });
        },
        style: TextStyle(color: whiteColor),
        cursorColor: whiteColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFF428672)),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          fillColor: Color(0xFF035D43),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF035D43), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF035D43), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          suffixIcon: isSuffixIconVisible
              ? Container(
                  height: Get.height / 20,
                  decoration: BoxDecoration(
                      color: darkGreen,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32),
                          bottomRight: Radius.circular(32))),
                  child: arrowDownIcon)
              : null,
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Column(
      children: [
        Bouncing(
            onPress: () {
              Get.back();
            },
            content: Text("previous",
                style: TextStyle(
                    color: whiteColor,
                    decoration: TextDecoration.underline,
                    fontSize: 14))),
        SizedBox(
          height: 10,
        ),
        Bouncing(
          onPress: () {
            Get.to(() => const PatientStart3View());
          },
          content: Container(
            width: Get.width / 1.1,
            height: Get.height / 12,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Color(0xFF00AB78),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: darkGreen.withOpacity(0.5),
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            alignment: Alignment.center,
            child:
                Text("Next", style: TextStyle(color: whiteColor, fontSize: 20, fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    );
  }
}
