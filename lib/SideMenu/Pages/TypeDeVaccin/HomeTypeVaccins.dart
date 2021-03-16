import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'FirstBottomSheet.dart';
import 'SecondBottomSheet.dart';
import 'ThirdBottomSheet.dart';

class TypeVaccins extends StatefulWidget {
  TypeVaccins({Key key}) : super(key: key);

  @override
  _TypeVaccinsState createState() => _TypeVaccinsState();
}

class _TypeVaccinsState extends State<TypeVaccins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Type de vaccins"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            var showData = json.decode(snapshot.data.toString());

            return ListView.builder(
              itemCount: showData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    elevation: 20.0,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              showData[index]['VaccinNom'],
                              style: GoogleFonts.oswald(
                                fontSize: 25,
                                color: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    showData[index]['Definitions'].toString(),
                                    style: GoogleFonts.montserrat(
                                      fontSize: context.safePercentHeight * 2.2,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                    //maxLines: 2,
                                    //overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                onPressed: () {
                                  /*Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));*/
                                  if (showData[index]['VaccinNom'] ==
                                      "Vecteur Virale") {
                                    _chooseDetails(context);
                                  }
                                  if (showData[index]['VaccinNom'] ==
                                      "Vaccin à ARN messager, vecteur") {
                                    _chooseDetails2(context);
                                  }
                                  if (showData[index]['VaccinNom'] ==
                                      "Vaccins à virus inactivé") {
                                    _chooseDetails3(context);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    color: Colors.blue,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 40,
                                          right: 40,
                                          top: 12,
                                          bottom: 12),
                                      child: Text(
                                        'Ouvrir',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          future: DefaultAssetBundle.of(context)
              .loadString("assets/json/DataVaccins.json"),
        ),
      ),
    );
  }
}

void _chooseDetails(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: Color(0xff757575),
          child: Container(
            child: FirstBottomSheet(),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                )),
          ),
        );
      });
}

void _chooseDetails2(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: Color(0xff757575),
          child: Container(
            child: SecondBottomSheet(),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                )),
          ),
        );
      });
}

void _chooseDetails3(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: Color(0xff757575),
          child: Container(
            child: ThirdBottomSheet(),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                )),
          ),
        );
      });
}
