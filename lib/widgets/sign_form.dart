import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertemplates/models/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormSignIn extends StatefulWidget {
  @override
  _FormSignInState createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  final _formKey = GlobalKey<FormState>();

  String errMsg = "";
  String name;
  String _name = "";
  String email = "";
  String _email = "";
  String password = "";
  String _password = "";
  String checkPass = "";
  String _checkPass = "";
  bool isSignedIn = false;
  bool existUser = false;

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
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              onChanged: (String value) {
                name = value;
              },
              onSaved: (String value) {
                _name = name;
              },
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Name is empty";
                }
//                if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
//                    .hasMatch(value)) {
//                  return "Please provide valid name";
//                }
              },
              style: TextStyle(
                color: Colors.white,
              ),
              //initialValue: "Enter your name",
              decoration: InputDecoration(
                //fills the input box with color.
                //fillColor: Colors.white,

                hintText: "Name",
                focusedBorder: UnderlineInputBorder(
                    //*changes underline  border color to orange when clicked!
                    borderSide: BorderSide(color: Colors.amber)),

                contentPadding: EdgeInsets.only(left: 5, right: 5),
                icon: Icon(
                  FontAwesomeIcons.userCircle,
                  color: Colors.blueGrey,
                ),
              ),
              //* to show the text, true then hidden
              obscureText: false,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              //* to hide the text, true then hidden
              obscureText: false,
              onChanged: (value) {
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
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              //* to hide the text, true then hidden
              obscureText: false,
              // on change to keep track of changes when button is not pressed
              onChanged: (value) {
                checkPass = value;
              },
              onSaved: (String value) {
                //the form is saved below after validation then update the value
                _checkPass = checkPass;
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
                if (checkPass.trim() != password.trim()) {
                  return "Above password doesn't match.";
                }
              },
              style: TextStyle(
                color: Colors.white,
              ),
              //initialValue: "Enter your name",
              decoration: InputDecoration(
                //fills the input box with color.
                //fillColor: Colors.white,

                hintText: "Re-enter Password",
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
            height: 20,
          ),
          ButtonTheme(
            height: 65,
            minWidth: 300,
            child: RaisedButton(
              elevation: 20,
              onPressed: () {
                print(email + " " + _email);
                print(name + " " + _name);
                print(password + " " + _password);
                print(checkPass + " " + _checkPass);
                validateDetails();
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
                  "Sign Up",
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

  Future<void> checkExistUser() async {
    await Firestore.instance
        .collection("users")
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        if (_email == result.data["email"]) {
          print("$_email already exists in the users collections");
          existUser = true;
        } else {
          existUser = false;
        }
      });
    });
  }

  Future<void> signUp() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _email,
      password: new DBCrypt().hashpw(_password, new DBCrypt().gensalt()),
    )
        .then((signedInUser) {
      isSignedIn = true;

      //Storing the new user in firestore database
      UserManagement(signedInUser.user.uid)
          .storeNewUser(signedInUser.user, context);
    }).catchError((err) {
      if (err is PlatformException) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("$_email already exists!"),
          backgroundColor: Colors.redAccent,
        ));
        print(err);
      }
    });

    if (isSignedIn) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Sign In Success"),
        backgroundColor: Colors.green,
      ));
      Navigator.pop(context);
    }
  }

  void validateDetails() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(email + " " + _email);
      print(name + " " + _name);
      print(password + " " + _password);
      print(checkPass + " " + _checkPass);
      signUp();
    }
  }
}
