import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class SecondBottomSheet extends StatefulWidget {
  SecondBottomSheet({Key key}) : super(key: key);

  @override
  _SecondBottomSheetState createState() => _SecondBottomSheetState();
}

class _SecondBottomSheetState extends State<SecondBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
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
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: InkWell(
                          onTap: () {
                            if (showData[index]["nom"] == "Moderna") {
                              firstCard(context);
                            }
                            if (showData[index]["nom"] == "Pfizer-BioNTech") {
                              secondCard(context);
                            }
                          },
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            elevation: 20.0,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(),
                              child: Text(
                                showData[index]['nom'].toString(),
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
                  .loadString("assets/json/VaccinsARN.json"),
            ),
          ],
        ),
      ),
    );
  }
}

void firstCard(context) {
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
          height: MediaQuery.of(context).size.height * 0.50,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: Column(
                    children: [
                      Text(
                        showData[0]['nom'].toString(),
                        style: GoogleFonts.oswald(
                          fontSize: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Approuvé : " +
                                      showData[0]['Creer'].toString(),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Nombre d'injection : " +
                                      showData[0]['Injection'].toString(),
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
                              "Detail : " + showData[0]['Detail'].toString(),
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
                                      showData[0]['Efficacite'].toString(),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Source :" + showData[0]['source'].toString(),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            )
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
          .loadString("assets/json/VaccinsARN.json"),
    ),
  );
  showDialog(
    context: context,
    builder: (context) => dialog,
  );
}

void secondCard(context) {
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
          height: MediaQuery.of(context).size.height * 0.50,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: Column(
                    children: [
                      Text(
                        showData[1]['nom'].toString(),
                        style: GoogleFonts.oswald(
                          fontSize: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Approuvé : " +
                                      showData[1]['Creer'].toString(),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Nombre d'injection : " +
                                      showData[1]['Injection'].toString(),
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
                              "Detail : " + showData[1]['Detail'].toString(),
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
                                      showData[1]['Efficacite'].toString(),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Source :" + showData[1]['source'].toString(),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            )
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
          .loadString("assets/json/VaccinsARN.json"),
    ),
  );
  showDialog(
    context: context,
    builder: (context) => dialog,
  );
}
