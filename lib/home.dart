import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:realtime/homepage.dart';
import 'package:realtime/sign_up.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

//import 'fetch_data.dart';

class ShareData extends StatefulWidget {
  const ShareData({super.key});

  @override
  State<ShareData> createState() => _ShareDataState();
}

class _ShareDataState extends State<ShareData> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Students');
  }

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
                  child: Text(
                    "HELLO\nTHERE!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
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
                        const SizedBox(
                          height: 40,
                        ),
                        TextField(
                          controller: username,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.check),
                              hintText: "GMAIL",
                              hintStyle: TextStyle(color: Colors.brown[900])),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextField(
                          controller: password,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.visibility_off),
                              hintText: "PASSWORD",
                              hintStyle: TextStyle(color: Colors.brown[900])),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            Logout();
                            // Map<String, String> students = {
                            //   'name': username.text,
                            //   'password': password.text,
                            // };
                            //
                            // dbRef.push().set(students);
                            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> FetchData()), (route) => false);
                          },
                          child: Container(
                            height: 70,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.brown[800],
                            ),
                            child: const Center(
                              child: Text(
                                "LOG IN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: googleLogin,
                          child: Container(
                              height: 70,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.brown[800],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/google.png",
                                    width: 40,
                                  ),
                                  Text(
                                    "Continue With Google",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )
                                ],
                              )),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Don't Have account?"),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignupScreen()));
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )
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
        ));
  }

  void googleLogin() async {
    print("googleLogin method callied");
    GoogleSignIn _googlesignin = GoogleSignIn();
    try {
      var result = await _googlesignin.signIn();
      if (result == null) {
        return;
      }
      final userdata = await result.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userdata.accessToken, idToken: userdata.idToken);
      var finalresult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print("result $finalresult");
      print(result.displayName);
      print(result.email);
      print(result.photoUrl);
      Navigator.push(context as BuildContext,
          MaterialPageRoute(builder: (context) => Home()));
    } catch (error) {
      print("error occured");
    }
  }

  Future<void> Logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  void appleSign() async {
    AuthorizationResult authorizationResult =
        await TheAppleSignIn.performRequests([
      const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    switch (authorizationResult.status) {
      case AuthorizationStatus.authorized:
        print("authorized");
        try {
          AppleIdCredential? appleCredentials = authorizationResult.credential;
          OAuthProvider oAuthProvider = OAuthProvider("apple.com");
          OAuthCredential oAuthCredential = oAuthProvider.credential(
              idToken: String.fromCharCodes(appleCredentials!.identityToken!),
              accessToken:
                  String.fromCharCodes(appleCredentials.authorizationCode!));
          print(appleCredentials.email);
          print(appleCredentials.fullName);
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
          if (userCredential.user != null) {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (builder) => Home()));
          }
        } catch (e) {
          print("apple auth failed $e");
        }

        break;
      case AuthorizationStatus.error:
        print("error" + authorizationResult.error.toString());
        break;
      case AuthorizationStatus.cancelled:
        print("cancelled");
        break;
      default:
        print("none of the above: default");
        break;
    }
  }
}
