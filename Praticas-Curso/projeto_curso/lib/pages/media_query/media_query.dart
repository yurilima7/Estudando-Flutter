import 'package:flutter/material.dart';

class MediaQueryPage extends StatelessWidget {
  const MediaQueryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    debugPrint(mediaQuery.size.width.toString());
    debugPrint(mediaQuery.size.height.toString());
    debugPrint(mediaQuery.orientation.name);
    debugPrint(mediaQuery.padding.top.toString());
    debugPrint('$kToolbarHeight');//appbar tamanho default

    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaQuery'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * .5,
            ),
          ],
        ),
      ),
    );
  }
}
