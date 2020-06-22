import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListCard extends StatefulWidget {
  String name;
  Color color;
  String route;
  ListCard(this.name, this.color, this.route);

  @override
  _ListCardState createState() => _ListCardState(name, color, route);
}

class _ListCardState extends State<ListCard> {
  String name;
  Color color;
  String route;
  _ListCardState(this.name, this.color, this.route);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Padding(
        padding: EdgeInsets.only(
          right: 150,
          top: 10,
        ),
        child: Material(
          elevation: 10,
          shadowColor: Colors.black,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 40, //MediaQuery.of(context).size.width * 0.82,
            height: 50, //MediaQuery.of(context).size.height * 0.14,
            decoration: BoxDecoration(
              color: widget.color,
              //gradient: newGradient,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 5),
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 40,
                ),
                Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
