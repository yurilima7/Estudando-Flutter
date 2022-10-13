import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/place_detail_screen.dart';
import 'package:great_places/screens/place_form_screen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {

    final ThemeData theme = ThemeData();

    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      
      child: MaterialApp(
        title: 'Great Places',
        debugShowCheckedModeBanner: false,
        
        theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: Colors.amber, primary: Colors.indigo),
        ),
    
        home: const PlacesListScreen(),
    
        routes: {
          AppRoutes.placeForm:(context) => const PlaceFormScreen(),
          AppRoutes.placeDetail:(context) => const PlaceDetailScreen(),
        },
      ),
    );
  }
}