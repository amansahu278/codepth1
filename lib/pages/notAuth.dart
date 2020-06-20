import 'package:codepth1/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class NotAuth extends StatefulWidget {
  @override
  _NotAuthState createState() => _NotAuthState();
}

class _NotAuthState extends State<NotAuth> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          gradient:LinearGradient(colors: [Colors.blueAccent, Colors.red], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Hero(
                tag: "Text",
                child: TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 500),
                  text: ["<NAME>"],
                  textStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            FlatButton(
              color: Colors.white,
              child: Text("Login"),
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              },
            )
          ],
        ),
      ),
    );
  }
}
