import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyRedeemPage(),
    );
  }
}

class MyRedeemPage extends StatefulWidget {
  @override
  _MyRedeemPageState createState() => _MyRedeemPageState();
}
class CustomCard extends StatefulWidget {
final Color iconcolor;
@override 

  
  //final Color cardcolor;
 
  
  CustomCard({
    
    this.iconcolor,
  });

CustomCardState createState()=>CustomCardState();
}
//Custom card widget
class CustomCardState extends State<CustomCard> {
  int totalbytes=0;

void getdata()async{
  var ref = FirebaseDatabase.instance.reference().child("users/1");
    var data = await ref.once().then((ds) => ds.value['bytes']);
    setState(() {
     this.totalbytes = data; 
    });
}
  @override
  void initState() {
    getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: IconButton(
              icon:Icon(Icons.card_giftcard),
              color: widget.iconcolor,
              iconSize: 75,
              onPressed: (){
                
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
                          onPressed: () {
                            setState(() {
                              
                              
                              FirebaseDatabase.instance.reference().child("users/1/bytes").set(this.totalbytes-50);
                              
                            });
                          Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  }
                
    );
                
                
                },
            ),
    );
  }
}


class GridStuff extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      crossAxisCount: 2,
      children: <Widget>[
        CustomCard(
          iconcolor: Colors.amber,
        ),
        CustomCard(
         ),
        CustomCard(
          iconcolor: Colors.pink,
         ),
        CustomCard(
          iconcolor: Colors.teal,
        ),
        CustomCard(
          iconcolor: Colors.black87,
        ),
        CustomCard(
         iconcolor: Colors.indigo,
        ),
        CustomCard(
          iconcolor: Colors.deepPurple,
        ),
        CustomCard(
         
        ),
        CustomCard(
         iconcolor: Colors.yellow[100],
        ),
        CustomCard(
          
         
          iconcolor: Colors.black87,
        ),
        CustomCard(
          
        ),
        CustomCard(
          ),
        CustomCard(
          iconcolor: Colors.deepPurpleAccent,
        ),
        CustomCard(
          iconcolor: Colors.black87,
        ),
        CustomCard(
          ),
        CustomCard(
          iconcolor: Colors.teal,
        ),
      ],
    );
  }
}

class _MyRedeemPageState extends State<MyRedeemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridStuff(),
    );
  }
}
