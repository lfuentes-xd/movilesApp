import 'package:flutter/material.dart';

class CarsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Autos"),
        ),
        backgroundColor: Colors.orange[600],
      ),
      body: Center(child: Text('Contenido segunda vista')),
    );
  }
}
