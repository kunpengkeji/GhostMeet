import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '没有内容',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
