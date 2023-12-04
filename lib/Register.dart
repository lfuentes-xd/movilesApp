import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Registro'),
        ),
        backgroundColor: Colors.orange[600],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Apellidos',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Curp/DNI',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Correo electronico',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Repetir contraseña',
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Registrar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[600],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('¿Ya tienes cuenta? Da clic aquí.'),
            ),
          ],
        ),
      ),
    );
  }
}
