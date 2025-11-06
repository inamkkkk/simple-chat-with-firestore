import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_chat/screens/chat_screen.dart';
import 'package:simple_chat/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await context.read<AuthService>().signInWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to sign in: ${e.toString()}')),
                  );
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await context.read<AuthService>().signUpWithEmailAndPassword(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim());

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to sign up: ${e.toString()}')),
                  );
                }
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
