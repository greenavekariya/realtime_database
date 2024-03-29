import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:realtime/update_record.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Students');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Students');

  final _random = Random();

  Widget listItem({required Map student}) {
    return SingleChildScrollView(
      child: Card(
        elevation: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
            [_random.nextInt(9) * 100],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 6),
              ),
            ],
          ),
           margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          height: 110,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                student['name'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                student['password'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateRecord(studentKey: student['key'])));
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.amberAccent,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      reference.child(student['key']).remove();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red[700],
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
              Map student = snapshot.value as Map;
              student['key'] = snapshot.key;
              return listItem(student: student);
            },
          ),
        )
    );
  }
}
