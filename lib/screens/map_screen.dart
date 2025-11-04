import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:firebase_database/firebase_database.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markers = [];
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _loadFishLocations();
  }

  void _loadFishLocations() {
    _db.child('map').onValue.listen((event) {
      List<Marker> newMarkers = [];

      if (event.snapshot.exists) {
        Map<dynamic, dynamic> locationsMap =
            event.snapshot.value as Map<dynamic, dynamic>;

        locationsMap.forEach((locationId, locationData) {
          double latitude =
              (locationData['latitude'] as num?)?.toDouble() ?? 12.8797;
          double longitude =
              (locationData['longitude'] as num?)?.toDouble() ?? 121.7740;
          String fishId = locationData['fishId'] ?? 'unknown';

          _db.child('fish').child(fishId).once().then((fishSnapshot) {
            if (fishSnapshot.snapshot.exists) {
              Map<dynamic, dynamic> fishData =
                  fishSnapshot.snapshot.value as Map<dynamic, dynamic>;

              final marker = Marker(
                point: LatLng(latitude, longitude),
                width: 80,
                height: 80,
                child: GestureDetector(
                  onTap: () => _showFishDetails(fishData),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 40,
                      ),
                      Text(
                        fishData['commonName']?.toString() ?? 'Fish',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );

              setState(() {
                newMarkers.add(marker);
                markers = List.from(newMarkers);
              });
            }
          });
        });
      }
    });
  }

  void _showFishDetails(Map<dynamic, dynamic> fish) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: const Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                fish['commonName']?.toString() ?? 'Unknown',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Scientific: ${fish['scientificName'] ?? 'N/A'}'),
              Text('Local Name: ${fish['localName'] ?? 'N/A'}'),
              Text('Habitat: ${fish['habitat'] ?? 'N/A'}'),
              Text('Info: ${fish['information'] ?? 'N/A'}'),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fish Species Map'),
        backgroundColor: Colors.blue,
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(12.8797, 121.7740),
          initialZoom: 6.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.isdex',
          ),
          MarkerLayer(
            markers: markers,
          ),
        ],
      ),
    );
  }
}
