import 'package:flutter/material.dart';
import 'task_card.dart';
import 'package:firebase_database/firebase_database.dart';
class Dashboard extends StatefulWidget {
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
   List<String> keys = <String>["1"];
   List<String> tasks = <String>['Loading'];
   List<int> bytes = <int>[200];

  void getData()async {
    var ref = FirebaseDatabase.instance.reference().child("users/1");
    var data = await ref.once().then((ds) => ds.value['tasks']);
    var _tasks= <String>[],_bytes=<int>[],_keys=<String>[];
    int i=0;
    for(var obj in data){
      _keys.add(i.toString());
      _tasks.add(obj["task"]);
      _bytes.add(obj["bytes"]);
      i++;
    }
    print(_bytes);
    setState(() {
      this.keys = _keys;
      this.tasks =_tasks;
      this.bytes = _bytes;
    });
    
    print(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskCard(keys[index],tasks[index],"",bytes[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    )
        //NavBar();
        );
  }
}
/*
class NavBar extends State<Dashboard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
*/