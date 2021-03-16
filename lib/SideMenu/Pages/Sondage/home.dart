import 'package:flutter/material.dart';

class HomeSur extends StatefulWidget {
  final bool salut;
  final Function changeData;
  final String title;
  HomeSur({Key key, this.salut, this.changeData, this.title}) : super(key: key);

  @override
  _HomeSurState createState() => _HomeSurState();
}

class _HomeSurState extends State<HomeSur> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.lightBlue,
      // margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: ListTile(
              title: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Oui',
                      textAlign: TextAlign.center,
                    ),
                    Checkbox(
                      value: widget.salut,
                      onChanged: widget.changeData,
                    ),
                    Text(
                      'Non',
                      textAlign: TextAlign.center,
                    ),
                    Checkbox(
                      value: false,
                      onChanged: null,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
