import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget{

  TaskCardState createState() => TaskCardState();
}

class TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
   
   return Card(

     child:Column(
       children: <Widget>[
       
       Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[
         
         Text('Heart Shaker',style: TextStyle(fontSize: 25),),
          ClipOval(
            child: Container(
                height: 60.0, // height of the button
                width: 60.0, // width of the button
                child: Center(child: Text('1')),
                decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      spreadRadius: 10.0)
                ],
              ),
              ),
              
            
          )
       ],)
      ,Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Heart Shaker',style: TextStyle(fontSize: 12),),
          RaisedButton(child: Text("Submit"),onPressed: null,)
          ],)

     ],
   )
   );
  }
  
}