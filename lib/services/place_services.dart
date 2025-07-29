// lib/services/places_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesService {
  final String apiKey;

  PlacesService(this.apiKey);

  Future<List<Map<String, dynamic>>> getSuggestions(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=geocode&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['status'] == 'OK') {
        return List<Map<String, dynamic>>.from(json['predictions']);
      } else {
        throw Exception('Failed to get predictions: ${json['status']}');
      }
    } else {
      throw Exception('Failed to fetch suggestions');
    }
  }

  Future<LatLng> getPlaceLocation(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final location = json['result']['geometry']['location'];
      return LatLng(location['lat'], location['lng']);
    } else {
      throw Exception('Failed to fetch place details');
    }
  }
}
