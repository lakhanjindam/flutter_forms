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
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Material(
            shadowColor: Colors.black87,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 400, //MediaQuery.of(context).size.width * 0.82,
              height: 100, //MediaQuery.of(context).size.height * 0.14,
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
                    width: 10,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    FontAwesomeIcons.angleRight,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
