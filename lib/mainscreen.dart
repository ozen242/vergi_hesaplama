import 'package:flutter/material.dart';
import 'package:vergi_hesaplama/screens/calculator.dart';
import 'package:vergi_hesaplama/screens/kdv.dart';
import 'package:vergi_hesaplama/service/advert_service.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  final AdvertService _advertService = AdvertService();
  
  @override
  void initState() {
    _advertService.showBanner();
    super.initState();  //gerekli mi bilmiyorum !!!
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("KDV Hesaplama"),
        backgroundColor: Colors.black87,
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
                  color: Colors.blue[900],
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
                  color: Colors.blue[900],
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
