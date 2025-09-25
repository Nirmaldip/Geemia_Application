import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../provider/location_provider.dart';
import 'congrat_screen.dart';

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

  void _onContinue() {
    final selectedLocation = _searchController.text.isNotEmpty
        ? _searchController.text
        : '';

    if (selectedLocation.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select your location")),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const CongratsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
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
              if (!_mapController.isCompleted) _mapController.complete(controller);
            },
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      locationProvider.fetchSuggestions(value);
                    },
                    decoration: const InputDecoration(
                      hintText: "Your Location",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                if (locationProvider.suggestions.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: locationProvider.suggestions.length,
                      itemBuilder: (context, index) {
                        final s = locationProvider.suggestions[index];
                        return ListTile(
                          title: Text(s['description']),
                          onTap: () async {
                            await locationProvider.selectPlace(s['place_id']);
                            _searchController.text = s['description'];
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8A05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
