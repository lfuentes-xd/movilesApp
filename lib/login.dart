import 'package:flutter/material.dart';
// import "Register.dart";

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Bienvenido a CarStore"),
        ),
        backgroundColor: Colors.orange[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orange,
              child: Text(
                'CarStore',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text('¿Olvidaste tu contraseña?'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('LOGIN'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[600],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Register');
              },
              child: Text('¿Eres nuevo? Regístrate'),
            ),
          ],
        ),
      ),
    );
  }
}
