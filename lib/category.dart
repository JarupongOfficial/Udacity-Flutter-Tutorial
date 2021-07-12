import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.blueAccent,
        height: 100.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          highlightColor: Colors.green,
          splashColor: Colors.green,
          onTap: () {
            print("The button is tapped!!!");
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.cake,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(
                    'Orange',
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
