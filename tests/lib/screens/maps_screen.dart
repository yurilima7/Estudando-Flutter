import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:tests/maps/locations.dart' as locations;
import 'package:geocoding/geocoding.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController mapController;

  // final LatLng _center = const LatLng(45.521563, -122.677433);

  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    // const address = "Rua da Paz, 100, São Paulo, Brasil";
    const address = "Rua Dez, 13, Caxias, MA";
    List<Location> locations = await locationFromAddress(address);

    setState(() {
      var l = locations[0];

      final latitude = l.latitude;
      final longitude = l.longitude;

      _markers.clear();
      mapController.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(latitude, longitude),
        ),
      );
      // print(_center);

      for (var i = 0; i < locations.length; i++) {
        final marker = Marker(
          markerId: MarkerId((i + 1).toString()),
          position: LatLng(locations[i].latitude, locations[i].longitude),
          infoWindow: const InfoWindow(
            title: 'Casa 13',
          ),
        );
        _markers[(i + 1).toString()] = marker;
      }
      // for (var location in locations) {
      //   print(location.longitude);
      // }

      // final marker = Marker(
      //   markerId: const MarkerId('origin'),
      //   position: LatLng(latitude, longitude),
      //   infoWindow: const InfoWindow(
      //     title: 'Origin',
      //   ),
      // );

      // _markers['origin'] = marker;
    });
  }

  // void _onMapCreated3(GoogleMapController controller) {
  //   mapController = controller;
  // }

  // final originAddress = '1600 Amphitheatre Parkway, Mountain View, CA'; // Exemplo de endereço de origem
  // final destinationAddress = '1 Infinite Loop, Cupertino, CA'; // Exemplo de endereço de destino

  // Future<void> _onMapCreated2(GoogleMapController controller) async {
  //   final googleOffices = await locations.getGoogleOffices();

  //   setState(() {
  //     _markers.clear();

  //     for (final office in googleOffices.offices) {
  //       final marker = Marker(
  //         markerId: MarkerId(office.name),
  //         position: LatLng(office.lat, office.lng),
  //         infoWindow: InfoWindow(
  //           title: office.name,
  //           snippet: office.address,
  //         ),
  //       );

  //       _markers[office.name] = marker;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mapa',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green[700],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          const address = "Rua da Paz, 100, São Paulo, Brasil";
          // const address = "1600 Amphitheatre Parkway, Mountain View, CA";
          // const address = "Rua 10, 13, Caxias, Ma, Teso Duro, Brasil";

          List<Location> locations = await locationFromAddress(address);

          var l = locations[0];

          final latitude = l.latitude;
          final longitude = l.longitude;

          mapController.animateCamera(
            CameraUpdate.newLatLng(
              LatLng(latitude, longitude),
            ),
          );
        },
        child: const Icon(Icons.search),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(0, 0),
                  zoom: 15.0,
                ),
                markers: _markers.values.toSet(),
              ),
            ),
      
            const Card(
              child: ListTile(
                title: Text('Olá'),
              ),
            ),

            // SizedBox(
            //   height: 300,
            //   child: GoogleMap(
            //     onMapCreated: _onMapCreated2,
            //     initialCameraPosition: const CameraPosition(
            //       target: LatLng(0, 0),
            //       zoom: 2,
            //     ),
            //   ),
            // ),

            // const Card(
            //   child: ListTile(
            //     title: Text('Olá'),
            //   ),
            // ),

            // SizedBox(
            //   height: 300,
            //   child: GoogleMap(
            //     onMapCreated: _onMapCreated3,
            //     initialCameraPosition: CameraPosition(
            //       target: _center,
            //       zoom: 11.0,
            //     ),
            //   ),
            // ),
          ]
        ),
      ),
    );
  }
}
