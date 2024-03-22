import 'package:flutter/material.dart';

class ToDoTile extends StatefulWidget {
  const ToDoTile({super.key});

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Container(
        padding: EdgeInsets.all(25),
        child: Text('Make Tutorial'),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
