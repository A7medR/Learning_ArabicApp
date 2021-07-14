import 'package:flutter/material.dart';
import 'package:mm/1.dart';
import 'package:mm/2.dart';
import 'package:mm/3.dart';
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                  child: Text('Level 1',style: TextStyle(color: Colors.white,),),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>level1()),
                    );
                  }),
              FlatButton(
                  child: Text('Level 2',style: TextStyle(color: Colors.white,)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>level2()),
                    );
                  }),
              FlatButton(
                  child: Text('Level 3',style: TextStyle(color: Colors.white,)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>level3()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
