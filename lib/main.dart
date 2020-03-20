import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:loginpage/DelayAnimation.dart';
import 'package:loginpage/MyAnimation.dart';

// #31B8F5 #5EC8F8
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  void _donothing(){

  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return MaterialApp(
      home : Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.blue[900],
                Colors.blue[800],
                Colors.blue[400],
              ]
            )
          ),

          child: Column(
            children: <Widget>[
              DelayAnimation(
              child: MyAnimation(
                child: AvatarGlow(
                  endRadius: 120,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.white24,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 0),
                  startDelay: Duration(seconds: 1),
                  child: Material(
                    elevation: 8.0,
                    shape:  CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child : FlutterLogo(
                        size: 70.0,
                      ),
                      radius: 70.0,
                    ),
                  ),
                ),
              ),
                delay: 2000,
              ),
              DelayAnimation(
                child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text("Welcome To Flutter World !", style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                ),
                delay: 2500,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: DelayAnimation(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(height: 25,),
                          DelayAnimation(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                  color: Colors.blue,
                                  blurRadius: 20,
                                  offset: Offset(0,10)
                                ),]
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200])),

                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Email or Phone number",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200])),

                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            delay: 3000,
                          ),
                          SizedBox(height: 30,),
                          Center(
                            child: DelayAnimation(
                              child: Text("Forget Password?", style: TextStyle(color: Colors.grey),),
                              delay: 3000,
                            ),
                          ),
                          SizedBox(height: 20,),
                          DelayAnimation(
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              child: FlatButton(
                                color: Colors.deepOrange[700],
                                child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: _donothing,
                              ),
                          ),
                          delay: 3000,
                          ),
                          SizedBox(height: 10,),
                          DelayAnimation(
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              child: FlatButton(
                                color: Colors.blue[700],
                                child: Text("Signup", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: _donothing,
                              ),
                            ),
                            delay: 3000,
                          ),
                        ],
                      ),
                    ),
                  ),
                  delay: 3000,
                ),
              )
              )
            ],
          ),
        ),
      )
    );
  }
}

