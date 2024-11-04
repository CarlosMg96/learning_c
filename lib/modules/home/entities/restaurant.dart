import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  final String _name;
  final String _description;
  final List<String> _image;
  final double _raiting;
  final int _count;
  final GeoPoint _location;

  Restaurant(this._name, this._description, this._image, this._raiting,
      this._count, this._location);

  String get name => _name;
  String get description => _description;
  List<String> get image => _image;
  double get raiting => _raiting;
  int get count => _count;
  GeoPoint get location => _location;
}
