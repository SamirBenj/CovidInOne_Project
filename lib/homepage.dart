import 'package:flutter/material.dart';
import 'package:flutter_application_1/WorldData/worlddata.dart';
import 'package:flutter_application_1/prevents.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'FranceData/FranceData.dart';
import 'SideMenu/sideMenu.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map covidDataAllYesterday;
  fetchCovidDataAllYesterday() async {
    http.Response response =
        await get(Uri.https("disease.sh", "v3/covid-19/all"));

    setState(() {
      var covidDataAllYesterday1 = jsonDecode(response.body);
      covidDataAllYesterday = covidDataAllYesterday1;
    });
    //debugPrint(response.body);
    //debugPrint('Passer par la');
  }

  Map covidDataFranceAll;
  fetchCovidDateFrance() async {
    http.Response response =
        await get(Uri.https("disease.sh", "v3/covid-19/countries/France"));
    //print('reussi France ALone');

    setState(() {
      var covidDataFranceAllTest = jsonDecode(response.body);
      covidDataFranceAll = covidDataFranceAllTest;
    });
    //debugPrint(response.body);
    //debugPrint('Passer par la');
  }

  Map covidDataFrance;

  Future fetchCovidDateWorld() async {
    http.Response response =
        await get(Uri.https("disease.sh", "v3/covid-19/all"));

    setState(() {
      var covidDataFranceTest = jsonDecode(response.body);
      covidDataFrance = covidDataFranceTest;
    });

    return covidDataFrance;
  }

  @override
  void initState() {
    fetchCovidDateWorld();

    fetchCovidDateFrance();
    fetchCovidDataAllYesterday();
    super.initState();
  }

  @override
  void setState(fn) {
    //fetchCovidDateWorld();

    //fetchCovidDateFrance();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('CovidInOne'),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            covidDataFrance == null
                ? CircularProgressIndicator()
                : WorldData(
                    covidDataFrance: covidDataFrance,
                    covidDataAllYesterday: covidDataAllYesterday),
            Prevent(),
            covidDataFranceAll == null
                ? CircularProgressIndicator()
                : FranceData(
                    covidDataFranceAll: covidDataFranceAll,
                  ),
            // Text(covidDataFranceAll['cases'].toString()),
          ],
        ),
      ),
    );
  }
}
