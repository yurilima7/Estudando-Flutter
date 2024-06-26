import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tests/screens/draggable_screen.dart';
import 'package:tests/screens/gallery_access.dart';
import 'package:tests/screens/home.dart';
import 'package:tests/screens/list_sales.dart';
import 'package:tests/screens/maps_screen.dart';
import 'package:tests/screens/post_it.dart';
import 'package:tests/screens/signature_screen.dart';
import 'package:tests/screens/theme_screen.dart';
import 'package:tests/screens/sliver_app_bar_transp.dart';
import 'package:tests/screens/sliver_screen_app_bar.dart';
import 'package:tests/screens/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> theme = ValueNotifier(ThemeMode.light);
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: theme,
      builder: (context, currentMode, _) => MaterialApp(
        home: const Splash(),
        themeMode: currentMode,
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        routes: {
          '/home': (context) => const Home(),
          '/galeryAccess': (context) => const GalleryAccess(),
          '/sliverBar': (context) => const SliverScreenAppBar(),
          '/sliverTransp': (context) => const SliverAppBarTransp(),
          '/themeScreen': (context) => const ThemeScreen(),
          '/postItScreen': (context) => const PostIt(),
          '/dummySalesScreen': (context) => const ListSales(),
          '/signature': (context) => const SignatureScreen(),
          '/mapsScreen': (context) => const MapsScreen(),
          '/draggableScreen': (context) => const DraggableScreen(),
        },
      ),
    );
  }
}
