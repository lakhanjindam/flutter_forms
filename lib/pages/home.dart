import 'package:flutter/material.dart';
import 'package:fluttertemplates/widgets/list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.teal,
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.tealAccent],
            stops: [0.4, 1.0],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.deepOrange, Colors.orange],
                  stops: [0.4, 1.0],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: Text(
                "Flutter widgets",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: CardList(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
