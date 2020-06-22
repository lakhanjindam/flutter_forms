import 'package:flutter/material.dart';
import 'package:fluttertemplates/models/list_data.dart';
import 'package:fluttertemplates/widgets/list_card.dart';

class CardList extends StatelessWidget {
  List<ListData> data = [
    ListData("Log In", Colors.white, '/form'),
    ListData("Sign Up", Colors.green, '/signup'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListCard(
              data[index].name, data[index].color, data[index].route);
        });
  }
}
