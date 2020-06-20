import 'package:codepth1/pages/notAuth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool isAuth = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotAuth()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          gradient: LinearGradient(colors: [Colors.blueAccent, Colors.red], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Center(
          child: Hero(
            tag: "Text",
            child: TypewriterAnimatedTextKit(
              speed: Duration(milliseconds: 500),
              text: ["<NAME>"],
              textStyle: TextStyle(
                fontSize: 30,
              color: Colors.white,
              fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold
            ),
            ),
          ),
        ),
      ),
    );
  }
}
