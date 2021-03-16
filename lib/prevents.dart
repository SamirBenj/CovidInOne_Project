import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class Prevent extends StatefulWidget {
  final Map covidDataFranceAll;
  final String nameField;
  const Prevent({Key key, this.covidDataFranceAll, this.nameField})
      : super(key: key);

  @override
  _PreventState createState() => _PreventState();
}

class _PreventState extends State<Prevent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 10.0, //Taille horizontale du box
      ),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        //color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(13),
            bottomRight: Radius.circular(13),
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13)),
      ),
      child: Column(
        children: [
          Text(
            'Preventions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
              letterSpacing: 5,
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.03,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, //espace entre les container
            children: [
              //1 er Container
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/icons/washHands.svg',
                  height: context.screenHeight * 0.13,
                ),
              ),
              //2 eme Container
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/icons/mask.svg',
                  height: context.screenHeight * 0.13,
                ),
              ),
              //3 eme Container
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/icons/distance.svg',
                  height: context.screenHeight * 0.13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
