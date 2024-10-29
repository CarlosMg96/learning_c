import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_c/widgets/home/list_restaurant_data.dart';
import 'package:learning_c/modules/home/entities/restaurant.dart';
import 'package:learning_c/widgets/home/restaurant_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Restaurant> restaurants = [];
  final db = FirebaseFirestore.instance;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Escucha la colección de Firestore y llena la lista de restaurantes
    db.collection("restaurants").snapshots().listen((event) {
      List<Restaurant> newRestaurants = [];

      for (var doc in event.docs) {
        final restaurant = Restaurant(
          doc.data()['name'] ?? 'Unknown',
          doc.data()['description'] ?? 'No description',
          List<String>.from(doc.data()['image'] ?? []),
          (doc.data()['raiting'] ?? 0).toDouble(),
          (doc.data()['count'] is String
                  ? int.tryParse(doc.data()['count'])
                  : doc.data()['count']) ??
              0,
        );
        newRestaurants.add(restaurant);
      }

      if (mounted) {
        setState(() {
          restaurants = newRestaurants;
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, '/top'),
        },
        child: const Icon(Icons.chevron_right),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          return ListRestaurantData(
            restaurant: restaurants[index],
            onTap: () {
              // Aquí puedes navegar a otra pantalla y pasar los datos del restaurante
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RestaurantDetailScreen(restaurant: restaurants[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
