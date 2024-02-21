import 'package:e_health/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets/bouncing.dart';
import '../doctors/first_aid_tutorials.dart';
import 'appointments.dart';
import 'emergency.dart';
import 'ongoing_patient.dart';
import 'previous.dart';

class PatientView extends StatefulWidget {
  const PatientView({super.key});

  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  final Widget healthbandIcon = SvgPicture.asset('assets/icons/healthband.svg',
      semanticsLabel: 'Acme Logo');

  List<GridItem> _gridItems = [
    GridItem(
        title: 'Appointments', icon: "appointment", page: AppointmentsView()),
    GridItem(title: 'Emergency', icon: "emergency", page: EmergencyView()),
    GridItem(title: 'Ongoing', icon: "ongoing", page: OngoingPatientListView()),
    GridItem(title: 'Previous', icon: "previous", page: PreviousView()),
    GridItem(title: 'Reports', icon: "reports", page: Container()),
    GridItem(title: 'Volunteer', icon: "volunteer", page: Container()),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: _buildDrawer(),
        backgroundColor: backgroundGreen,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildAppBar(), _buildDoctorCard(), _buildGridView()],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: darkGreen,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: darkGreen,
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(left: Get.width / 30, right: Get.width / 6),
                child: healthbandIcon,
              )),
          SizedBox(
            height: Get.height / 1.4,
            child: Column(
              children: [
                _buildDrawerContentButton('First Aid Tutorials', 'first_aid'),
                _buildDrawerContentButton('Nearest Hospitals', 'hospital'),
                _buildDrawerContentButton('Settings', 'settings'),
                _buildDrawerContentButton('Report a Problem', 'report'),
                Expanded(child: Container()),
                Container(
                  width: Get.width,
                  height: Get.height / 30,
                  // margin: EdgeInsets.only(
                  //     right: Get.width / 30, left: Get.width / 30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: backgroundGreen,
                    // borderRadius: BorderRadius.all(Radius.circular(20)),
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
                  child: Text("Healthband® 2024",
                      style: TextStyle(fontSize: 12, color: whiteColor)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDrawerContentButton(String title, String icon) {
    return Bouncing(
      onPress: () {
        if (icon == "first_aid") {
          Get.to(() => const FirstAidTutorials());
        }
      },
      content: Container(
        height: Get.height / 20,
        margin: EdgeInsets.only(right: Get.width / 9, top: Get.height / 40),
        decoration: BoxDecoration(
          color: backgroundGreen,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
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
            SizedBox(
              width: 20,
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: SvgPicture.asset('assets/icons/$icon.svg',
                  width: 20, height: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
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
          GestureDetector(
            onTap: () {
              _key.currentState!.openDrawer();
            },
            child: SvgPicture.asset('assets/icons/drawer.svg'),
          ),
          SvgPicture.asset('assets/icons/healthband.svg',
              semanticsLabel: 'Acme Logo'),
          SvgPicture.asset('assets/icons/person.svg')
        ],
      ),
    );
  }

  Widget _buildDoctorCard() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 30, top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/patient.svg'),
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
                'TCKN: 26549821584',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              Text(
                'Blood Type: B Rh+',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
              Text(
                'Allergy: Peanut',
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: _gridItems.length,
        itemBuilder: (context, index) {
          return Bouncing(
            onPress: () {
              if (_gridItems[index].title == "Reports" ||
                  _gridItems[index].title == "Volunteer") return;
              Get.to(() => _gridItems[index].page);
            },
            content: Container(
                decoration: BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.circular(16),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _gridItems[index].title,
                      style: TextStyle(fontSize: 6, color: Colors.transparent),
                    ),
                    SvgPicture.asset(
                        'assets/icons/${_gridItems[index].icon}.svg'),
                    Container(
                      decoration: BoxDecoration(
                        color: darkGreen,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      height: Get.height / 28,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _gridItems[index].title,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}

class GridItem {
  final String title;
  final String icon;
  final Widget page;

  GridItem({required this.title, required this.icon, required this.page});
}
