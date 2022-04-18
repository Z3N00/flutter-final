import 'package:babycare/screens/HomePage.dart';
import 'package:babycare/screens/calendary.dart';
import 'package:babycare/screens/check_availability.dart';
import 'package:babycare/screens/splashscreen2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  final _email = TextEditingController();

  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error initializing Firebase');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Text(
                      'Baby Care+',
                      style: GoogleFonts.praise(
                        color: const Color(0xff693EFF),
                        fontSize: 60,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.82191780,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Welcome!',
                        style: TextStyle(
                            color: Color(0xff9D9998),
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            fontFamily: 'Roboto'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: TextFormField(
                          controller: _email,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular((5)),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular((5)),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xff6043F5), width: 2),
                              borderRadius: BorderRadius.circular((5)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 36,
                              vertical:
                                  MediaQuery.of(context).size.width * 0.019,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFECEDF1),
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                                color: Color(0xffBDB9B7),
                                fontWeight: FontWeight.w800,
                                fontSize: 8,
                                fontFamily: 'Roboto'),
                          ),
                          // onChanged: (value) => widget.onChange(),
                          // validator: MultiValidator([
                          //   RequiredValidator(errorText: 'Email Address is required.'),
                          //   EmailValidator(errorText: 'Use a valid email address.'),
                          // ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: TextFormField(
                          controller: _password,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular((5)),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular((5)),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xff6043F5), width: 2),
                              borderRadius: BorderRadius.circular((5)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 36,
                              vertical:
                                  MediaQuery.of(context).size.width * 0.019,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFECEDF1),
                            hintText: 'password',
                            hintStyle: const TextStyle(
                                color: Color(0xffBDB9B7),
                                fontWeight: FontWeight.w800,
                                fontSize: 8,
                                fontFamily: 'Roboto'),
                          ),
                          // onChanged: (value) => widget.onChange(),
                          // validator: MultiValidator([
                          //   RequiredValidator(errorText: 'Email Address is required.'),
                          //   EmailValidator(errorText: 'Use a valid email address.'),
                          // ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Future<String?> _loginAccount() async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: 'jup@gmail.com',
                                      password: '@jup1234');
                              return null;
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                return 'The password provided is too weak.';
                              } else if (e.code == 'email-already-in-use') {
                                // ignore: avoid_print
                                print('Login attempt failed');
                              }
                              e.message.toString();
                              return e.message;
                            } catch (e) {
                              // ignore: avoid_print
                              print(e);
                            }
                          }

                          _loginAccount();
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width *
                                  0.72191780,
                              height:
                                  MediaQuery.of(context).size.height * 0.060742,
                              decoration: BoxDecoration(
                                  color: const Color(0xff6043F5),
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: const Center(
                                  child: Text(
                                'Login ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15,
                                    fontFamily: 'Roboto'),
                              )),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            (MaterialPageRoute(
                              builder: (context) => const Splashscreen1(),
                            )),
                          );
                        },
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              'Do not have an Account? Sign Up',
                              style: TextStyle(
                                color: Color(0xff6043F5),
                                fontWeight: FontWeight.w800,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ));
        }
        return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF42A5F5)),
        );
      },
    );
  }
}
