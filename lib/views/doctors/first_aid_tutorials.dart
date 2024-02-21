import 'package:e_health/utils/colors.dart';
import 'package:e_health/widgets/bouncing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FirstAidTutorials extends StatefulWidget {
  const FirstAidTutorials({super.key});

  @override
  State<FirstAidTutorials> createState() => _FirstAidTutorialsState();
}

class _FirstAidTutorialsState extends State<FirstAidTutorials> {
  List<OngoingPatient> ongoingPatients = [
    OngoingPatient(
        title: 'How to do the Primary Survey',
        subTitle:
            'https://www.youtube.com/watch?v=ea1RJUOiNfQ&pp=ygUTZmlyc3QgYWlkIHR1dG9yaWFscw%3D%3D',
        subTitle2: ''),
    OngoingPatient(
        title: 'How to Make A Sling',
        subTitle:
            'https://www.youtube.com/watch?v=PwfBGkBXkFA&pp=ygUTZmlyc3QgYWlkIHR1dG9yaWFscw%3D%3D',
        subTitle2: ''),
    OngoingPatient(
        title: 'How to Treat Cuts and Grazes',
        subTitle:
            'https://www.youtube.com/watch?v=4e7evinsfm0&pp=ygUTZmlyc3QgYWlkIHR1dG9yaWFscw%3D%3D',
        subTitle2: ''),
    OngoingPatient(
        title: 'How To Treat A Fracture & Fracture',
        subTitle:
            'https://www.youtube.com/watch?v=2v8vlXgGXwE&pp=ygUTZmlyc3QgYWlkIHR1dG9yaWFscw%3D%3D',
        subTitle2: ''),
    OngoingPatient(
        title: 'How to Use a Defibrillator (AED)',
        subTitle:
            'https://www.youtube.com/watch?v=UFvL7wTFzl0&pp=ygUTZmlyc3QgYWlkIHR1dG9yaWFscw%3D%3D',
        subTitle2: ''),
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
            width: Get.width / 2,
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
                'First Aid Tutorials',
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
          return Bouncing(
            onPress: () {
              Get.to(() => Scaffold(
                  appBar: AppBar(
                    title: Text(data.title),
                  ),
                  body: WebViewWidget(
                      controller: WebViewController()
                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..setBackgroundColor(const Color(0x00000000))
                        ..setNavigationDelegate(
                          NavigationDelegate(
                            onProgress: (int progress) {
                              // Update loading bar.
                            },
                            onPageStarted: (String url) {},
                            onPageFinished: (String url) {},
                            onWebResourceError: (WebResourceError error) {},
                          ),
                        )
                        ..loadRequest(Uri.parse(data.subTitle)))));
            },
            content: Stack(
              children: [
                Container(
                    margin: const EdgeInsets.all(8.0),
                    height: Get.height / 8,
                    decoration: BoxDecoration(
                      color: lightGreen2,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: darkGreen.withOpacity(0.5),
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
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
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: Get.width / 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: Get.height / 40),
                                    SizedBox(
                                      width: Get.width / 1.8,
                                      child: Text(
                                        data.title,
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            color: lightGreen2,
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
                                      color: lightGreen2,
                                    )),
                                SizedBox(
                                  width: Get.width / 12,
                                ),
                                Container(
                                  color: lightGreen2,
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
                                      color: lightGreen2,
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
                    child: Icon(Icons.play_arrow_rounded,
                        color: whiteColor, size: 40),
                  ),
                )
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
