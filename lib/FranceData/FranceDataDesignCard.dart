import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:velocity_x/velocity_x.dart';

const PrimaryColor = const Color(0xFF151026);

class FranceDataDesign extends StatelessWidget {
  final Map covidDataFranceAll;
  final String nameField;
  final String count;
  final Color colorTextFrance;
  const FranceDataDesign(
      {Key key,
      this.covidDataFranceAll,
      this.nameField,
      this.count,
      this.colorTextFrance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: context.screenWidth / 2,
      //color: Colors.red,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 4,
              spreadRadius: -2.0,
              offset: Offset(2.0, 3.0),
              color: Colors.black),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nameField,
            style: GoogleFonts.anton(
              fontSize: 20,
              letterSpacing: 1.0,
              color: colorTextFrance,
            ),
          ),
          SizedBox(
            //height: MediaQuery.of(context).size.height * 0.01,
            height: context.screenHeight * 0.01,
          ),
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              'source : dicease.sh',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
