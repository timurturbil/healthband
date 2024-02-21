import 'package:e_health/utils/colors.dart';
import 'package:e_health/widgets/bouncing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OngoingPatientListView extends StatefulWidget {
  const OngoingPatientListView({super.key});

  @override
  State<OngoingPatientListView> createState() => _OngoingPatientListViewState();
}

class _OngoingPatientListViewState extends State<OngoingPatientListView> {
  List<OngoingPatient> ongoingPatients = [
    OngoingPatient(
        title: 'Beyin Travması',
        subTitle: 'Doktor: Nuri Bilge Ceylan',
        subTitle2: 'Tarih: 17.02.2024'),
    OngoingPatient(
        title: 'Epilepsi',
        subTitle: 'Doktor: Kader Kaderoğlu',
        subTitle2: 'Tarih: 16.02.2024'),
    OngoingPatient(
        title: 'İç Kanama',
        subTitle: 'Doktor: İdris Cerrahzade',
        subTitle2: 'Tarih: 29.02.2024'),
    OngoingPatient(
        title: 'Beyin Travması',
        subTitle: 'Doktor: Nuri Bilge Ceylan',
        subTitle2: 'Tarih: 17.02.2024'),
    OngoingPatient(
        title: 'Epilepsi',
        subTitle: 'Doktor: Kader Kaderoğlu',
        subTitle2: 'Tarih: 16.02.2024'),
    OngoingPatient(
        title: 'İç Kanama',
        subTitle: 'Doktor: İdris Cerrahzade',
        subTitle2: 'Tarih: 29.02.2024'),
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
                'Ongoing',
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
      child: ListView.builder(
        itemCount: ongoingPatients.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          OngoingPatient data = ongoingPatients[index];
          return Stack(
            children: [
              Container(
                  margin: const EdgeInsets.all(8.0),
                  height: Get.height / 8,
                  decoration: BoxDecoration(
                    color: darkGreen,
                    borderRadius: BorderRadius.circular(30),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: Get.height / 10,
                          width: Get.width / 1.3,
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            color: lightGreen2,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: Get.width / 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: Get.height / 80),
                                  Text(
                                    data.title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: whiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    data.subTitle,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    data.subTitle2,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color: darkGreen,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Treatment",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: whiteColor,
                                  )),
                              SizedBox(
                                width: Get.width / 12,
                              ),
                              Container(
                                color: Colors.white,
                                width: 3,
                                height: 18,
                                margin:
                                    const EdgeInsets.only(left: 8, right: 8),
                              ),
                              SizedBox(
                                width: Get.width / 12,
                              ),
                              Text("Reports",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: whiteColor,
                                  )),
                              SizedBox(
                                width: Get.width / 12,
                              )
                            ]),
                      ),
                    ],
                  )),
              Positioned(
                top: 8,
                left: 5,
                child: Container(
                  height: Get.height / 8,
                  width: Get.height / 8,
                  decoration: BoxDecoration(
                    color: lightGreen,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Image(
                      image: AssetImage('assets/icons/person_cicyle.png'),
                      width: 100,
                      height: 100),
                ),
              )
            ],
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
