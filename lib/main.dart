import 'package:flutter/material.dart';
import 'package:vergi_hesaplama/screens/calculator.dart';
import 'package:vergi_hesaplama/screens/kdv.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
     appBar: AppBar(
        title: Text("KDV Hesaplama"),
        backgroundColor: Colors.deepPurple[700],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text("  Hesap Makinesi  "),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalculatorPage()),
                    );
                  },
                  color: Colors.deepPurple[700],
                  highlightColor: Colors.red[400],
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
              SizedBox(height: 10),
              RaisedButton(
                  child: Text("  KDV Hesaplama  "),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KDVCalculatorPage()),
                    );
                  },
                  color: Colors.deepPurple[700],
                  highlightColor: Colors.red[400],
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
            
            ],
          ),
        ),
      ),
    );
  }
}
