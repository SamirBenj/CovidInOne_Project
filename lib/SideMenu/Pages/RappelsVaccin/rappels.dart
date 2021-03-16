import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RappelsVaccins extends StatefulWidget {
  RappelsVaccins({Key key}) : super(key: key);

  @override
  _RappelsVaccinsState createState() => _RappelsVaccinsState();
}

class _RappelsVaccinsState extends State<RappelsVaccins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rappels'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'Quels sont les document necessaires pur un test PCR ?',
                      style: GoogleFonts.oswald(
                        fontSize: 24,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Text(
                            'Carte Vitale/Atestation sécurté sociale',
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            'Une Pièce D’identité ',
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Source : Ameli.fr',
                          style: GoogleFonts.montserrat(
                            color: Colors.lightBlue,
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
      ),
    );
  }
}
