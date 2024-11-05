import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:learning_c/modules/home/entities/restaurant.dart';
import 'package:flutter_rating/flutter_rating.dart';

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
            CarouselSlider(
              options: CarouselOptions(
                height: 200, // Altura del carrusel
                autoPlay: true, // Reproducción automática
              ),
              items: restaurant.image.isNotEmpty
                  ? restaurant.image.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList()
                  : [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            'https://via.placeholder.com/150x150.png',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                    ],
            ),
            const SizedBox(height: 16),
            Text(
              restaurant.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            StarRating(
              size: 16.0,
              rating: restaurant.count > 0
                  ? restaurant.raiting / restaurant.count
                  : 0,
              color: Colors.orange,
              borderColor: Colors.grey,
              starCount: 5,
            ),
            const SizedBox(height: 16),
            Container(
              height: 250,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(restaurant.location.latitude,
                      restaurant.location.longitude),
                  zoom: 15, // Zoom inicial
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('restaurant_location'),
                    position: LatLng(restaurant.location.latitude,
                        restaurant.location.longitude),
                    infoWindow: InfoWindow(title: restaurant.name),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
