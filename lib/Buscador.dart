import 'package:flutter/material.dart';

class Car {
  final String brand;
  final String model;
  final String imagePath; // Cambiando el nombre a imagePath

  Car({
    required this.brand,
    required this.model,
    required this.imagePath, // Cambiando el nombre a imagePath
  });
}



class Buscador extends StatefulWidget {
  @override
  _BuscadorState createState() => _BuscadorState();
}

class _BuscadorState extends State<Buscador> {
  List<Car> cars = [
    Car(
      brand: 'Nissan',
      model: 'X-Trail',
      imagePath: 'lib/img/Xtrail.jpeg',
    ),
    Car(
      brand: 'Nissan',
      model: 'Maxima',
      imagePath: 'lib/img/maxima.jpg',
    ),
    Car(
      brand: 'Nissan',
      model: 'Altima',
      imagePath: 'lib/img/altima.jpeg',
    ),
    // Agrega más objetos Car según sea necesario
  ];

  String filter = '';

  @override
  Widget build(BuildContext context) {
    List<Car> filteredCars = cars.where((car) {
      final brandLower = car.brand.toLowerCase();
      final modelLower = car.model.toLowerCase();
      final filterLower = filter.toLowerCase();
      return brandLower.contains(filterLower) || modelLower.contains(filterLower);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("CarStore"),
        backgroundColor: Colors.orange[600],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  filter = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Buscar',
                hintText: 'Escribe aquí para buscar',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCars.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      filteredCars[index].imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(filteredCars[index].brand),
                    subtitle: Text(filteredCars[index].model),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
