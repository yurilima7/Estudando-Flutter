import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  // final String originAddress;
  // final String destinationAddress;

  // const MapScreen({Key? key, required this.originAddress, required this.destinationAddress}) : super(key: key);
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final originAddress = '1600 Amphitheatre Parkway, Mountain View, CA'; // Exemplo de endereço de origem
  final destinationAddress = '1 Infinite Loop, Cupertino, CA'; // Exemplo de endereço de destino

  LatLng? origin;
  LatLng? destination;

  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _findCoordinates();
  }

  Future<void> _findCoordinates() async {
    origin = await _getLatLngFromAddress(originAddress);
    destination = await _getLatLngFromAddress(destinationAddress);

    if (origin != null && destination != null) {
      setState(() {
        markers.add(Marker(markerId: MarkerId('origin'), position: origin!));
        markers.add(Marker(markerId: MarkerId('destination'), position: destination!));
      });
    }
  }

  Future<LatLng?> _getLatLngFromAddress(String address) async {
    final encodedAddress = Uri.encodeComponent(address);
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?address=$encodedAddress';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List<dynamic>;
      if (results.isNotEmpty) {
        final location = results[0]['geometry']['location'];
        final lat = location['lat'] as double;
        final lng = location['lng'] as double;
        return LatLng(lat, lng);
      }
    }

    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(target: LatLng(0, 0), zoom: 10),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        markers: markers,
      ),
    );
  }
}
