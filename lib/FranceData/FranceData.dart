import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'FranceDataDesignCard.dart';

class FranceData extends StatefulWidget {
  final Map covidDataFranceAll;
  final String nameField;
  final String count;
  const FranceData({
    Key key,
    this.covidDataFranceAll,
    this.nameField,
    this.count,
  }) : super(key: key);

  @override
  _FranceDataState createState() => _FranceDataState();
}

class _FranceDataState extends State<FranceData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  widget.covidDataFranceAll != null
                      ? widget.covidDataFranceAll['countryInfo']['flag']
                      : CircularProgressIndicator(),
                  height: context.screenHeight * 0.06,
                ),
                Text(
                  'France',
                  style: GoogleFonts.anton(
                    fontSize: 25,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
            children: <Widget>[
              //First Card

              widget.covidDataFranceAll == null
                  ? Text('Loading...')
                  : FranceDataDesign(
                      count: NumberFormat.currency(
                              locale: 'FR', decimalDigits: 0, symbol: '')
                          .format(widget.covidDataFranceAll['cases']),
                      nameField: 'CONFIRME',
                      colorTextFrance: Colors.blue,
                    ),
              //Seconde card
              widget.covidDataFranceAll == null
                  ? Text('sa')
                  : FranceDataDesign(
                      count: NumberFormat.currency(
                              locale: 'FR', decimalDigits: 0, symbol: '')
                          .format(widget.covidDataFranceAll['deaths']),
                      nameField: 'DECES',
                      colorTextFrance: Colors.red,
                    ),
            ],
          ),
          //),
        ],
      ),
      // ),
    );
  }
}
