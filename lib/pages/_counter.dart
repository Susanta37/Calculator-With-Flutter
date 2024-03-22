import 'package:flutter/material.dart';

class counterPage extends StatefulWidget {
  const counterPage({super.key});

  @override
  State<counterPage> createState() => __counterState();
}

class __counterState extends State<counterPage> {
//variables

  int counter = 0;

//method

  void _incrementCounter() => setState(() => counter++);
  void _decrementCounter() => setState(() {
        counter--;
      });

//ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //message
        children: [
          Text("You pushed The Button this many Times"),
          //counter value
          Text(
            counter.toString(),
            style: TextStyle(fontSize: 40),
          ),
          ElevatedButton(
              onPressed: _incrementCounter, child: Text('Increment counter')),
          ElevatedButton(
              onPressed: _decrementCounter, child: Text('Decrementing'))
        ],
      ),
    ));
  }
}
