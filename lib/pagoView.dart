// pago_view.dart
import 'package:flutter/material.dart';

class PagoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Pago'),
        backgroundColor: Colors.orange[600],
      ),
      body: Center(
        child: Text('¡Gracias por tu compra!'),
      ),
    );
  }
}
