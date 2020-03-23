import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
      ),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {

  String equation = "0";
  String result = "0";
  String expression = "0";
  double eqfontsize = 38.0;
  double resultfontsize = 48.0;

  buttonPressed(String data){
    setState(() {
      if (data=="C"){
        equation = "0";
        result = "0";
        eqfontsize = 38.0;
        resultfontsize = 48.0;
      }
      else if (data=="⌫"){
        equation = equation.substring(0,equation.length-1);
        if (equation==""){
          equation = "0";
        }
        eqfontsize = 48.0;
        resultfontsize = 38.0;
      }
      else if (data=="="){
        eqfontsize = 38.0;
        resultfontsize = 48.0;
        expression = equation;
        expression = expression.replaceAll("×", "*");
        expression = expression.replaceAll("÷", "/");
        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch(e) {
          result = "Error";
        }
      }
      else{
        eqfontsize = 48.0;
        resultfontsize = 38.0;
        if (equation=="0") {
          equation = data;
        }
        else {
          equation = equation + data;
        }
      }
    });
  }

  Widget buildButtons(String text, double height, Color btncolor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.10 * height,
      color: btncolor,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(
                color: Colors.white,
                width: 1,
                style: BorderStyle.solid,
              )
          ),
          onPressed: () => buttonPressed(text),
          padding: EdgeInsets.all(1.0),
          child: Text(text, style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: eqfontsize),),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(result, style: TextStyle(fontSize: resultfontsize),),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                    children: [
                      buildButtons("C", 1, Colors.redAccent),
                      buildButtons("⌫", 1, Colors.black87),
                      buildButtons("÷", 1, Colors.deepPurpleAccent),
                      ]
                    ),
                    TableRow(
                        children: [
                          buildButtons("7", 1, Colors.black54),
                          buildButtons("8", 1, Colors.black54),
                          buildButtons("9", 1, Colors.black54),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButtons("4", 1, Colors.black54),
                          buildButtons("5", 1, Colors.black54),
                          buildButtons("6", 1, Colors.black54),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButtons("1", 1, Colors.black54),
                          buildButtons("2", 1, Colors.black54),
                          buildButtons("3", 1, Colors.black54),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButtons(".", 1, Colors.black54),
                          buildButtons("0", 1, Colors.black54),
                          buildButtons("00", 1, Colors.black54),
                        ]
                    ),
                  ]
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                    children: [
                      TableRow(
                          children: [
                            buildButtons("×", 1, Colors.deepPurpleAccent),
                          ]
                      ),
                      TableRow(
                          children: [
                            buildButtons("-", 1, Colors.deepPurpleAccent),
                          ]
                      ),
                      TableRow(
                          children: [
                            buildButtons("+", 1, Colors.deepPurpleAccent),
                          ]
                      ),
                      TableRow(
                          children: [
                            buildButtons("=", 2, Colors.green),
                          ]
                      ),
                    ])
              )
            ],
          )
        ],
      ),
    );
  }
}

