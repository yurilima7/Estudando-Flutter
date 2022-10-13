import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadOnly;

  const MapScreen({ 
    Key? key, 
    this.initialLocation = const PlaceLocation(
      latitude: 37.422,
      longitude: -122.084,
    ),
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  LatLng? _pickedPosition;

  void _selectPosition(LatLng position){
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione...'),

        actions: [
          if(!widget.isReadOnly)
            IconButton(
              onPressed: _pickedPosition == null ? null : (){
                Navigator.of(context).pop(_pickedPosition);
              },

              icon: const Icon(Icons.check),
            ),
        ],
      ),

      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),

          zoom: 13,
        ),

        onTap: widget.isReadOnly ? null : _selectPosition,
        markers: _pickedPosition == null ? {} : {
                Marker(
                  markerId: const MarkerId('p1'),
                  position: _pickedPosition ?? widget.initialLocation.toLatLng(),
                ),
        },
      ),
    );
  }
}