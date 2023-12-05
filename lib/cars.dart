import 'package:flutter/material.dart';

// La clase Car representa un automóvil con sus atributos.
class Car {
  final String brand;
  final String model;
  final String imagePath;
  final String description; // Ruta de la imagen del automóvil

  Car({
    required this.brand,
    required this.model,
    required this.imagePath,
    required this.description,
  });
}

// La pantalla para mostrar los detalles de un automóvil seleccionado.
class CarDetailsView extends StatelessWidget {
  final Car car;

  CarDetailsView({required this.car});

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
            height: MediaQuery.of(context).size.height * 0.6, // Ajusta la proporción de la imagen
            child: Image.network(
              car.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.brand,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  car.model,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  car.description,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                // Otros detalles aquí si los necesitas
              ],
            ),
          ),
          // Agrega más contenido debajo de la información si es necesario
        ],
      ),
    );
  }
}


// La pantalla principal que muestra una lista de automóviles.
class CarsView extends StatelessWidget {
  final List<Car> cars = [
    Car(
      brand: 'Nissan',
      model: 'X-Trail',
      imagePath: 'lib/img/Xtrail.jpeg',
      description: 'El Nissan X-Trail es un SUV versátil y espacioso diseñado para adaptarse a diversos estilos de vida. Con su elegante diseño exterior, líneas aerodinámicas y tecnología avanzada, el X-Trail ofrece comodidad y seguridad en cada viaje. Su interior espacioso y configurable permite acomodar a la familia y el equipaje con facilidad, mientras que su tracción integral inteligente lo hace apto para aventuras fuera de carretera. Equipado con características de seguridad y asistencia al conductor, este modelo proporciona una experiencia de conducción confiable y agradable para aquellos que buscan un SUV moderno y adaptable',

    ),
    Car(
      brand: 'Nissan',
      model: 'Maxima',
      imagePath: 'lib/img/maxima.jpg',
      description: ' El Nissan Maxima es un sedán deportivo de alto rendimiento que combina elegancia y potencia. Con su diseño aerodinámico y líneas modernas, el Maxima ofrece un estilo llamativo y sofisticado. Su motor potente proporciona una experiencia de conducción emocionante y ágil. Además, su interior lujoso y bien equipado ofrece comodidades de primera clase y tecnología avanzada. Con una combinación de rendimiento, estilo y comodidad, el Maxima es ideal para aquellos que buscan un automóvil deportivo con un toque de lujo y sofisticación, sin comprometer la emoción al volante',
    ),
    Car(
      brand: 'Nissan',
      model: 'Altima',
      imagePath: 'lib/img/altima.jpeg',
      description: 'El Nissan Altima es un sedán elegante y con estilo que combina rendimiento y confort. Con líneas aerodinámicas y un diseño exterior distintivo, el Altima ofrece una experiencia de conducción suave y eficiente. Equipado con tecnología innovadora y comodidades modernas, este sedán ofrece un interior espacioso y confortable, ideal para viajes largos o el día a día en la ciudad. Su rendimiento equilibrado y su eficiencia en el consumo de combustible lo convierten en una opción atractiva para aquellos que buscan un vehículo confiable y con estilo para su uso diario',
    ),
    // Agrega más objetos Car según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Autos"),
        ),
        backgroundColor: Colors.orange[600],
      ),
      body: ListView.builder(
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
    );
  }
}
