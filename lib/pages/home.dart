import 'package:flutter/material.dart';
import 'package:fluttertemplates/widgets/list.dart';

class HomePage extends StatelessWidget {
  double width = 392.72;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(30)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 392.72 - 230.72),
              child: Container(
                height: 50,
                width: 230.72,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(30)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Get",
              style: TextStyle(
                color: Colors.black,
                fontSize: 80,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Started.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 80,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 60,
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
