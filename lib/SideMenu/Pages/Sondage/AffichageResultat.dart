import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AffichageResultat extends StatefulWidget {
  AffichageResultat({Key key}) : super(key: key);

  @override
  _AffichageResultatState createState() => _AffichageResultatState();
}

class _AffichageResultatState extends State<AffichageResultat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultat Sondage'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Questions").snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, int index) {
                var sommeOuiNon = snapshot.data.docs[index]['oui'] +
                    snapshot.data.docs[index]['non'];
                var oui = snapshot.data.docs[index]['oui'];
                var non = snapshot.data.docs[index]['non'];
                var pourcentageOui = oui / sommeOuiNon * 100;
                var pourcentageNon = non / sommeOuiNon * 100;
                return Container(
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        margin: EdgeInsets.all(10),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                snapshot.data.docs[index]['title'].toString(),
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 20, color: Colors.blue),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Oui",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.blueGrey),
                                  ),
                                  Text(
                                    "Non",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.red),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    pourcentageOui.toString() + ' %',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      pourcentageNon.toString() + ' %',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
