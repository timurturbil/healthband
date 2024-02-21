import 'package:e_health/widgets/bouncing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';

class VolunteerView extends StatefulWidget {
  const VolunteerView({super.key});

  @override
  State<VolunteerView> createState() => _VolunteerViewState();
}

class _VolunteerViewState extends State<VolunteerView> {
  bool isTyping = false;
  String customMessage = '';
  bool showNewMessage = false;
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundGreen,
        body: ListView(
          children: [
            _buildAppBar(),
            SizedBox(height: 10),
            _buildPatientCard(),
            _buildMessages(),
            SizedBox(height: 20),
            _builMessageInput()
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Bouncing(
                onPress: () => Get.back(),
                content: Image(
                    image: AssetImage('assets/icons/back.png'),
                    width: 100,
                    height: 100),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kıvanç Şeker",
                        style: TextStyle(
                            fontSize: 16,
                            color: whiteColor,
                            fontWeight: FontWeight.bold)),
                    Text("+905464549232",
                        style: TextStyle(fontSize: 12, color: whiteColor)),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('assets/icons/phone.png'),
                      width: 30,
                      height: 50),
                  SizedBox(width: Get.width / 15),
                  Image(
                      image: AssetImage('assets/icons/first_aid.png'),
                      width: 30,
                      height: 50),
                  SizedBox(width: Get.width / 15),
                ],
              )
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
                'Volunteer',
                style: TextStyle(
                  fontSize: 14,
                  color: whiteColor,
                ),
              ),
            ))
      ],
    );
  }

  Widget _buildPatientCard() {
    return Container(
      color: lightGreen2,
      child: Container(
        margin: EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
        height: Get.height / 8,
        decoration: BoxDecoration(
          color: backgroundGreen.withOpacity(0.5),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
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
                  'Gamze Şen',
                  style: TextStyle(
                    fontSize: 18,
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'TCKNN: 2898785262',
                  style: TextStyle(
                    fontSize: 12,
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Cronic: Epilepsy',
                  style: TextStyle(
                    fontSize: 10,
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            Container(
              height: Get.height / 8,
              width: Get.height / 12,
              decoration: BoxDecoration(
                color: darkGreen,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Image(
                  image: AssetImage('assets/icons/info.png'),
                  width: 100,
                  height: 100),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessages() {
    return Container(
      height: Get.height / 1.8,
      color: backgroundGreen.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: darkGreen,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                width: Get.width / 1.4,
                height: Get.height / 12,
                padding: const EdgeInsets.all(12),
                child: Text("Patient fainted and hit her head on the ground.",
                    style: TextStyle(color: whiteColor)),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: darkGreen,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                width: Get.width / 1.4,
                height: Get.height / 12,
                padding: const EdgeInsets.all(12),
                child: Text("How can we intervene? She's unconscious now.",
                    style: TextStyle(color: whiteColor)),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: lightGreen2,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                width: Get.width / 1.4,
                height: Get.height / 10,
                padding: const EdgeInsets.all(12),
                child: Text(
                    "Create an airy environment. She will come to his senses in a short time.",
                    style: TextStyle(color: whiteColor)),
              ),
              SizedBox(width: 10),
            ],
          ),
          !showNewMessage ? Container() : SizedBox(height: 10),
          !showNewMessage
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: lightGreen2,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      width: Get.width / 1.4,
                      height: Get.height / 10,
                      padding: const EdgeInsets.all(12),
                      child: Text(customMessage,
                          style: TextStyle(color: whiteColor)),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _builMessageInput() {
    return Container(
      color: lightGreen2,
      height: Get.height / 12,
      child: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  isTyping = value.isNotEmpty;
                  customMessage = value;
                });
              },
              controller: messageController,
              style: TextStyle(color: whiteColor),
              cursorColor: whiteColor,
              decoration: InputDecoration(
                hintText: '',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                fillColor: darkGreen,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: darkGreen, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: darkGreen, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                suffixIcon: SizedBox(
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image(
                          image: AssetImage('assets/icons/gallery.png'),
                          width: 30,
                          height: 50),
                      SizedBox(width: 10),
                      Image(
                          image: AssetImage('assets/icons/camera.png'),
                          width: 30,
                          height: 50),
                      SizedBox(width: 10)
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              showNewMessage = true;
              messageController.clear();
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                  color: backgroundGreen,
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Image(
                  image: AssetImage(
                      'assets/icons/${isTyping ? "send" : "mic"}.png'),
                  width: 50,
                  height: 50),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
