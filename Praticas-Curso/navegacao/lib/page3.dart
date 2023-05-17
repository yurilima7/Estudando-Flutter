import 'package:flutter/material.dart';
import 'package:navegacao/page4.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     settings: const RouteSettings(name: 'page4'),
                //     builder: (context) => const Page4(),
                //   ),
                // );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    settings: const RouteSettings(name: 'page4'),
                    builder: (context) => const Page4(),
                  ),
                );
              },
              child: const Text('page 4 VIA PAGE'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/page4');
              },
              child: const Text('page 4 VIA NAMED'),
            ),
          ],
        ),
      ),
    );
  }
}
