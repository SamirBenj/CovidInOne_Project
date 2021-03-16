import 'package:flutter_application_1/SideMenu/Pages/Countries/FlipCard.dart';
import 'package:flutter_application_1/SideMenu/Pages/Sondage/AffichageResultat.dart';
import 'package:flutter_application_1/SideMenu/Pages/Sondage/SurveyHome.dart';
import 'package:flutter_application_1/SideMenu/Pages/TypeDeVaccin/HomeTypeVaccins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Pages/About/AboutMe.dart';
import 'Pages/News/NewsPage.dart';
import 'Pages/RappelsVaccin/rappels.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: context.screenHeight * 0.30,
            child: DrawerHeader(
              curve: Curves.linearToEaseOut,
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/logo_large.svg",
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/newsIcon.svg",
              width: MediaQuery.of(context).size.width * 0.09,
            ),
            title: Text(
              'Actualités',
              style: GoogleFonts.varelaRound(
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewsPageInfo()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/vaccinIcon.svg",
              width: MediaQuery.of(context).size.width * 0.09,
            ),
            title: Text(
              'Vaccins',
              style: GoogleFonts.varelaRound(
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TypeVaccins()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/trend.svg",
              width: MediaQuery.of(context).size.width * 0.09,
            ),
            title: Text(
              'Statistiques',
              style: GoogleFonts.varelaRound(
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FlipCardCountries()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/icon-sondage.svg",
              width: MediaQuery.of(context).size.width * 0.09,
            ),
            title: Text(
              'Sondage',
              style: GoogleFonts.varelaRound(
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SurveyHome()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/icon-result-sondage.svg",
              width: MediaQuery.of(context).size.width * 0.09,
            ),
            title: Text(
              'Resultat Sondage',
              style: GoogleFonts.varelaRound(
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AffichageResultat()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/documents.svg",
              width: MediaQuery.of(context).size.width * 0.09,
            ),
            title: Text(
              'Rappels',
              style: GoogleFonts.varelaRound(
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RappelsVaccins()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/aboutMeIcon.svg",
              width: MediaQuery.of(context).size.width * 0.09,
            ),
            title: Text(
              'À Propos',
              style: GoogleFonts.varelaRound(
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutMeSection()));
            },
          ),
        ],
      ),
    );
  }
}
