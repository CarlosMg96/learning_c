class Restaurant {
  final String _name;
  final String _description;
  final List<String> _image; // Asegurado que es List<String>
  final double _raiting;
  final int _count;

  Restaurant(
      this._name, this._description, this._image, this._raiting, this._count);

  String get name => _name;
  String get description => _description;
  List<String> get image => _image;
  double get raiting => _raiting;
  int get count => _count;
}
