import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();  
    super.dispose();
  }

  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailEC.text,
      password: passwordEC.text,
    );

    final user = credential.user;
    var message = '';
    if (user != null && !user.emailVerified) {
      message = 'Email não confirmado, por favor verifique seu email';
      credential.user?.sendEmailVerification();
    } else {
      message = 'Email válidado com sucesso';
    }
      
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),));

    debugPrint(credential.user?.email);
    debugPrint(credential.user?.emailVerified.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login de usuário'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            children: [
              TextField(
                controller: emailEC,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
          
              TextField(
                controller: passwordEC,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
              ),

              const SizedBox(
                 height: 20,
              ),
          
              ElevatedButton(
                onPressed: () => loginUser(),
                child: const Text('Login de usuário'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
