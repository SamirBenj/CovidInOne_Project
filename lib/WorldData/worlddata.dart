import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'designWorldData.dart';

class WorldData extends StatefulWidget {
  final covidDataFrance;
  final covidDataAllYesterday;
  const WorldData({Key key, this.covidDataFrance, this.covidDataAllYesterday})
      : super(key: key);

  @override
  _WorldDataState createState() => _WorldDataState();
}

class _WorldDataState extends State<WorldData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            elevation: 5,
            color: Colors.blueAccent,
            child: Container(
              height: context.screenHeight * 0.43,
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: [
                  Design(
                    countYesterday: widget.covidDataAllYesterday['todayCases'],
                    svgpicIcons: SvgPicture.asset(
                      "assets/icons/case_1.svg",
                      color: Colors.blue,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: 20,
                    ),
                    coloricon: Colors.blue,
                    title: 'CONFIRME',
                    count: widget.covidDataFrance == null
                        ? 'Patientez..'
                        : NumberFormat.currency(
                                locale: 'FR', symbol: '', decimalDigits: 0)
                            .format(widget.covidDataFrance['cases']),
                  ),
                  Design(
                    countYesterday: widget.covidDataAllYesterday['todayDeaths'],
                    svgpicIcons: SvgPicture.asset(
                      "assets/icons/death.svg",
                      color: Colors.red,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: 20,
                    ),
                    coloricon: Colors.redAccent,
                    title: 'DECES',
                    count: NumberFormat.currency(
                            locale: 'FR', symbol: '', decimalDigits: 0)
                        .format(widget.covidDataFrance['deaths']),
                  ),
                  Design(
                    countYesterday:
                        widget.covidDataAllYesterday['todayRecovered'],
                    svgpicIcons: SvgPicture.asset(
                      "assets/icons/heart.svg",
                      //  color: Colors.green,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: 20,
                    ),
                    coloricon: Colors.greenAccent,
                    title: 'GUERIS',
                    count: NumberFormat.currency(
                            locale: 'FR', symbol: '', decimalDigits: 0)
                        .format(widget.covidDataFrance['recovered']),
                  ),
                  Design(
                    countYesterday: 0,
                    svgpicIcons: SvgPicture.asset(
                      "assets/icons/cross_black.svg",
                      //  color: Colors.green,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: 20,
                    ),
                    coloricon: Colors.greenAccent,
                    title: 'PAYS AFFECTÉ',
                    count: NumberFormat.currency(
                            locale: 'FR', symbol: '', decimalDigits: 0)
                        .format(widget.covidDataFrance['affectedCountries']),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Source : Worldometer.info',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/* Map covidDataFrance;

  fetchCovidDate() async {
    http.Response response =
        await http.get(Uri.https("disease.sh", "v3/covid-19/all"));

    setState(() {
      covidDataFrance = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCovidDate();
    super.initState();
  }

  @override
  void setState(fn) {
    fetchCovidDate();
    super.setState(fn);
  }
*/
