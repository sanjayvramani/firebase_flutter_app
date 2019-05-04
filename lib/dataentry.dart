import 'package:flutter/material.dart';

class DataEntry extends StatefulWidget {
  @override
  _DataEntryState createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Entry"),),
      body:
          Container(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        title: Text("Enter Name"),
                        trailing: Icon(Icons.map),
                        onTap: (){ print("Clicked"); },
                      ),
                    )

                  ],
                ),
              ),
    );
  }
}
