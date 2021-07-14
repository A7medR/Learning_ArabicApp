import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:audioplayers/audioplayers.dart';

class level3 extends StatefulWidget {
  // level3({Key key}) : super(key: key);

  @override
  _level3State createState() => _level3State();
}

class _level3State extends State<level3> {
  Map<String, bool> score = {};
  Map<String, Color> choices = {
    '🍎': Colors.red,
    '🍐': Colors.green,
    '🌻': Colors.yellow,
    '🍊': Colors.orange,
    '🍇': Colors.purple,
    '🦁': Colors.brown,
  };
  Map<Color, String> newmap = {
    Colors.red: 'تفاحه',
    Colors.green: 'كمثرى',
    Colors.yellow: 'عبادالشمس',
    Colors.orange: 'برتقاله',
    Colors.purple: 'عنب',
    Colors.brown: 'أسد',
  };
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'تعلم اللغه العربيه',
            style: TextStyle(
                color: Colors.white, fontFamily: 'cairo', fontSize: 15),
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: choices.keys.map((element) {
                return Expanded(
                  child: Draggable<String>(
                    data: element,
                    child: Movable(score[element] == true ? '✔️' : element),
                    feedback: Movable(element),
                    childWhenDragging: Movable('🙉'),
                  ),
                );
              }).toList(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: choices.keys.map((element) {
                return buildTarget(element);
              }).toList()
                ..shuffle(Random(index)),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              score.clear();
              index++;
            });
          },
        ));
  }

  Widget buildTarget(element) {
    return DragTarget<String>(
      builder: (context, incoming, rejected) {
        if (score[element] == true) {
          return Container(
            color: Colors.white,
            child: Text('أحسنت'),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
          return Container(
            child: Text(newmap[choices[element]]),
            alignment: Alignment.center,
            color: choices[element],
            height: 80,
            width: 200,
          );
        }
      },
      onWillAccept: (data) => data == element,
      onAccept: (data) {
        setState(() {
          score[element] = true;
        });
      },
      onLeave: (data) => {},
    );
  }
  @override
  void dispose() {

    super.dispose();


    // TODO: implement dispose
  }
}

class NewMap {}

class Movable extends StatelessWidget {
  final String emoji;
  Movable(this.emoji);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.all(15),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 60),
        ),
      ),
    );
  }
}
