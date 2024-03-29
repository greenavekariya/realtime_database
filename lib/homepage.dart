import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController phoneNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String phoneNumber = phoneNumberController.text.trim();
                verifyPhoneNumber(phoneNumber);
              },
              child: Text('Send Verification Code'),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {

      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        // Store the verificationId and show UI to enter the code
        // You can send the verificationId to another screen for user input.
        print('Code sent to $phoneNumber');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Called when the automatic code retrieval times out.
      },
    );
  }
}