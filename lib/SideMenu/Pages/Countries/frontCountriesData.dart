import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class FrontCountriesData extends StatefulWidget {
  FrontCountriesData({Key key}) : super(key: key);

  @override
  _FrontCountriesDataState createState() => _FrontCountriesDataState();
}

class _FrontCountriesDataState extends State<FrontCountriesData> {
  List covidAllDataCountries;
  fetchAllDataCountries() async {
    http.Response response =
        await http.get(Uri.https('disease.sh', '/v3/covid-19/countries'));
    setState(() {
      covidAllDataCountries = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchAllDataCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: covidAllDataCountries?.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            //card de chaque pays
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  spreadRadius: -3.0,
                  offset: Offset(4.0, 3.0),
                  //color: Colors.black,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),

            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(15),
            //color: Colors.green,
            //child: Container(),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: -3.0,
                        offset: Offset(2.0, 2.0),
                        //color: Colors.black,
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  width: double.infinity,
                  child: Text(
                    covidAllDataCountries[index]['country'].toString(),
                    style: GoogleFonts.anton(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  //height: MediaQuery.of(context).size.height * 0.02,
                  height: context.screenHeight * 0.02,
                ),
                Row(
                  children: [
                    Image.network(
                      covidAllDataCountries[index]['countryInfo']['flag'],
                      scale: 3.0,
                    ),
                    SizedBox(
                      //width: MediaQuery.of(context).size.width * 0.08,
                      width: context.screenWidth * 0.08,
                    ),
                    Column(
                      children: [
                        Text(
                          'CONFIRME',
                          style: GoogleFonts.anton(
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'FR', symbol: '', decimalDigits: 0)
                              .format(covidAllDataCountries[index]['cases']),
                          style: GoogleFonts.anton(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                    ),
                    Column(
                      children: [
                        Text(
                          'DECES',
                          style: GoogleFonts.anton(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          covidAllDataCountries[index]['deaths'].toString(),
                          style: GoogleFonts.anton(fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
