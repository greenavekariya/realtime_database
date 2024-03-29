import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Email = TextEditingController();
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown.withOpacity(0.4),
        body: Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.only(top: 120, left: 22),
                  child: Text("HELLO\nTHERE!", style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 18, right: 18),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40,),
                        TextField(
                          controller: username,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.person),
                              hintText: "USERNAME",
                              hintStyle: TextStyle(color: Colors.brown[900])
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextField(
                          controller: password,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.visibility_off),
                              hintText: "PASSWORD",
                              hintStyle: TextStyle(color: Colors.brown[900])
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        TextField(
                          controller: Email,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.check),
                              hintText: "EMAIL",
                              hintStyle: TextStyle(color: Colors.brown[900])
                          ),
                        ),
                        const SizedBox(height: 80,),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 70,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.brown[800],
                            ),
                            child: const Center(
                              child: Text("SIGN UP", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                        const SizedBox(height: 140),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
