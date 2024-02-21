import 'package:e_health/utils/colors.dart';
import 'package:e_health/widgets/bouncing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PreviousView extends StatefulWidget {
  const PreviousView({super.key});

  @override
  State<PreviousView> createState() => _PreviousViewState();
}

class _PreviousViewState extends State<PreviousView> {
  List<Previous> previous = [
    Previous(
      icon: "hospital_30.png",
      title: "Hospital Visits",
    ),
    Previous(
      icon: "vector_30.png",
      title: "Analyzes",
    ),
    Previous(
      icon: "treatments_30.png",
      title: "Treatments",
    ),
    Previous(
      icon: "prescription_30.png",
      title: "Prescription",
    ),
    Previous(
      icon: "reports_30.png",
      title: "Reports",
    ),
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
                'Previous',
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
        itemCount: previous.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          Previous data = previous[index];
          return Bouncing(
            onPress: () {
              print('Tapped on ${data.title}');
            },
            content: Container(
              decoration: BoxDecoration(
                color: lightGreen2,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: darkGreen.withOpacity(0.5),
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ),
              height: Get.height / 12,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image(
                        image: AssetImage('assets/icons/${data.icon}'),
                        width: 40,
                        height: 40),
                  ),
                  Text(
                    data.title,
                    style: TextStyle(fontSize: 15, color: whiteColor),
                  ),
                  SizedBox(width: 40, height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Previous {
  final String icon;
  final String title;

  Previous({required this.icon, required this.title});
}
