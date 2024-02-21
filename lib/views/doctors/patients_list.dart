import 'package:e_health/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets/bouncing.dart';

class PatientsListView extends StatefulWidget {
  const PatientsListView({super.key});

  @override
  State<PatientsListView> createState() => _PatientsListViewState();
}

class _PatientsListViewState extends State<PatientsListView> {
  List<OngoingPatient> patientsList = [
    OngoingPatient(
        title: 'Hamdi Akkaya',
        subTitle: 'Diagnosis: Enterocolitis',
        subTitle2: 'TCKN: 28426580147'),
    OngoingPatient(
        title: 'Büşra Baştürk',
        subTitle: 'Diagnosis: Brain Trauma',
        subTitle2: 'TCKN: 28426580147'),
    OngoingPatient(
        title: 'Kazım Baghırov',
        subTitle: 'Diagnosis: Urinary Tract Infection',
        subTitle2: 'TCKN: 28426580147'),
    OngoingPatient(
        title: 'Nijad Mohammad Rebi',
        subTitle: 'Diagnosis: Cronic Asthma',
        subTitle2: 'TCKN: 28426580147'),
    OngoingPatient(
        title: 'Hamdiye Vildan Sarı',
        subTitle: 'Diagnosis: Hepatitis',
        subTitle2: 'TCKN: 28426580147'),
    OngoingPatient(
        title: 'Hamdi Akkaya',
        subTitle: 'Diagnosis: Enterocolitis',
        subTitle2: 'TCKN: 28426580147'),
  ];

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
            SizedBox(height: 10),
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
              SvgPicture.asset('assets/icons/filter.svg')
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
                'Patients',
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
      margin: EdgeInsets.only(left: 16, right: 16),
      // height: Get.height / 1.3,
      child: ListView.builder(
        itemCount: patientsList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Container(
                  height: Get.height / 8,
                  decoration: BoxDecoration(
                    color: lightGreen2,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: darkGreen.withOpacity(0.5),
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: Get.height / 8,
                        width: Get.height / 8,
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Image(
                            image: AssetImage('assets/icons/person_cicyle.png'),
                            width: 100,
                            height: 100),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: Get.height / 80),
                          Text(
                            patientsList[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            patientsList[index].subTitle,
                            style: TextStyle(
                              fontSize: 12,
                              color: whiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            patientsList[index].subTitle2,
                            style: TextStyle(
                              fontSize: 10,
                              color: whiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: darkGreen,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/prescription.svg'),
                        Container(
                          color: Colors.white,
                          width: 3,
                          height: 30,
                          margin: EdgeInsets.only(
                              left: Get.width / 10,
                              right: Get.width / 10,
                              top: 5,
                              bottom: 5),
                        ),
                        // SizedBox(
                        //   width: Get.width / 18,
                        // ),
                        SvgPicture.asset('assets/icons/x_ray.svg'),
                        // SizedBox(
                        //   width: Get.width / 18,
                        // ),
                        Container(
                          color: Colors.white,
                          width: 3,
                          height: 30,
                          margin: EdgeInsets.only(
                              left: Get.width / 10,
                              right: Get.width / 10,
                              top: 5,
                              bottom: 5),
                        ),
                        SvgPicture.asset('assets/icons/vector.svg'),
                      ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class OngoingPatient {
  final String title;
  final String subTitle;
  final String subTitle2;

  OngoingPatient(
      {required this.title, required this.subTitle, required this.subTitle2});
}
