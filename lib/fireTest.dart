import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
class FireTest extends StatelessWidget{

  var ref = FirebaseDatabase.instance.reference();
   void getdata(){
     ref.once().then((val) => print(val.value));
   }
  @override
  Widget build(BuildContext context) {
    return(RaisedButton(child: Text("click me"),onPressed: getdata,));
  }

}Security