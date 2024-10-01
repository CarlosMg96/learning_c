import 'package:flutter/material.dart';
import 'package:learning_c/widgets/content_column.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Actualiza el índice seleccionado
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/'); // Asumiendo que esta es la ruta de Home
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/top');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/reservaciones');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Añadido para permitir desplazamiento
          child: Row(
            children: [
              Expanded(child: ContentColumn(title: 'Primer Columna', description: 'Primer párrafo')),
              SizedBox(width: 16), // Espacio entre columnas
              Expanded(child: ContentColumn(title: 'Segunda Columna', description: 'Segundo párrafo')),
              SizedBox(width: 16), // Espacio entre columnas
              Expanded(child: ContentColumn(title: 'Tercer Columna', description: 'Tercer párrafo')),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/top');
        },
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Top',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Reservaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, // Índice seleccionado
        onTap: _onItemTapped, // Maneja el tap
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
