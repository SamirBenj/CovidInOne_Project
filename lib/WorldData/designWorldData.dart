import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

class Design extends StatelessWidget {
  final String count;
  final String title;
  final Color coloricon;
  final SvgPicture svgpicIcons;
  final int countYesterday;
  const Design({
    Key key,
    this.count,
    this.title,
    this.coloricon,
    this.svgpicIcons,
    this.countYesterday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context, width: 400, height: 800);

    return LayoutBuilder(
      builder: (context, constraints) {
        //width = MediaQuery.of(context).size.width;
        return Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            //width: MediaQuery.of(context).size.width / 2 - 10,
            width: constraints.maxWidth / 2 - 10, //permet d'afficher sur 2

            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        //image svg dans un  container
                        alignment: Alignment.center,
                        //height: MediaQuery.of(context).size.height * 0.05,
                        height: context.screenHeight * 0.045,
                        width: MediaQuery.of(context).size.width * 0.08,
                        //height: ScreenUtil().setHeight(20),
                        //width: ScreenUtil().setWidth(20),
                        decoration: BoxDecoration(
                          color: Color(0xFFFF9C00).withOpacity(0.12),
                          shape: BoxShape.circle,
                        ),
                        child: svgpicIcons,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.02 //espace entre l'icon svg et le text 'cas confirmé'
                          ),
                      Text(
                        title
                            .toString(), //Titre soit cas confirmé ou Mort ou recovered
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.anton(
                            color: HexColor('a9abaf'),
                            fontSize: context.safePercentHeight * 2,
                            //fontSize: TestConfig().scaleWidth(19),
                            letterSpacing: 1.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0), //a changer
                  child: Row(
                    //2eme ligne
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: count,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('3a3e49'),
                                      fontSize: 20, //taille des resultat
                                    ),
                              ),
                              TextSpan(
                                text: "\n+" + countYesterday.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                  letterSpacing: 2.0,
                                  height:
                                      1.1, //distance separant du 1 ere text et du 2em
                                ),
                              ),
                              TextSpan(
                                text: "\nPersonnes",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                  letterSpacing: 2.0,
                                  height:
                                      2.0, //distance separant du 1 ere text et du 2em
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
