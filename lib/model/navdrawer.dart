import 'package:Academy/screens/attendence.dart';
import 'package:Academy/screens/courses.dart';
import 'package:Academy/screens/notificationscreen.dart';
import 'package:flutter/material.dart';

import '../screens/about.dart';
import '../screens/my_profile.dart';
import '../screens/settings.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key, required this.email, required this.username});
  final String email;
  final String username;

  @override
  State<NavDrawer> createState() => NavDrawerState();
}

class NavDrawerState extends State<NavDrawer> {
  String themeNow = "dark";
  String profile = "empty";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                child: Stack(
                  // fit: StackFit.expand,
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 55, 14, 201),
                    ),
                    Transform.translate(
                      offset: const Offset(16, 20),
                      child: CircleAvatar(
                        radius: 58,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/splash.png',
                              height: 55,
                            ),
                            const Text(
                              "AMS",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(250, 25),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(26, 0, 0, 0),
                                  blurRadius: 2.0,
                                  spreadRadius: -2.0),
                            ],
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromARGB(56, 255, 255, 255)),
                        // child: Consumer<ThemeProvider>(
                        //   builder: (context, ThemeProvider, child) {
                        //     return GestureDetector(
                        //       onTap: (() {
                        //         var theme = ThemeProvider.currentTheme;
                        //         if (theme == "system" || theme == "light") {
                        //           ThemeProvider.changeTheme("dark");
                        //         } else {
                        //           ThemeProvider.changeTheme("light");
                        //         }
                        //       }),
                        //       child: (ThemeProvider.currentTheme == "light")
                        //           ? const Icon(Icons.sunny,
                        //               size: 28, color: Colors.white)
                        //           : const Icon(
                        //               Icons.nightlight_outlined,
                        //               size: 28,
                        //               color: Colors.white,
                        //             ),
                        //     );
                        //   },
                        // ),
                      ),
                    )
                  ],
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.person_outline_rounded,
              size: 30,
            ),
            title: const Text(
              'My Profile',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyProfile()))
            },
          ),
             ListTile(
            leading: const Icon(
              Icons.menu_book_outlined,
              size: 30,
            ),
            title: const Text(
              'Courses',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CourseScreen())),
            },
          ),
             ListTile(
            leading: const Icon(Icons.notifications,
            size: 30,),
            title: const Text(
              'Notification',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NotificationScreen()))
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline_rounded,
              size: 30,
            ),
            title: const Text(
              'About',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const About()))
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings_outlined,
              size: 30,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()))
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.book,
              size: 30,
            ),
            title: const Text(
              'Attendence',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendenceScreen())),
              
            },
          ),
          const ListTile(
            leading: Icon(
              Icons.logout_rounded,
              size: 30,
            ),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            // onTap: () => {UserManagement().logOut(context)},
          ),
        ],
      ),
    );
  }
}
