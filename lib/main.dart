//todo 2
import 'dart:async';
import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{

  List data;

  //to get data
  Future<String> getData() async{
    var response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept" : "aplication/json"
      }
    );
    //sent value to data
    setState(() {
      data = json.decode(response.body);
    });
    return "Success!";
  }

  //todo yang pertama di jalankan.
  @override
  void initState() {
    // TODO: implement initState
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView Zein"),
        backgroundColor: Colors.deepOrange,
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          //kirimkan data dalam bentuk
          return new Card(
            child: new Text(data[index]["title"]),
          );
        },
      ),
    );
  }
}