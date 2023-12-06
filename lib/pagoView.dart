// pago_view.dart
import 'package:flutter/material.dart';

class PagoView extends StatefulWidget {
  @override
  _PagoViewState createState() => _PagoViewState();
}

class _PagoViewState extends State<PagoView> {
  TextEditingController _numeroTarjetaController = TextEditingController();
  TextEditingController _nombreTitularController = TextEditingController();
  TextEditingController _fechaExpiracionController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  void _realizarPago() {
    // Aquí puedes realizar la validación de los datos de la tarjeta
    // y procesar la transacción si los datos son válidos.
    // Por ahora, simplemente mostraremos un mensaje en la consola.
    print('Número de Tarjeta: ${_numeroTarjetaController.text}');
    print('Nombre del Titular: ${_nombreTitularController.text}');
    print('Fecha de Expiración: ${_fechaExpiracionController.text}');
    print('CVV: ${_cvvController.text}');

    // Mostrar un mensaje de pedido exitoso
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '¡Pedido exitoso!',
          style: TextStyle(fontSize: 20),
        ),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );

    // Redirigir a la página principal
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Pago'),
        backgroundColor: Colors.orange[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingresa los datos de tu tarjeta:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _numeroTarjetaController,
              decoration: InputDecoration(
                labelText: 'Número de Tarjeta',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _nombreTitularController,
              decoration: InputDecoration(
                labelText: 'Nombre del Titular',
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _fechaExpiracionController,
                    decoration: InputDecoration(
                      labelText: 'Fecha de Expiración',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _cvvController,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _realizarPago,
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              child: Text('Realizar Pago'),
            ),
          ],
        ),
      ),
    );
  }
}
