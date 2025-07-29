import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationProvider extends ChangeNotifier {
  LatLng? selectedLocation;
  List<Map<String, dynamic>> suggestions = [];

  final String _apiKey = 'YOUR_GOOGLE_API_KEY';

  /// Get current user location using Geolocator
  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      selectedLocation = LatLng(position.latitude, position.longitude);
      notifyListeners();
    }
  }

  /// Fetch suggestions from Google Places Autocomplete API
  Future<void> fetchSuggestions(String input) async {
    if (input.isEmpty) {
      suggestions = [];
      notifyListeners();
      return;
    }

    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      suggestions = List<Map<String, dynamic>>.from(data['predictions']);
      notifyListeners();
    } else {
      throw Exception('Failed to fetch suggestions');
    }
  }

  /// Select a place from suggestions using its place_id
  Future<void> selectPlace(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final location = data['result']['geometry']['location'];
      selectedLocation = LatLng(location['lat'], location['lng']);
      suggestions = [];
      notifyListeners();
    } else {
      throw Exception('Failed to fetch place details');
    }
  }
}
