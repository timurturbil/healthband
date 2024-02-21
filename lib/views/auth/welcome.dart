import 'package:e_health/views/auth/patient/start_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widgets/bouncing.dart';
import 'doctor/start_1.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  String selectedValue = "";
  final Widget patient = SvgPicture.asset('assets/icons/select_patient.svg',
      height: Get.height / 4, semanticsLabel: 'Acme Logo');
  final Widget doctor = SvgPicture.asset('assets/icons/select_doctor.svg',
      height: Get.height / 4, semanticsLabel: 'Acme Logo');
  final Widget doctorSelected = SvgPicture.asset(
      'assets/icons/doctor_selected.svg',
      height: Get.height / 4,
      semanticsLabel: 'Acme Logo');
  final Widget patientSelected = SvgPicture.asset(
      'assets/icons/patient_selected.svg',
      height: Get.height / 4,
      semanticsLabel: 'Acme Logo');

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
              height: Get.height / 4.5,
            ),
            if (selectedValue == "")
              const Text("Select if you are a",
                  style: TextStyle(
                      fontSize: 20,
                      color: whiteColor,
                      fontWeight: FontWeight.w600)),
            SizedBox(
              height: Get.height / 12,
            ),
            if (selectedValue == "")
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedValue = "patient";
                        });
                      },
                      child: patient),
                  SizedBox(
                    width: Get.width / 16,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedValue = "doctor";
                        });
                      },
                      child: doctor),
                ],
              ),
            if (selectedValue == "patient")
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedValue = "doctor";
                    });
                  },
                  child: patientSelected),
            if (selectedValue == "doctor")
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedValue = "patient";
                    });
                  },
                  child: doctorSelected),
            SizedBox(
              height: Get.height / 20,
            ),
            if (selectedValue == "")
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Patient",
                      style: TextStyle(
                          fontSize: 20,
                          color: whiteColor,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    width: Get.width / 30,
                  ),
                  Text("or", style: TextStyle(fontSize: 20, color: whiteColor)),
                  SizedBox(
                    width: Get.width / 30,
                  ),
                  Text("Doctor",
                      style: TextStyle(
                          fontSize: 20,
                          color: whiteColor,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            if (selectedValue == "patient")
              Text("Patient",
                  style: TextStyle(
                      fontSize: 20,
                      color: whiteColor,
                      fontWeight: FontWeight.w600)),
            if (selectedValue == "doctor")
              Text("Doctor",
                  style: TextStyle(
                      fontSize: 20,
                      color: whiteColor,
                      fontWeight: FontWeight.w600)),
            Expanded(child: Container()),
            _buildNewRegisterButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNewRegisterButton() {
    return Bouncing(
      onPress: () {
        if (selectedValue == "") {
          Get.snackbar("Select a value",
              "Please select if you are a patient or a doctor",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: whiteColor);
        } else {
          if (selectedValue == "patient") {
            Get.to(() => const PatientStart1View());
          } else {
            Get.to(() => const DoctorStart1View());
          }
        }
      },
      content: Container(
        width: Get.width / 1.1,
        height: Get.height / 12,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: selectedValue == "" ? Color(0xFF00835C) : Color(0xFF00AB78),
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
        child: Text("Next",
            style: TextStyle(
                color: whiteColor, fontSize: 20, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
