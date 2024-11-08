import 'package:flutter/material.dart';
import 'package:learning_c/modules/home/entities/restaurant.dart';
import 'package:flutter_rating/flutter_rating.dart'; 

class ListRestaurantData extends StatelessWidget {
  const ListRestaurantData({
    super.key,
    required this.restaurant,
    required this.onTap, // Añadimos onTap como parámetro
  });

  final Restaurant restaurant;
  final VoidCallback onTap; // Callback para manejar el clic

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Asigna el callback aquí
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            restaurant.image.isNotEmpty
                ? restaurant.image[0] // Accede a la primera imagen
                : 'https://via.placeholder.com/50x50.png', // Imagen de respaldo
            width: 50,
            height: 50,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: const TextStyle(
                    fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 140,
                child: Text(
                  restaurant.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12.0, color: Colors.black54),
                ),
              ),
            ],
          ),
          const Spacer(),
          StarRating(
            size: 16.0,
            rating: restaurant.count > 0
                ? restaurant.raiting / restaurant.count
                : 0,
            color: Colors.orange,
            borderColor: Colors.grey,
            starCount: 5,
          ),
        ],
      ),
    );
  }
}
