import 'package:flutter/material.dart';
import 'package:navegacao/page1.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pushAndRemoveUntil(
                //   MaterialPageRoute(
                //     settings: const RouteSettings(name: 'page1 home'),
                //     builder: (context) => const Page1(),
                //   ),
                //   ModalRoute.withName('page2')
                // );
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    settings: const RouteSettings(name: 'page1 home'),
                    builder: (context) => const Page1(),
                  ),
                  (route) => false
                );
              },
              child: const Text('page1 home VIA PAGE'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('page1 home VIA NAMED'),
            ),
          ],
        ),
      ),
    );
  }
}
