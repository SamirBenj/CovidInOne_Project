import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FlipCardCountries extends StatefulWidget {
  FlipCardCountries({Key key}) : super(key: key);

  @override
  _FlipCardCountriesState createState() => _FlipCardCountriesState();
}

class _FlipCardCountriesState extends State<FlipCardCountries> {
  List covidAllDataCountries;
  var searchData;
  fetchAllDataCountries() async {
    http.Response response =
        await http.get(Uri.https("disease.sh", "/v3/covid-19/countries"));
    setState(() {
      searchData = covidAllDataCountries = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchAllDataCountries();
    //_filterDataCountrie();
    super.initState();
  }

  void _filterDataCountrie(value) {
    // print(covidAllDataCountries
    //     .where((country) => country['country'] == 'Algeria')
    //     .toList());
    setState(() {
      searchData = covidAllDataCountries
          .where((country) =>
              country['country'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('AppBar');
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('PAYS'),
        //centerTitle: true,
        title: !isSearching
            ? Text('Statistiques')
            : TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Nom du pays',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    )),
                onChanged: (value) {
                  print(value);
                  _filterDataCountrie(value);
                  Text(value);
                },
              ),
        centerTitle: true,
        actions: [
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                      searchData = covidAllDataCountries;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                ),
        ],
      ),
      body: //Row(
          ListView.builder(
        itemCount: covidAllDataCountries?.length,
        itemBuilder: (BuildContext context, int index) {
          return covidAllDataCountries == null
              ? Center(child: CircularProgressIndicator())
              : FlipCard(
                  direction: FlipDirection.VERTICAL,
                  front: Container(
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
                            style: GoogleFonts.anton(
                                color: Colors.black, fontSize: 20),
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
                              covidAllDataCountries[index]['countryInfo']
                                  ['flag'],
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'FR',
                                          symbol: '',
                                          decimalDigits: 0)
                                      .format(covidAllDataCountries[index]
                                          ['cases']),
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  covidAllDataCountries[index]['deaths']
                                      .toString(),
                                  style: GoogleFonts.anton(fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  back: Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            //covidAllDataCountries[index]['country'].toString(),
                            "Aujourd'hui ",
                            style: GoogleFonts.anton(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          //height: MediaQuery.of(context).size.height * 0.02,
                          height: context.screenHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'FR',
                                          symbol: '',
                                          decimalDigits: 0)
                                      .format(covidAllDataCountries[index]
                                          ['todayCases']),
                                  style: GoogleFonts.anton(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  covidAllDataCountries[index]['todayDeaths']
                                      .toString(),
                                  style: GoogleFonts.anton(fontSize: 20),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'POPULATION',
                                  style: GoogleFonts.anton(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'FR',
                                          symbol: '',
                                          decimalDigits: 0)
                                      .format(covidAllDataCountries[index]
                                          ['population']),
                                  style: GoogleFonts.anton(fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: context.screenHeight * 0.02,
                        ),
                        Text(
                          "Information des cas de la journée sera mise à jour ce soir !",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
