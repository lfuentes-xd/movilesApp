import 'package:flutter/material.dart';
import 'second_view.dart';
import 'third_view.dart';
import 'login.dart';
import 'Register.dart';
import 'Buscador.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarStore Mexico',
      initialRoute: '/', // Página inicial
      routes: {
        '/': (context) => const HomeView(),
        '/third': (context) => ThirdView(),
        '/busqueda': (context) => Buscador(),
        '/login': (context) => LoginView(),
        '/Register': (context) => RegisterView(),
      },
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.orange[600],
      ),
      body: Column(
        children: <Widget>[
          Text(
            "Más vendido",
            style: TextStyle(fontSize: 24),
          ),
          Image.asset(
              '../../lib/img/Xtrail.jpeg'), // Reemplaza con la URL de tu imagen
          Text(
            'Nissan X-trail 2023',
            style: TextStyle(
              fontSize: 24, // Esto hace que el texto sea más grande
            ),
            textAlign: TextAlign.left,
          ),
          Row(
            children: <Widget>[
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star_half, color: Colors.yellow),
            ],
          ),

          Text(
              'El crédito aprobado por NR Finance Mexico, S.A. de C.V. y Sistema de Crédito Automotriz, S.A. de C.V. (Sicrea)'),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text('CarStore Menú'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
              trailing: PopupMenuButton(
                onSelected: (value) {
                  if (value == 'option1') {
                    Navigator.pushNamed(context, '/third');
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'option1',
                    child: Text('Item 1.1'),
                  ),
                  PopupMenuItem(
                    value: 'option2',
                    child: Text('Item 1.2'),
                  ),
                  PopupMenuItem(
                    value: 'option3',
                    child: Text('Item 1.3'),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Busqueda'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.pushNamed(
                    context, '/busqueda'); // Navega a la Segunda Vista
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.pushNamed(
                    context, '/third'); // Navega a la Tercera Vista
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Login/Register'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.pushNamed(
                    context, '/login'); // Navega a la Tercera Vista
              },
            ),
          ],
        ),
      ),
    );
  }
}
