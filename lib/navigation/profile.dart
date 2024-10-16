import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Asegúrate de tener esta importación

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.brown,
                  radius: 32,
                  child: Text('AH'),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '20203tn133@utez.edu.mx',
                      style: TextStyle(
                        fontSize: 16, // Tamaño de texto más grande
                        fontWeight: FontWeight.bold, // Negrita
                      ),
                    ),
                    Text(
                      'Carlos Manuel González Rodríguez',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Negrita
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: const Text('Cerrar sesión'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        tooltip: 'Ir a Inicio',
        child: const Icon(Icons.home),
      ),
    );
  }
}
