// location_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geemia_app/Screens/congrat_screen.dart';
import 'package:geemia_app/provider/location_provider.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({super.key});

  @override
  State<LocationAccessScreen> createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  final Completer<GoogleMapController> _mapController = Completer();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocationProvider>(context, listen: false).getCurrentLocation();
    });
  }

  void _showPermissionPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            "Would Like to Access your Location",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          content: const Text(
            "Your address is being securely checked to fetch your current location.",
            style: TextStyle(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Dismiss dialog
                Navigator.pushNamed(context, '/denied');
              },
              child: const Text("Don't Allow"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.pop(context); // Dismiss dialog
                Navigator.pushNamed(context, '/allowed');
              },
              child: const Text("OK", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          locationProvider.selectedLocation == null
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
            initialCameraPosition: CameraPosition(
              target: locationProvider.selectedLocation!,
              zoom: 14,
            ),
            myLocationEnabled: true,
            markers: {
              Marker(
                markerId: const MarkerId("selected"),
                position: locationProvider.selectedLocation!,
                infoWindow: const InfoWindow(title: "Selected Location"),
              )
            },
            onMapCreated: (controller) {
              if (!_mapController.isCompleted) {
                _mapController.complete(controller);
              }
            },
          ),

          // Search Bar and Suggestions
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        locationProvider.fetchSuggestions(value);
                      },
                      decoration: const InputDecoration(
                        hintText: "Your Location",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),
                if (locationProvider.suggestions.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: locationProvider.suggestions.length,
                      itemBuilder: (context, index) {
                        final suggestion = locationProvider.suggestions[index];
                        return ListTile(
                          title: Text(suggestion['description']),
                          onTap: () async {
                            await locationProvider.selectPlace(suggestion['place_id']);
                            _searchController.text = suggestion['description'];
                            if (_mapController.isCompleted) {
                              final controller = await _mapController.future;
                              controller.animateCamera(
                                CameraUpdate.newLatLngZoom(
                                  locationProvider.selectedLocation!,
                                  15,
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),

          // Bottom Buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: _showPermissionPopup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Allow Location Access",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CongratsScreen(name: '', email: '', enterCode: '', username: '', password: '', location: '',role: '',),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
