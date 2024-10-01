import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  final List<String> comidas = [
    'Tacos al Pastor',
    'Enchiladas',
    'Tamales',
    'Mole Poblano',
    'Chiles en Nogada',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comidas Mexicanas'),
      ),
      body: ListView.builder(
        itemCount: comidas.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                comidas[index],
                style: TextStyle(fontSize: 18),
              ),
              leading: Icon(Icons.food_bank),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción al presionar el botón
          Navigator.pushNamed(context, '/reservaciones');
        },
        tooltip: 'Añadir a favoritos',
        child: const Icon(Icons.bookmark),
      ),
    );
  }
}
