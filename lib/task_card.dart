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
    showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Confirm",style: TextStyle(color: Colors.black87)),
                      content: new Text("Do you want to mark as completed and call for review?",style: TextStyle(color: Colors.black54)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                           child: new Text("No, edit post",style: TextStyle(color: Colors.redAccent),),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        new FlatButton(
                          child: new Text("Yes"),
                          onPressed: () {                          setState(() {
      this.isTaskCompleted=true;
    });
                          Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );

   
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
           
           Wrap(children:<Widget>[ Text(widget.task,style: TextStyle(fontSize: 25),softWrap: true,) ]),
           
             ClipOval(
                child: Container(
                    height: 60.0, // height of the button
                    width: 60.0, // width of the button
                    child: Center(child: Text(widget.bytes.toString())),
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
            Container(child:(this.isTaskCompleted)? 
            Text("Submitted for review"):
            IconButton(icon: Icon(Icons.check_box_outline_blank,size:30), onPressed: checkTaskCompleted))
            //RaisedButton(child: Text("Submit"),onPressed: null,)
            ],)

       ],
   ),
     )
   );
  }
  
}