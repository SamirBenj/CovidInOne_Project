import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class FirstBottomSheet extends StatefulWidget {
  FirstBottomSheet({Key key}) : super(key: key);

  @override
  _FirstBottomSheetState createState() => _FirstBottomSheetState();
}

class _FirstBottomSheetState extends State<FirstBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
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
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: InkWell(
                onTap: () {
                  _testShow(context);
                },
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  elevation: 20.0,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(),
                    child: Text(
                      "Astranezeca",
                      style: GoogleFonts.oswald(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _testShow(context) {
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
          height: MediaQuery.of(context).size.height * 0.65,
          child: ListView.builder(
            itemCount: showData.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: Column(
                    children: [
                      Text(
                        'Vaccin Astranezeca',
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
                            Row(
                              children: [
                                Text(
                                  "Source :" +
                                      showData[index]['source'].toString(),
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
          ),
        );
      },
      future: DefaultAssetBundle.of(context)
          .loadString("assets/json/VecteurVirale.json"),
    ),
  );
  showDialog(
    context: context,
    builder: (context) => dialog,
  );
}
