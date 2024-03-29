import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdateRecord extends StatefulWidget {

  const UpdateRecord({Key? key, required this.studentKey}) : super(key: key);

  final String studentKey;

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {

  final  namecontroller  = TextEditingController();
  final  passwordcontroller= TextEditingController();


  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Students');
    getStudentData();
  }

  void getStudentData() async {
    DataSnapshot snapshot = await dbRef.child(widget.studentKey).get();

    Map student = snapshot.value as Map;

    namecontroller.text = student['name'];
    passwordcontroller.text = student['password'];

  }

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
                          controller: namecontroller,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.check),
                              hintText: "GMAIL",
                              hintStyle: TextStyle(color: Colors.brown[900])
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextField(
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.visibility_off),
                              hintText: "PASSWORD",
                              hintStyle: TextStyle(color: Colors.brown[900])
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text("Forgot Password?", style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),),
                        ),
                        const SizedBox(height: 80,),
                        InkWell(
                          onTap : () {
                            Map<String, String> students = {
                              'name': namecontroller.text,
                              'password': passwordcontroller.text,

                            };

                            dbRef.child(widget.studentKey).update(students)
                                .then((value) => {
                              Navigator.pop(context)
                            });
                          },
                          child: Container(
                            height: 70,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.brown[800],
                            ),
                            child: const Center(
                              child: Text("UPDATE", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                        const SizedBox(height: 130),
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Don't Have account?"),
                              Text("Sign up", style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),)
                            ],
                          ),
                        )
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