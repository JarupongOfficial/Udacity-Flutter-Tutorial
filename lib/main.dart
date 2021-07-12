import 'package:flutter/material.dart';

void main() {
  print("Hello");
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Hello Rectangle"),
          ),
          body: HelloRectangle()),
    ),
  );
}

class HelloRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.greenAccent,
        height: 400,
        width: 300,
        child: Center(
          child: Text(
            "Hello",
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      ),
    );
  }
}
