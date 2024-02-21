import 'package:e_health/utils/colors.dart';
import 'package:e_health/widgets/bouncing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppointmentsView extends StatefulWidget {
  const AppointmentsView({super.key});

  @override
  State<AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<AppointmentsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundGreen,
        body: SizedBox(
          height: Get.height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              _buildAppointmentList(),
              Expanded(child: Container()),
              _buildNewAppointmentButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Column(
      children: [
        Container(
          height: Get.height / 11,
          padding: const EdgeInsets.only(left: 30, right: 30),
          decoration: BoxDecoration(
            color: lightGreen,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: darkGreen.withOpacity(0.5),
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Bouncing(
                  onPress: () => Get.back(),
                  content: SvgPicture.asset(
                    'assets/icons/arrow_left.svg',
                  )),
              SvgPicture.asset('assets/icons/healthband.svg'),
              SvgPicture.asset('assets/icons/person.svg')
            ],
          ),
        ),
        Container(
            width: Get.width / 2.5,
            height: Get.height / 25,
            decoration: BoxDecoration(
              color: darkGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(
                'Appointments',
                style: TextStyle(
                  fontSize: 14,
                  color: whiteColor,
                ),
              ),
            ))
      ],
    );
  }

  Widget _buildAppointmentList() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(children: [
        SizedBox(
          height: Get.height / 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: darkGreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              width: Get.width / 4,
              height: Get.height / 25,
              alignment: Alignment.center,
              child: Text("Active", style: TextStyle(color: whiteColor)),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF035D43),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              width: Get.width / 4,
              height: Get.height / 25,
              alignment: Alignment.center,
              child: Text("Previous", style: TextStyle(color: whiteColor)),
            ),
          ],
        ),
        Container(
          width: Get.width,
          height: Get.height / 3,
          decoration: const BoxDecoration(
            color: Color(0xFF3E9179),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            border: Border(
              top: BorderSide(color: darkGreen, width: 3),
              bottom: BorderSide(color: darkGreen, width: 3),
              left: BorderSide(color: darkGreen, width: 3),
              right: BorderSide(color: darkGreen, width: 3),
            ),
          ),
          child: Column(
            children: [
              _buildAppointmentItem(
                  "Central Historical Building - 1",
                  "Faika Hazal Tüper",
                  "İstanbul Bahçelievler 011 No. Family Practice Center"),
              _buildAppointmentItem(
                  "Central Historical Building - 2",
                  "Mehmet Taşkın Ekici",
                  "İstanbul Haydarpaşa Numune Training and Research Hospital"),
            ],
          ),
        )
      ]),
    );
  }

  Widget _buildAppointmentItem(
      String buildingName, String doctorName, String hospitalName) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: lightGreen2,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: darkGreen.withOpacity(0.5),
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      width: Get.width / 1.15,
      height: Get.height / 7,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width / 3,
                height: Get.height / 25,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: darkGreen,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Text("15.02.2024",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: whiteColor)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage('assets/icons/muayene.png'),
                            width: 10,
                            height: 10),
                        SizedBox(width: 5),
                        Text("Examination",
                            style: TextStyle(color: whiteColor, fontSize: 10)),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage('assets/icons/merkez_bina.png'),
                            width: 10,
                            height: 10),
                        SizedBox(width: 5),
                        Text(buildingName,
                            style: TextStyle(color: whiteColor, fontSize: 10)),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                            image:
                                AssetImage('assets/icons/faika_kulaklik.png'),
                            width: 10,
                            height: 10),
                        SizedBox(width: 5),
                        Text(doctorName,
                            style: TextStyle(color: whiteColor, fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 30, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage('assets/icons/hospital.png'),
                            width: 10,
                            height: 10),
                        SizedBox(width: 5),
                        SizedBox(
                          width: Get.width / 3.8,
                          child: Text(hospitalName,
                              maxLines: 4,
                              style:
                                  TextStyle(color: whiteColor, fontSize: 10)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage('assets/icons/wheel.png'),
                            width: 10,
                            height: 10),
                        SizedBox(width: 5),
                        Text("Family Practice",
                            style: TextStyle(color: whiteColor, fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewAppointmentButton() {
    return Bouncing(
      onPress: () {},
      content: Container(
        width: Get.width / 1.1,
        height: Get.height / 12,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: lightGreen,
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
        child: Text("New Appointment",
            style: TextStyle(color: whiteColor, fontSize: 20)),
      ),
    );
  }
}
