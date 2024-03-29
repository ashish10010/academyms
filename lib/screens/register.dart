import 'package:Academy/model/reusable.dart';
import 'package:Academy/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailTextController = TextEditingController();
 final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget>
      [
        Image.asset(
          "assets/images/backgroundlogin.jpg",  // Replace with your image path
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      Scaffold(
       backgroundColor: Colors.transparent,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
      
              const SizedBox(height: 50,),
      
             Image.asset('assets/images/loginn.png',
              height: 150,
              width: 150,
              ),
              const Text('AMS',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 40,
                color: Colors.white,
               ),
              ),
                   Center(
                  child: Column(
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Container(
                            height: 380,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 40,
                                ),
                                reusableTextField('Email', Icons.person, false,
                                    _emailTextController),
                                const SizedBox(
                                  height: 20,
                                ),
                                reusableTextField("Password", Icons.lock, true,
                                    _passwordTextController),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 35,
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      55,
                                      14,
                                      214,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>const HomeScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Already have an account',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Sign In ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:Color.fromARGB(
                                      255,
                                      55,
                                      14,
                                      214,
                                    ),
                                        
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
           ),
          ),
        ),
      ),
      ],
    );
  }
}