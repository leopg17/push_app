import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push App'),
      ),
      body: Center(
        child: Container(
          child: Text('Mensaje Page'),
        ),
      ),
    );
  }
}
