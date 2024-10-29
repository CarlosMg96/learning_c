import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_c/kerner/widgets/text_form_field_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isObsucre = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/cat.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Correo electronico',
                    label: Text('Correo electronico'),
                    labelStyle: TextStyle(color: Colors.black)),
                keyboardType: TextInputType.emailAddress,
                controller: _email,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldPassword(
                controller: _password,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: _email.text,
                          password: _password.text,
                        );
                        Navigator.pushNamed(context, '/menu');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text('Inicar Sesion')),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(
                  'Crear cuenta',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/recovery');
                  },
                  child: const Text('Recuperar Contraseña'))
            ],
          ),
        ),
      ),
    );
  }
}
