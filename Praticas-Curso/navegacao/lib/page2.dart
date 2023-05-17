import 'package:flutter/material.dart';
import 'package:navegacao/page3.dart';

class Page2 extends StatefulWidget {
  static const String routeName = '/page3';
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int id = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final param =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      setState(() {
        id = param?['id'] ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('O id eh: $id'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    settings: const RouteSettings(name: 'page3'),
                    builder: (context) => const Page3(),
                  ),
                );
              },
              child: const Text('page 3 VIA PAGE'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Page2.routeName);
              },
              child: const Text('page 3 VIA NAMED'),
            ),
          ],
        ),
      ),
    );
  }
}
