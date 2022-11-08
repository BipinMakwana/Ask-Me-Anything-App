// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audiofileplayer/audiofileplayer.dart';

void main() => runApp(MyDiceApp());

class MyDiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyDiceApp',
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text('Ask Me Anything'),
        ),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  var ballCounter = 1;

  void playSound() {
    Audio audio = Audio.load('assets/askmeanything.wav');
    audio.play();
    audio.dispose();
  }

  void ballRandom() {
    setState(() {
      ballCounter = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: double.infinity,
      child: MaterialButton(
          padding: EdgeInsets.zero,
          splashColor: Colors.blue.shade900,
          onPressed: () {
            ballRandom();
            playSound();
          },
          child: Center(child: Image.asset('images/ball$ballCounter.png'))),
    );
  }
}
