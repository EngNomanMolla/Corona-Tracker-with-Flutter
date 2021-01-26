import 'dart:async';

import 'package:covid_2010/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds:3),
        ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage())),

    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              width: 200,
              height:200,
              child:Image.asset("assets/image3.png"),
            ),
            SizedBox(height: 30,),
            Container(child: Text("Corona Tracker".toUpperCase(),style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white),),),
            SizedBox(height: 100,),
            Container(
              padding:EdgeInsets.all(30),
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
