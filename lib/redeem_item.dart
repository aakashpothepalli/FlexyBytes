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

class _MyRedeemPageState extends State<MyRedeemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
        
        child:GridView.count(crossAxisCount: 1,
          children:[
            
            Card(child:ListTile(title:Text("hello"),trailing:Image(image: AssetImage("assets/Companyhoodie.jpeg"))))


          ],
          
          
          
          ),
          
          
          
          
          
          /*
          SizedBox(
          height: 30,
          child: RaisedButton(
            onPressed: () {},
            child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
          ),
        ),*/
        
      ),
    );
  }
}
