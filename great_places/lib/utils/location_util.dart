import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const googleApikey = 'AIzaSyAuiSjLefIaj4Nh8JgIgopuX8_e2BBushA';

class LocationUtil {
  static String generateLocationPreviewImage({
    double? latitude,
    double? longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$googleApikey';
  }

  static Future<String> getAddressFrom(LatLng position) async {
    final url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApikey');
    final response = await http.get(url);
    return jsonDecode(response.body)['results'][0]['formatted_address'];
  }
}
