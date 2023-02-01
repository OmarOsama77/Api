import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detail.dart';
class Api extends StatefulWidget{
  int counter =0;

  @override
  State<Api> createState() => ApiState();
}

class ApiState extends State<Api> {
  List posts=[];

  Future getPost() async{
    var url='https://jsonplaceholder.typicode.com/posts';
    var response=await http.get(Uri.parse(url));
    var responseBody =jsonDecode(response.body);
    setState(
        (){
          posts.addAll(responseBody);
          print("postssssss ${posts.length}");
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
 appBar: AppBar(title:const Text("API"),),
   body:
   posts==null||posts.isEmpty
      ?const Center(child: CircularProgressIndicator(),)
      :ListView.builder(
       itemCount: posts.length,
       itemBuilder: (context,index){
          return
            Card(elevation: 15,
              shape:RoundedRectangleBorder(
          side:const BorderSide(
          ),
         borderRadius: BorderRadius.circular(10.0),
         ),
            child: Container(
              height: 70,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: (){

                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (builder)=>Details(index)));

                      }, child:Text(posts[index]["title"]))

                ],
              ),
            ),
          );
       }),
  );
  }
}
