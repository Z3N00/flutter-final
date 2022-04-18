import 'package:babycare/screens/viewProfil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String photourl = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(''),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () async {},
              icon: const Icon(Icons.logout),
            ),
          ]),
      backgroundColor: const Color(0xff693EFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(70)),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 30.0, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Baby Sitters',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff6043F5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance
                      .collection("users")
                      .where('userType', isEqualTo: 'sitter')
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                            children: snapshot.data!.docs.map((document) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFEBFC),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        document['name'],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff6043F5),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.star),
                                          Text(
                                            document['rating'],
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Color(0xff6043F5),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            (MaterialPageRoute(
                                              builder: (context) => ViewProf(
                                                nameofSitter: 'Nikita Johnes',
                                                parentKey: 'DDDFf2',
                                                uniquekey: 'eewee3',
                                              ),
                                            )),
                                          );
                                        },
                                        child: const Text('View Profile'),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/niki.png'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList()),
                      );
                    }

                    // Loading State
                    return Center(
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        height: 50,
                        width: 50,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2.0,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SingleBabySitter extends StatelessWidget {
  const SingleBabySitter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
            color: const Color(0xffEEF1F5),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  // BabysitterName,
                  'Baby Sitter name',
                  // BabySitterName,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff6043F5),
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.star),
                    Text(
                      '4.7',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xff6043F5),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   (MaterialPageRoute(
                    //     builder: (context) => ViewProf(),
                    //   )),
                    // );
                  },
                  child: const Text('View Profile'),
                ),
                // customallBtn(Color(0xff6043F5),'View Profile',context),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // child: Image.network(SitterImage),
                child: Image.asset('assets/niki.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
