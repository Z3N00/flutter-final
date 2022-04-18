import 'package:babycare/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUPPage extends StatefulWidget {
  const SignUPPage({Key? key}) : super(key: key);

  @override
  State<SignUPPage> createState() => _SignUPPageState();
}

class _SignUPPageState extends State<SignUPPage> {
  // final FocusNode _uidFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  Future<String?> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: 'mwangi@gmail.com', password: '120Pass@');
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password is weak');
      } else if (e.code == 'email-already-in-use') {
        return ('The account already exists for that email.');
      }
      // ignore: avoid_print
      print(e.message);
    } catch (e) {
      return (e.toString());
    }
    return null;
  }



  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  final _passwordOne = TextEditingController();
  final _passwordTwo = TextEditingController();
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
                InkWell(
                  onTap: () {
                    _createAccount();
                    // addUser();
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.82191780,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Sign Up !',
                          style: TextStyle(
                              color: Color(0xff9D9998),
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              fontFamily: 'Roboto'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: TextFormField(
                            controller: _name,
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
                              hintText: 'Name',
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
                            controller: _phone,
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
                              hintText: 'Phone',
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
                            controller: _address,
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
                              hintText: 'Address',
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
                            obscureText: true,
                            controller: _passwordOne,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordTwo,
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
                              hintText: 'Confirm Password',
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
                        Center(
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
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15,
                                    fontFamily: 'Roboto'),
                              )),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              (MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              )),
                            );
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                'Already have an Account? Sign In',
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
