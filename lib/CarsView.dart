import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';  
import 'dart:io';
import 'dart:convert';

// La clase Car representa un automóvil con sus atributos.
class Car {
  final String brand;
  final String model;
  final String imagePath;
  final String description;

  Car({
    required this.brand,
    required this.model,
    required this.imagePath,
    required this.description,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      brand: json['brand'],
      model: json['model'],
      imagePath: json['imagePath'],
      description: json['description'],
    );
  }
}

// La pantalla para mostrar los detalles de un automóvil seleccionado.
class CarDetailsView extends StatefulWidget {
  final Car car;

  CarDetailsView({required this.car});

  @override
  _CarDetailsViewState createState() => _CarDetailsViewState();
}

class _CarDetailsViewState extends State<CarDetailsView> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del automóvil"),
        backgroundColor: Colors.orange[600],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Image.network(
              widget.car.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.car.brand,
                  style: TextStyle(
                    fontSize: 28, // Ajusta el tamaño del texto
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.car.model,
                  style: TextStyle(
                    fontSize: 20, // Ajusta el tamaño del texto
                  ),
                ),
                Text(
                  widget.car.description,
                  style: TextStyle(
                    fontSize: 20, // Ajusta el tamaño del texto
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12), // Ajusta la distancia entre el texto y los botones
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes agregar la lógica para realizar la compra
                  // Puedes mostrar un cuadro de diálogo, redirigir a una pantalla de pago, etc.
                  // Por ahora, simplemente mostraremos un mensaje en la consola.
                  print('Compra realizada para ${widget.car.brand} ${widget.car.model}');
                  // Redirige a la vista de pago
                  Navigator.pushNamed(context, '/pago');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  minimumSize: Size(150, 60), // Ajusta el tamaño del botón
                ),
                child: Text(
                  'Comprar',
                  style: TextStyle(
                    fontSize: 24, // Ajusta el tamaño del texto en el botón
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 40, // Ajusta el tamaño del icono
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class CarsView extends StatefulWidget {

  @override
  _CarsViewState createState() => _CarsViewState();
}

// La pantalla principal que muestra una lista de automóviles.
class _CarsViewState extends State<CarsView> {
  final List<Car> cars = [
    Car(
      brand: 'Nissan',
      model: 'X-Trail',
      imagePath: 'lib/img/Xtrail.jpeg',
      description: 'El Nissan X-Trail es un SUV versátil y espacioso...',
    ),
    Car(
      brand: 'Nissan',
      model: 'Maxima',
      imagePath: 'lib/img/maxima.jpg',
      description: 'El Nissan Maxima es un sedán deportivo de alto rendimiento...',
    ),
    Car(
      brand: 'Nissan',
      model: 'Altima',
      imagePath: 'lib/img/altima.jpeg',
      description: 'El Nissan Altima es un sedán elegante y con estilo...',
    ),
    // Agrega más objetos Car según sea necesario
  ];

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result != null) {
      final file = File(result.files.single.path!);
      String fileContent = await file.readAsString();

      List<dynamic> jsonCars = jsonDecode(fileContent);
      List<Car> newCars = jsonCars.map((jsonCar) => Car.fromJson(jsonCar)).toList();

      setState(() {
        cars.addAll(newCars);
      });
    }
  }
  





 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Autos"),
        ),
        backgroundColor: Colors.orange[600],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarDetailsView(car: cars[index]),
                        ),
                      );
                    },
                    leading: Image.network(
                      cars[index].imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(cars[index].brand),
                    subtitle: Text(cars[index].model),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _pickFile,
            child: Text("Cargar autos desde JSON"),
          ),
        ],
      ),
    );
  }
}
