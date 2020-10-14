import 'package:flutter/material.dart';

class KDVList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class KDVListPage extends StatefulWidget {
  @override
  _KDVListPageState createState() => _KDVListPageState();
}

class _KDVListPageState extends State<KDVListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
          title: Text('Vergi Listesi'), backgroundColor: Colors.deepPurple[700]),
      body: Container(
         height: MediaQuery.of(context).size.height * 1 ,
        child: new Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.03),
            DataTable(columns: <DataColumn>[
              DataColumn(
                  label: Text("Ürün",
                      style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ))),
              DataColumn(
                  label: Text("Parekende \nKDV Oranı",
                      style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ))),
              DataColumn(
                  label: Text("Toptan \nKDV Oranı",
                      style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ))),
            ], rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(
                      "Kuruyemiş",
                      style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%8",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%1",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(
                      "Bakliyat",
                      style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%8",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%8",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(
                      "Sebze ve \nMeyve",
                      style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%8",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%1",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(
                      "Su Ürünleri",
                      style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%8",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%1",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(
                      "Giyecek",
                      style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%8",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%8",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(
                      "Kitap ve \nE-Kitap",
                      style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%8",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%8",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
              
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(
                      "Elektronik \nEşya",
                      style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%18",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "%18",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
             SizedBox(height: 20),
            Text(
              "* Listedeki KDV oranları değişiklik gösterebilir. *",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11 ,
              ),
              
            ),
            
          ],
        ),
      ),
    );
  }
}
