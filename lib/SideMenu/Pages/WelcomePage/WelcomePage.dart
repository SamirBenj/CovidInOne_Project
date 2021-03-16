import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context, width: 400, height: 800);
    //SizeConfig().init(context);

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/Welcome.svg",
              width: context.screenWidth * 0.7,
            ),
            SizedBox(
              height: context.screenHeight * 0.09,
            ),
            Column(
              children: [
                Container(
                  child: Text(
                    "Bienvenue   !",
                    style: GoogleFonts.questrial(
                      fontSize: context.safePercentHeight * 6,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                Text(
                  'Le Saviez Vous ?',
                  style: GoogleFonts.questrial(
                    fontSize: context.safePercentHeight * 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                Text(
                  'Le premier vaccin a été crée en 1879 par Edward Jenner afin de lutter contre la variole des vaches. ',
                  style: GoogleFonts.questrial(
                    fontSize: context.safePercentHeight * 3,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                ),
              ],
            ),
            SizedBox(
              height: context.screenHeight * 0.09,
            ),
            // ignore: deprecated_member_use
            FlatButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                /*Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage()));*/

                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(seconds: 2),
                        transitionsBuilder:
                            (context, animation, animationTime, child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.elasticInOut);
                          return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child,
                          );
                        },
                        pageBuilder: (context, animation, animationTime) {
                          return MyHomePage();
                        }));
              },
              child: Material(
                elevation: 3.0,
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                  child: Text(
                    'Commencer',
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
