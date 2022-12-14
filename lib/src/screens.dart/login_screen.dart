import 'package:flutter/material.dart';
import '../mixins/valiodation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            const SizedBox(
              height: 40,
            ),
            passwordField(),
            const SizedBox(
              height: 40,
            ),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      validator: validateEmail,
      onSaved: (value) {
        email = value!;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(54)),
          labelText: 'Email Address',
          hintText: 'you@example.com'),
    );
  }

  Widget passwordField() {
    return TextFormField(
      validator: validatePassword,
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 50, color: Colors.black)),
          labelText: 'Enter Password',
          hintText: 'password'),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      splashColor: Colors.white,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          print('This $email and $password');
        }
      },
      child: const Text('Log in'),
    );
  }
}
