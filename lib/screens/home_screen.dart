// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:Academy/model/course_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utilis/constants.dart';
import 'about.dart';
import 'my_profile.dart';
import 'settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final course1 = courses[0];
  final course2 = courses[1];
  final course3 = courses[2];
  final course4 = courses[3];

  final docList = [
    "empty",
  ];

  String firstName = "Loading...";
  String lastName = "Loading...";
  String email = "Loading...";
  String docName = "Loading...";

  Future<String> getDocInfo(String doc) async {
    //get doc info from the database
    //return the document name if it exists
    // else return empty
    return "empty";
  }

   Container headingContainer({text, double? size}) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$text",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: size,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          (text == "Quick Links")
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: const Color.fromARGB(255, 55, 14, 201),
                      width: 1,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Color.fromARGB(255, 55, 14, 201),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
              : (text != "Our Course")
                  ? const Text(
                      "View All",
                      style: TextStyle(
                        color: Color.fromARGB(255, 55, 14, 201),
                        fontSize: 15,
                      ),
                    )
                  : const Text(""),
        ],
      ),
    );
  }

  SizedBox quickLinks({text, icon, Function? ontap}) {
    return SizedBox(
      width: 147,
      height: 50,
      child: GestureDetector(
        onTap: () {
          ontap!();
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: const Color.fromARGB(31, 158, 158, 158),
                child: Icon(
                  icon,
                  size: 20,
                  color: const Color.fromARGB(101, 0, 0, 0),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color.fromARGB(255, 55, 14, 201),
        title: Row(
          children: [
            Image.asset(
              "assets/images/splash.png",
              height: 30,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "| AMS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      // drawer: NewDrawer(
      //   username : firstName,
      //   email: email,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Hello,",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "John",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 55, 14, 201),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "Welcome back to AMS",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: const Color.fromARGB(255, 55, 14, 201),
                    child: Container(
                      height: 37,
                      width: 37,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: FutureBuilder(
                          future: getDocInfo("profile"),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else {
                              if (snapshot.data == "empty") {
                                return Container();
                              } else {
                                return Image.network(
                                  "Snapshot.data",
                                  fit: BoxFit.cover,
                                );
                              }
                            }
                          }),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              headingContainer(text: "OUR COURSES", size: 15),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  height: 400,
                  child: CarouselSlider(
                    items: [
                      SizedBox(
                        height: 400,
                        child: CourseCard(
                          title: course1['title'] as String,
                          image: course1['imageUrl'] as String,
                          backgroundColor:
                              const Color.fromARGB(255, 130, 139, 139),
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        child: CourseCard(
                          title: course2['title'] as String,
                          image: course2['imageUrl'] as String,
                          backgroundColor:
                              const Color.fromARGB(255, 130, 139, 139),
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        child: CourseCard(
                          title: course3['title'] as String,
                          image: course3['imageUrl'] as String,
                          backgroundColor:
                              const Color.fromARGB(255, 130, 139, 139),
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        child: CourseCard(
                          title: course4['title'] as String,
                          image: course4['imageUrl'] as String,
                          backgroundColor:
                              const Color.fromARGB(255, 130, 139, 139),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        autoPlay: true,
                        height: 400,
                        autoPlayCurve: Curves.easeOut,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1800),
                        viewportFraction: 1),
                  ),
                ),
              ),
              headingContainer(
                text: "Quick Links",
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      quickLinks(
                          text: "My Profile",
                          icon: Icons.person_add_alt_1_outlined,
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyProfile()));
                          }),
                      const SizedBox(
                        width: 25,
                      ),
                      quickLinks(
                          text: "Forgot Pin",
                          icon: Icons.help_outline_rounded,
                          ontap: () {}),
                      const SizedBox(
                        width: 25,
                      ),
                      quickLinks(
                          text: "About",
                          icon: Icons.info_outline_rounded,
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => About()));
                          }),
                      const SizedBox(
                        width: 25,
                      ),
                      quickLinks(
                          text: "Settings",
                          icon: Icons.settings,
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsPage()));
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class DocContainer extends StatelessWidget {
//   const DocContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NestedScrollView(
//         floatHeaderSlivers: true,
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget> [];
//         },
//         body:ListView.builder(
//           itemCount: 30,
//           padding: const EdgeInsets.all(10),
//           itemBuilder: (BuildContext context, int index) {
//             return SizedBox(
//               height: 50,
//               child: Center(
//                 child: Text('item $index'),
//               ),
//             );
//           }),
//           ),
//     );
//   }
// }