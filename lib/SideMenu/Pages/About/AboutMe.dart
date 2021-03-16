import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Qui somme nous ?'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Good Question !',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Text(
                'Go follow me on noWhere ',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ));
  }
}
