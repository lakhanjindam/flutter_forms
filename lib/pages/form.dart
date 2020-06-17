import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertemplates/widgets/form.dart';

class NewLoginPage extends StatefulWidget {
  @override
  _NewLoginPageState createState() => _NewLoginPageState();
}

class _NewLoginPageState extends State<NewLoginPage> {
  Gradient grad = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.blueGrey[600], Colors.blueGrey[800], Colors.blueGrey[900]],
    stops: [0.1, 0.4, 1.0],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resize the keyboard according to the screen size when using forms
      resizeToAvoidBottomPadding: false,
      body: Builder(builder: (BuildContext context) {
        return Material(
          child: Container(
              decoration: BoxDecoration(
                gradient: grad,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, top: 60, bottom: 20, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Icon(
                                FontAwesomeIcons.arrowLeft,
                                color: Colors.white,
                                size: 25,
                              )),
                        ]),
                    SizedBox(height: 60),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return RadialGradient(
                                  colors: <Color>[
                                    Colors.yellow,
                                    Colors.deepOrange.shade900
                                  ],
                                  radius: 1.0,
                                  center: Alignment.topLeft,
                                  tileMode: TileMode.mirror,
                                ).createShader(bounds);
                              },
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ]),
                    SizedBox(height: 70),
                    FormWidget(),
                  ],
                ),
              )),
        );
      }),
    );
  }
}
