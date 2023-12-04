
import 'package:flutter/material.dart';

class SecondView extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segunda Vista')),
      body: Center(child: Text('Contenido segunda vista')),
    );
  }
}