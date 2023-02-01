import 'dart:convert';

import 'package:apii/API.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget{
  int counter2;
  Details(this.counter2);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List posts=[];

  Future getPost() async{
    var url='https://jsonplaceholder.typicode.com/users';
    var response=await http.get(Uri.parse(url));
    var responseBody =jsonDecode(response.body);
    setState(
            (){
          posts.addAll(responseBody);
        }
    );

  }

  @override
  void initState() {
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body:
        posts==null||posts.isEmpty
            ?const Center(child: CircularProgressIndicator(),):

        Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 15,
                shape:RoundedRectangleBorder(
                  side:const BorderSide(
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 110,
                  width: 500,
                  child: Column(
                    children: [

                      Text("id = ${posts[widget.counter2]["id"]}"),
                      Text("name = ${posts[widget.counter2]["name"]}"),
                      Text("email = ${posts[widget.counter2]["email"]}"),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}