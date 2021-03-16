import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/SideMenu/Pages/Sondage/FireStoreFunction.dart';
import 'package:flutter_application_1/SideMenu/Pages/Sondage/home.dart';

import '../../../homepage.dart';

class SurveyHome extends StatefulWidget {
  SurveyHome({Key key}) : super(key: key);

  @override
  _SurveyHomeState createState() => _SurveyHomeState();
}

class _SurveyHomeState extends State<SurveyHome> {
  final referenceData =
      FirebaseFirestore.instance.collection('Questions').snapshots();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print('completed');
      setState(() {
        FirebaseFirestore.instance;
      });
    });
  }

  @override
  void setState(fn) {
    FirebaseDatabase.instance;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sondage'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Questions').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading');
          }
          return Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, int index) {
                    bool valeurOui = snapshot.data.docs[index]['valeurBool'];
                    DocumentSnapshot data = snapshot.data.docs[index];
                    print(data.toString());
                    // var sommeOuiNon = snapshot.data.docs[index]['oui'] +
                    //     snapshot.data.docs[index]['non'];
                    // print(sommeOuiNon);
                    return HomeSur(
                        // documen : docu;
                        salut: valeurOui,
                        title: snapshot.data.docs[index]['title'].toString(),
                        changeData: (bool value) {
                          setState(() {
                            editQuestions(value, data.id);
                            if (valeurOui != true) {
                              print('selectionner');
                              print(snapshot.data.docs[index]['title']
                                  .toString());
                              FirebaseFirestore.instance
                                  .collection("Questions")
                                  .doc(data.id)
                                  .update({'oui': FieldValue.increment(1)});
                            } else {
                              print('deselectionner');
                              FirebaseFirestore.instance
                                  .collection("Questions")
                                  .doc(data.id)
                                  .update({'oui': FieldValue.increment(-1)});
                            }
                          });
                        });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Container(
                  color: Colors.blue,
                  child: Text('Valider'),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
