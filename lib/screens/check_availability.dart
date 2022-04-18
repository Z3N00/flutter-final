import 'package:babycare/screens/HomePage.dart';
import 'package:babycare/screens/choose_signup_option.dart';
import 'package:babycare/screens/sing_up.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CheckAvailabity extends StatefulWidget {
  const CheckAvailabity({Key? key}) : super(key: key);

  @override
  State<CheckAvailabity> createState() => _CheckAvailabityState();
}

class _CheckAvailabityState extends State<CheckAvailabity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(''),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(70.0),
                      child: Image.asset('assets/niki.png')),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(170)),
                ),
              )
            ]),
        backgroundColor: const Color(0xff693EFF),
        extendBody: true,
        body: SingleChildScrollView(
          
          child: Column(children: [
           const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:38.0,top: 20),
                              child: Row(
                                children:const [
                                  Text('Start Date',style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                  
                                ],
                              ),
                            )
                          ],
                        ),
            )
          ]),
        ));
  }
}
