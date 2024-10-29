import 'package:flutter/material.dart';
import 'package:learning_c/modules/home/entities/restaurant.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(restaurant.image.isNotEmpty
                ? restaurant.image[0]
                : 'https://via.placeholder.com/150x150.png'), // Imagen del restaurante
            const SizedBox(height: 16),
            Text(
              restaurant.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text('Rating: ${restaurant.raiting}',
                style: const TextStyle(fontSize: 16)),
            Text('Count: ${restaurant.count}',
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
