import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget{
 
  String task,deadline,id;
  int bytes;
  

  TaskCard(this.id,this.task,this.deadline,this.bytes);
  TaskCardState createState() => TaskCardState();
}

class TaskCardState extends State<TaskCard> {

    bool isTaskCompleted = false;

  void checkTaskCompleted(){  

    setState(() {
      this.isTaskCompleted=true;
    });
  }
  @override
  Widget build(BuildContext context) {
   
   return Card(

     child:Padding(
       padding: EdgeInsets.all(10),
            child: Column(
         children: <Widget>[

         Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           
           Wrap(children:<Widget>[ Text(widget.task,style: TextStyle(fontSize: 25),) ]),
           
             ClipOval(
                child: Container(
                    height: 60.0, // height of the button
                    width: 60.0, // width of the button
                    child: Center(child: Text('0')),
                    decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          spreadRadius: 1.0)
                    ],
                  
                  ),
                  
                
              ),
            )
         ],)
        ,Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Dead line:',style: TextStyle(fontSize: 12),),
            IconButton(icon: Icon(Icons.check_circle_outline,size:30,color:(this.isTaskCompleted)? Colors.green:Colors.grey,), onPressed: checkTaskCompleted)
            //RaisedButton(child: Text("Submit"),onPressed: null,)
            ],)

       ],
   ),
     )
   );
  }
  
}