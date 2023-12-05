import 'package:flutter/material.dart';

class ThirdView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("favoritos"),
        ),
        backgroundColor: Colors.orange[600],
      ),
      body: SingleChildScrollView(
        // Agrega esto
        child: Column(
          children: <Widget>[
            Image.asset(
                '../../lib/img/Xtrail.jpeg'), // Reemplaza con la URL de tu imagen
            Text(
              'Nissan X-trail 2023',
              style: TextStyle(
                fontSize: 24, // Esto hace que el texto sea más grande
              ),
              textAlign: TextAlign.left,
            ),
            Image.asset(
                '../../lib/img/altima.jpeg'), // Reemplaza con la URL de tu imagen
            Text(
              'Nissan X-trail 2023',
              style: TextStyle(
                fontSize: 24, // Esto hace que el texto sea más grande
              ),
              textAlign: TextAlign.left,
            ),
            Image.asset(
                '../../lib/img/maxima.jpg'), // Reemplaza con la URL de tu imagen
            Text(
              'Nissan X-trail 2023',
              style: TextStyle(
                fontSize: 24, // Esto hace que el texto sea más grande
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
