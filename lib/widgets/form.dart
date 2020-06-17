import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              onSaved: (String value) {
                setState(() {
                  _name = value;
                });
              },
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Email cannot be empty";
                }
                if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                    .hasMatch(value)) {
                  return "Invalid Email";
                }
              },
              style: TextStyle(
                color: Colors.white,
              ),
              //initialValue: "Enter your name",
              decoration: InputDecoration(
                //fills the input box with color.
                //fillColor: Colors.white,

                hintText: "Email",
                focusedBorder: UnderlineInputBorder(
                    //*changes underline  border color to orange when clicked!
                    borderSide: BorderSide(color: Colors.amber)),

                contentPadding: EdgeInsets.only(left: 5, right: 5),
                icon: Icon(
                  FontAwesomeIcons.envelope,
                  color: Colors.blueGrey,
                ),
              ),
              //* to show the text, true then hidden
              obscureText: false,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              //* to hide the text, true then hidden
              obscureText: true,
              onSaved: (String value) {
                setState(() {
                  _password = value;
                });
              },
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Password cannot be empty";
                }
                if (!RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                    .hasMatch(value)) {
                  return "Invalid password format";
                }
              },
              style: TextStyle(
                color: Colors.white,
              ),
              //initialValue: "Enter your name",
              decoration: InputDecoration(
                //fills the input box with color.
                //fillColor: Colors.white,

                hintText: "Password",
                focusedBorder: UnderlineInputBorder(
                    //*changes underline  border color to orange when clicked!
                    borderSide: BorderSide(color: Colors.amber)),

                contentPadding: EdgeInsets.only(left: 5, right: 5),
                icon: Icon(
                  FontAwesomeIcons.lock,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ButtonTheme(
            height: 65,
            minWidth: 300,
            child: RaisedButton(
              elevation: 20,
              onPressed: () {
                _formKey.currentState.validate()
                    ? Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Form Validated",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Colors.white,
                        ),
                      )
                    : Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Email or password not Validated",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
              },
              child: ShaderMask(
                shaderCallback: (Rect bounds) => RadialGradient(
                  colors: <Color>[
                    Colors.yellow,
                    Colors.deepOrange.shade900,
                  ],
                  radius: 1.0,
                  center: Alignment.topLeft,
                  tileMode: TileMode.mirror,
                ).createShader(bounds),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              color: Colors.black38,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35))),
            ),
          )
        ],
      ),
    );
  }
}
