import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/auth/email_password/login_page.dart';
import 'package:firebase_project/auth/email_password/register_page.dart';
import 'package:firebase_project/auth/show_user.dart';
import 'package:firebase_project/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/auth/email_password/register': (_) => const RegisterPage(),
        '/auth/email_password/login': (_) => const LoginPage(),
        '/auth/show_user': (_) => const ShowUser(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      debugPrint('Usuário logado? ${user != null}');
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/auth/email_password/register'),
              child: const Text('Resgistro com email e senha'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/auth/email_password/login'),
              child: const Text('Login com email e senha'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/auth/show_user'),
              child: const Text('Apresentar usuário logado'),
            ),
          ],
        ),
      ),
    );
  }
}
