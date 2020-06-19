import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String _email = "";
  String password = "";
  String _password = "";
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              onChanged: (String value) {
                email = value;
              },
              onSaved: (String value) {
                _email = email;
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
              onChanged: (String value) {
                password = value;
              },
              onSaved: (String value) {
                _password = password;
              },
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Password cannot be empty";
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
                validateLogin();
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

  String hashPass() {
    return new DBCrypt().hashpw(_password, new DBCrypt().gensalt());
  }

  _showLogIn() {
    var alertStyle = AlertStyle(
        animationType: AnimationType.fromTop,
        isOverlayTapDismiss: false,
        isCloseButton: false,
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ));
    Alert(
        type: AlertType.success,
        title: "Sign In success",
        style: alertStyle,
        context: context,
        buttons: [
          DialogButton(
            onPressed: () {
              //removes previous routes in stack and push current route.
              Navigator.pushNamedAndRemoveUntil(
                  context, '/user', (Route<dynamic> route) => false);
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            color: Colors.greenAccent,
            radius: BorderRadius.all(Radius.circular(20)),
          )
        ]).show();
  }

  Future<void> setUser(String userName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(
      "user",
      userName,
    );
    print(pref.getString("user"));
  }

  Future<void> logIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password)
        .then((user) {
      setUser(_email);
//      print(user);
      isLogin = true;
    }).catchError((err) {
      print(err);
      if (err is PlatformException) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Invalid Email or Password"),
          backgroundColor: Colors.redAccent,
        ));
      }
    });
    if (isLogin) {
      _showLogIn();
    }
  }

  validateLogin() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
//      print(_email);
//      print(_password);
      logIn();
    }
  }
}
