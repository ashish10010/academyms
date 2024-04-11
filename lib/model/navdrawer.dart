import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  final String email;
  final String username;
  const NavDrawer({super.key, required this.email, required this.username});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: <Widget>[
           DrawerHeader(
            padding: EdgeInsets.zero,
             child: Container(
              child: Stack(
                children: [
                  Container(
                       color: const Color.fromARGB(255, 55, 14, 201),
                  ),
                    Transform.translate(
                        offset: Offset(16, 20),
                        child:  CircleAvatar(
                          radius: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/splash.png',
                              height: 55,
                              ),
                             const Text("AMS",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),)
                            ],
                          ),
                        ),
                      ),


                ],
              ),
              
             ),
           )
        ],
      ),
    );
  }
}
