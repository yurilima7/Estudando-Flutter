import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:great_places/utils/location_util.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPosition;

  const LocationInput({ Key? key, required this.onSelectPosition}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  void _showPreview(double lat, double lng){
    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
      latitude: lat,
      longitude: lng,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    try {
      final locData = await Location().getLocation();

      _showPreview(locData.latitude!, locData.longitude!);
      widget.onSelectPosition(LatLng(locData.latitude!,  locData.longitude!));
    } catch (e) {
      return;
    }  
  }

  Future<void> _selectOnMap() async {
    final LatLng selectPosition = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => const MapScreen(),
      ),
    );

    if (selectPosition == null) {
      return;
    }

    _showPreview(selectPosition.latitude, selectPosition.longitude);

    widget.onSelectPosition(selectPosition);
    log(selectPosition.latitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,

          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),

          child: _previewImageUrl == null
            ? const Text('Nenhuma localização informada!')
            : Image.network(
              _previewImageUrl!,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text('Localização Atual'),
              onPressed: _getCurrentUserLocation,
            ),

            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Selecione no Mapa'),
              onPressed: _selectOnMap,
            ),
          ],
        )
      ],
    );
  }
}