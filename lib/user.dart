import 'package:flutter/material.dart';

class user extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Perfil"),
        ),
        backgroundColor: Colors.orange[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                SizedBox(width: 10),
                Text('Cambiar foto de perfil'),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Correo electrónico de sebas',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Fulano de tal de sebas',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Cambiar contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nueva contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Guardar cambios'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.orange),
                    Text('Puntuanos'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.info, color: Colors.orange),
                    Text('Información Adicional'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.logout, color: Colors.orange),
                    Text('Cerrar sesión'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
