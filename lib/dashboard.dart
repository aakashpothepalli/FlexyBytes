import 'package:flutter/material.dart';
import 'task_card.dart';
import 'package:firebase_database/firebase_database.dart';
class Dashboard extends StatefulWidget {
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
   List<String> keys = <String>["1"];
   List<String> tasks = <String>['Loading'];
   List<bool> isTaskComplete = <bool>[false];
   List<int> bytes = <int>[200];

  void getData()async {
    var ref = FirebaseDatabase.instance.reference().child("users/1");
    var data = await ref.once().then((ds) => ds.value['tasks']);
    var _tasks= <String>[],_bytes=<int>[],_keys=<String>[],itc=<bool>[];
    int i=0;
    for(var obj in data){
      _keys.add(i.toString());
      itc.add(obj['submitted']);
      _tasks.add(obj["task"]);
      _bytes.add(obj["bytes"]);
      i++;
    }
    print(_bytes);
    setState(() {
      this.keys = _keys;
      this.tasks =_tasks;
      this.bytes = _bytes;
      this.isTaskComplete = itc;
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
          return TaskCard(keys[index],tasks[index],"",bytes[index],isTaskComplete[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    )
        //NavBar();
        );
  }
}