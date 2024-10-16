import 'package:flutter/material.dart';

class TextFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;

  const TextFieldPassword({
    super.key,
    required this.controller,
    this.hintText = 'Contraseña',
    this.labelText = 'Contraseña',
  });

  @override
  _TextFieldPasswordState createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}
