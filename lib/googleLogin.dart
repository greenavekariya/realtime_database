import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login Screen",style: TextStyle(fontSize:23),),
        actions: [
          TextButton(onPressed: Logout,
        child: Text("Log Out")),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed:googleLogin, child: Text("Google Login"))
        ],
      ),
    );
  }

  void googleLogin() async{
    print("googleLogin method callied");
    GoogleSignIn _googlesignin = GoogleSignIn();
    try{
      var result = await _googlesignin.signIn();
      if(result == null){
        return;
      }
      final userdata = await result.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userdata.accessToken,idToken: userdata.idToken);

      var finalresult = await FirebaseAuth.instance.signInWithCredential(credential);
      print("result $finalresult");
      print(result.displayName);
      print(result.email);
      print(result.photoUrl);

    }catch(error){
      print("error occured");

    }
  }
}
Future<void> Logout()async{
  await GoogleSignIn().disconnect();
  FirebaseAuth.instance.signOut();
}

