import 'package:e_health/utils/colors.dart';
import 'package:e_health/widgets/bouncing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmergencyView extends StatefulWidget {
  const EmergencyView({super.key});

  @override
  State<EmergencyView> createState() => _EmergencyViewState();
}

class _EmergencyViewState extends State<EmergencyView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundGreen,
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(),
            _buildListView(),
          ],
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
                'Emergency',
                style: TextStyle(
                  fontSize: 14,
                  color: whiteColor,
                ),
              ),
            ))
      ],
    );
  }

  Widget _buildListView() {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      // height: Get.height / 1.3,
      child: Column(children: [
        SizedBox(
          height: Get.height / 20,
        ),
        Bouncing(
          onPress: () {},
          content: Container(
            width: Get.width / 1.15,
            height: Get.height / 3.5,
            decoration: BoxDecoration(
              color: darkGreen,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: lightGreen2,
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Call the nearest",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w600)),
                Text("DOCTOR",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFFFF0000),
                        fontSize: 28,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
        SizedBox(
          height: Get.height / 20,
        ),
        Bouncing(
          onPress: () {},
          content: Container(
            width: Get.width / 1.15,
            height: Get.height / 3.5,
            decoration: BoxDecoration(
              color: darkGreen,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: lightGreen2,
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Call an ambulance from the nearest",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w600)),
                Text("HOSPITAL",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFFFF0000),
                        fontSize: 28,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
