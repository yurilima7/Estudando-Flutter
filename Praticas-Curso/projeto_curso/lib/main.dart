import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_curso/pages/container/container_page.dart';
import 'package:projeto_curso/pages/home/home_page.dart';
import 'package:projeto_curso/pages/media_query/media_query.dart';
import 'package:projeto_curso/pages/scrolls/listview_page.dart';
import 'package:projeto_curso/pages/scrolls/singlechildscrollview_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (_) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      routes: {
        '/':(_) => const HomePage(),
        '/container':(_) => const ContainerPage(),
        '/media_query':(_) => const MediaQueryPage(),
        '/singleChild':(_) => const SinglechildscrollviewPage(),
        '/listview':(_) => const ListviewPage(),
      },
    );
  }
}
