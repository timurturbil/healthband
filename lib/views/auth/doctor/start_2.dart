import 'package:e_health/views/doctors/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/colors.dart';
import '../../../widgets/bouncing.dart';

class DoctorStart2View extends StatefulWidget {
  const DoctorStart2View({super.key});

  @override
  State<DoctorStart2View> createState() => _DoctorStart2ViewState();
}

class _DoctorStart2ViewState extends State<DoctorStart2View> {
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
            _buildTitle1(),
            _buildTextField("Diploma Number", false),
            _buildTextField("Registration Number", false),
            _buildTextField("Specialization", true),
            _buildTextField("Subspeciality", true),
            SizedBox(
              height: 30,
            ),
            _buildTitle2(),
            _buildTextField("City", true),
            _buildTextField("Hospital", true),
            _buildTextField("Department", true),
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
              'Dr. Talha Kaya',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'TCKN: 2864546545',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            Text(
              'Date of Birth: 21/10/1991',
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

  Widget _buildTitle1() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Upload your diploma", style: TextStyle(color: whiteColor)),
          GestureDetector(
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              await picker.pickImage(source: ImageSource.camera);
            },
            child: Container(
              width: Get.height / 16,
              height: Get.height / 20,
              decoration: BoxDecoration(
                color: darkGreen,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Container(
                  decoration: BoxDecoration(
                    color: darkGreen,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: cameraIcon),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitle2() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Hospital", style: TextStyle(color: whiteColor)),
          Text("I do not work at hospital",
              style: TextStyle(
                  color: whiteColor,
                  decoration: TextDecoration.underline,
                  fontSize: 12)),
        ],
      ),
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
            Get.to(() => const DoctorsView());
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
            child: Text("Register",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    );
  }
}
