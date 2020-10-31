import 'package:flutter/material.dart';

class KDVCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
    );
  }
}

class KDVCalculatorPage extends StatefulWidget {
  @override
  _KDVCalculatorPageState createState() => _KDVCalculatorPageState();
}

class _KDVCalculatorPageState extends State<KDVCalculatorPage> {
  TextEditingController tutarController = TextEditingController();
  TextEditingController kdvController = TextEditingController();

  TextEditingController temizleController = TextEditingController();
  FocusNode myFocusNode = new FocusNode();

  double tutar = 0;
  double kdvOrani = 0;

  double _islemTutari = 0;
  double _kdvTutari = 0;
  double _toplamTutar = 0;
  double _matrahTutari = 0;

  double islemTutari = 0;
  double kdvTutari = 0;
  double toplamTutar = 0;
  double matrahTutari = 0;

  bool pressAttention18 = false;
  bool pressAttention8 = false;
  bool pressAttention1 = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: AppBar(
      //     title: Text('KDV Hesaplama'), backgroundColor: Colors.deepPurple[600]),
      backgroundColor: Colors.blue[50],
      body: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        child: SingleChildScrollView(
          child: new Column(children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            buildTutar(),
            buildKDVOrani(),
            buildRowButtons(),
            buildRowButtons2(),
            buildKDVArea(),
          ]),
        ),
      ),
    );
  }

  Container buildKDVArea() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      child: new Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Text("KDV Dahil",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontSize: 21,
              )),
          Text("İşlem Tutarı: " + _islemTutari.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 18,
              )),
          Text("KDV Tutarı: " + _kdvTutari.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 18,
              )),
          Text("Toplam Tutar: " + _toplamTutar.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 18,
              )),
          Text("Matrah Tutarı: " + _matrahTutari.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 18,
              )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          Text("KDV Hariç",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontSize: 21,
              )),
          Text("İşlem Tutarı: " + islemTutari.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 18,
              )),
          Text("KDV Tutarı: " + kdvTutari.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 18,
              )),
          Text("Toplam Tutar: " + toplamTutar.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 18,
              )),
          Text("Matrah Tutarı: " + matrahTutari.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 18,
              )),
        ],
      ),
    );
  }

  Widget buildRowButtons2() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: RaisedButton(
                child: Text("Temizle"),
                onPressed: () {
                  temizle();
                  setState(() {
                    tutarController.text = "";
                    kdvController.text = "";
                  });
                },
                color: Colors.red[600],
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          ),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: RaisedButton(
                  child: Text("Hesapla"),
                  onPressed: () {
                    kdvDahilOraniniHesapla(tutar, kdvOrani);
                    kdvHaricOraniniHesapla(tutar, kdvOrani);
                  },
                  color: Colors.green[600],
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10))),
        ],
      ),
    );
  }

  Widget buildRowButtons() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: RaisedButton(
                child: Text("%18"),
                onPressed: () {
                  kdvOrani = 18;
                  setState(() {
                    pressAttention1 = false;
                    pressAttention8 = false;

                    pressAttention18 = !pressAttention18;
                    kdvController.text = "18";
                  });
                },
                color:Colors.blue[900],
                   
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: RaisedButton(
                child: Text("%8"),
                onPressed: () {
                  kdvOrani = 8;
                  setState(() {
                    pressAttention1 = false;
                    pressAttention18 = false;

                    pressAttention8 = !pressAttention8;

                    kdvController.text = "8";
                  });
                },
                color:Colors.blue[800],
                   
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: RaisedButton(
                child: Text("%1"),
                onPressed: () {
                  kdvOrani = 1;
                  setState(() {
                    pressAttention18 = false;
                    pressAttention8 = false;

                    pressAttention1 = !pressAttention1;

                    kdvController.text = "1";
                  });
                },
                color: Colors.blue[700],
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          ),
        ],
      ),
    );
  }

  Container buildKDVOrani() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: kdvController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.black87,
                width: 2.0,
              ),
            ),
            labelText: 'KDV Oranını Girin', //Matrah hesaplaması için
            labelStyle: TextStyle(
                color: myFocusNode.hasFocus ? Colors.black : Colors.black),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 2.0)),
          ),
          onChanged: (text) {
            setState(() {
              kdvOrani = double.parse(kdvController.text);

              pressAttention18 = false;
              pressAttention8 = false;
              pressAttention1 = false;
            });
          },
        ));
  }

  Container buildTutar() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: TextField(
          focusNode: myFocusNode,
          keyboardType: TextInputType.number,
          controller: tutarController,
          decoration: InputDecoration(
            // hintText: "An Outline Border TextField",

            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.black87, width: 2.0)),
            labelText: 'Tutarı Girin',
            labelStyle: TextStyle(
                color: myFocusNode.hasFocus ? Colors.black : Colors.black),

            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 2.0)),
          ),
          onChanged: (text) {
            setState(() {
              tutar = double.parse(tutarController.text);
            });
          },
        ));
  }

  void kdvHaricOraniniHesapla(double tutar, double kdvOrani) {
    setState(() {
      islemTutari = tutar;
      toplamTutar = tutar * (1 + (kdvOrani / 100));
      kdvTutari = toplamTutar - islemTutari;
      matrahTutari = kdvTutari / (kdvOrani / 100);
    });
  }

  void kdvDahilOraniniHesapla(double tutar, double kdvOrani) {
    setState(() {
      _islemTutari = tutar / (1 + (kdvOrani / 100));
      _toplamTutar = tutar;
      _kdvTutari = _toplamTutar - _islemTutari;
      _matrahTutari = _kdvTutari / (kdvOrani / 100);
    });
  }

  void temizle() {
    setState(() {
      pressAttention18 = false;
      pressAttention8 = false;
      pressAttention1 = false;

      _islemTutari = 0;
      _kdvTutari = 0;
      _toplamTutar = 0;
      _matrahTutari = 0;

      islemTutari = 0;
      kdvTutari = 0;
      toplamTutar = 0;
      matrahTutari = 0;
    });
  }
}
