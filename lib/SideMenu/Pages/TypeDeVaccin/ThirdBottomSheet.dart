import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class ThirdBottomSheet extends StatefulWidget {
  ThirdBottomSheet({Key key}) : super(key: key);

  @override
  _ThirdBottomSheetState createState() => _ThirdBottomSheetState();
}

class _ThirdBottomSheetState extends State<ThirdBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25, //taille bottom sheet
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child:
            /*Column(
          children: [
            Text(
              'Sélectionner un Vaccins',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
              ),
            ),*/
            Expanded(
          child: Column(
            children: [
              Text(
                'Sélectionner un Vaccins',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                ),
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  var showData = json.decode(snapshot.data.toString());

                  return Container(
                    height: MediaQuery.of(context).size.height *
                        0.15, //taille list view builder a changer !!
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: InkWell(
                            onTap: () {
                              thirdBottomSheet(context);
                            },
                            child: Material(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              elevation: 20.0,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(),
                                child: Text(
                                  showData[0]['nom'].toString(),
                                  style: GoogleFonts.oswald(
                                    fontSize: 25,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: showData == null ? 0 : showData.length,
                    ),
                  );
                },
                future: DefaultAssetBundle.of(context)
                    .loadString("assets/json/VaccinInactivate.json"),
              ),
            ],
          ),
        ),
        // ],
      ),
    );
  }
}

void thirdBottomSheet(context) {
  Dialog dialog = new Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    child: FutureBuilder(
      builder: (context, snapshot) {
        var showData = json.decode(snapshot.data.toString());
        return Container(
          height: MediaQuery.of(context).size.height * 0.60,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: Column(
                    children: [
                      Text(
                        showData[index]['nom'].toString(),
                        style: GoogleFonts.oswald(
                          fontSize: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: [
                            Text(
                              "Approuvé : " +
                                  showData[index]['Creer'].toString(),
                              style: GoogleFonts.montserrat(
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Nombre d'injection : " +
                                      showData[index]['Injection'].toString(),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              "Detail : " +
                                  showData[index]['Detail'].toString(),
                              style: GoogleFonts.montserrat(
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            /* ],
                            ),*/
                            Row(
                              children: [
                                Text(
                                  "Efficacité : " +
                                      showData[index]['Efficacite'].toString(),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Source : " +
                                      showData[index]['source'].toString(),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    color: Colors.blue,
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: showData == null ? 0 : showData.length,
          ),
        );
      },
      future: DefaultAssetBundle.of(context)
          .loadString("assets/json/VaccinInactivate.json"),
    ),
  );
  showDialog(
    context: context,
    builder: (context) => dialog,
  );
}
