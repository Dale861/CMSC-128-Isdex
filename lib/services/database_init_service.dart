import 'package:firebase_database/firebase_database.dart';

class DatabaseInitService {
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  // Initialize Fish - 50 Philippine Fish
  Future<void> initializeFish() async {
    try {
      List<Map<String, dynamic>> fishData = [
        {
          'fishId': 'fish_1',
          'commonName': 'Yellowfin Tuna',
          'scientificName': 'Thunnus albacares',
          'localName': 'Tambakol',
          'habitat': 'Saltwater',
          'sizeRange': '100–150 cm',
          'identifyingFeatures': [
            'Blue to dark back with yellow sides',
            'Long yellow dorsal and anal fins',
          ],
          'imageUrl': 'assets/images/fish/fish (1).png',
        },
        {
          'fishId': 'fish_2',
          'commonName': 'Gray Snapper',
          'scientificName': 'Lutjanus griseus',
          'localName': 'Maya-maya',
          'habitat': 'Saltwater',
          'sizeRange': '25–40 cm',
          'identifyingFeatures': [
            'Gray to olive body coloration',
            'Dark stripe through eye',
          ],
          'imageUrl': 'assets/images/fish/fish (2).png',
        },
        {
          'fishId': 'fish_3',
          'commonName': 'Goldstripe Sardinella',
          'scientificName': 'Hyperlophus vittatus',
          'localName': 'Sardinella',
          'habitat': 'Saltwater',
          'sizeRange': '15–20 cm',
          'identifyingFeatures': [
            'Silver body with distinctive gold stripe',
            'Small, streamlined body shape',
          ],
          'imageUrl': 'assets/images/fish/fish (3).png',
        },
        {
          'fishId': 'fish_4',
          'commonName': 'Long-jawed Mackerel',
          'scientificName': 'Rastrelliger kanagurta',
          'localName': 'Alumahan',
          'habitat': 'Saltwater',
          'sizeRange': '30–35 cm',
          'identifyingFeatures': [
            'Blue-green back with silver belly',
            'Wavy dark lines on upper body',
          ],
          'imageUrl': 'assets/images/fish/fish (4).png',
        },
        {
          'fishId': 'fish_5',
          'commonName': 'Mackerel Scad',
          'scientificName': 'Decapterus sp',
          'localName': 'Galunggong',
          'habitat': 'Saltwater',
          'sizeRange': '20–25 cm',
          'identifyingFeatures': [
            'Silver body with forked tail',
            'Small dark spot on gill cover',
          ],
          'imageUrl': 'assets/images/fish/fish (5).png',
        },
        {
          'fishId': 'fish_6',
          'commonName': 'Threadfin Bream',
          'scientificName': 'Nemipterus japonicus',
          'localName': 'Bisugo',
          'habitat': 'Saltwater',
          'sizeRange': '20–25 cm',
          'identifyingFeatures': [
            'Pink to red body coloration',
            'Elongated pectoral fin filament',
          ],
          'imageUrl': 'assets/images/fish/fish (6).png',
        },
        {
          'fishId': 'fish_7',
          'commonName': 'Leopard Coral Grouper',
          'scientificName': 'Epinephelus sp',
          'localName': 'Lapu-lapu',
          'habitat': 'Saltwater',
          'sizeRange': '40–60 cm',
          'identifyingFeatures': [
            'Orange-red body with white streaks or spots',
            'Large mouth and robust body',
          ],
          'imageUrl': 'assets/images/fish/fish (7).png',
        },
        {
          'fishId': 'fish_8',
          'commonName': 'Nile Tilapia',
          'scientificName': 'Oreochromis niloticus',
          'localName': 'Tilapia',
          'habitat': 'Freshwater',
          'sizeRange': '20–30 cm',
          'identifyingFeatures': [
            'Golden to olive-gray coloration',
            'Vertical bars on body (may fade)',
          ],
          'imageUrl': 'assets/images/fish/fish (8).png',
        },
        {
          'fishId': 'fish_9',
          'commonName': 'Milkfish',
          'scientificName': 'Chanos chanos',
          'localName': 'Bangus',
          'habitat': 'Saltwater/Freshwater',
          'sizeRange': '30–40 cm',
          'identifyingFeatures': [
            'Silvery streamlined body',
            'Deeply forked tail fin',
          ],
          'imageUrl': 'assets/images/fish/fish (9).png',
        },
        {
          'fishId': 'fish_10',
          'commonName': 'Striped Snakehead',
          'scientificName': 'Channa striata',
          'localName': 'Dalag',
          'habitat': 'Freshwater',
          'sizeRange': '30–45 cm',
          'identifyingFeatures': [
            'Dark body with chevron-like stripes',
            'Large head with snake-like appearance',
          ],
          'imageUrl': 'assets/images/fish/fish (10).png',
        },
        {
          'fishId': 'fish_11',
          'commonName': 'Common Carp',
          'scientificName': 'Cyprinus carpio',
          'localName': 'Carp',
          'habitat': 'Freshwater',
          'sizeRange': '40–60 cm',
          'identifyingFeatures': [
            'Brown to golden coloring',
            'Two pairs of barbels on mouth',
          ],
          'imageUrl': 'assets/images/fish/fish (11).png',
        },
        {
          'fishId': 'fish_12',
          'commonName': 'Asian Catfish',
          'scientificName': 'Clarias batrachus',
          'localName': 'Catfish',
          'habitat': 'Freshwater',
          'sizeRange': '25–35 cm',
          'identifyingFeatures': [
            'Dark gray to black body',
            'Four pairs of barbels (whiskers)',
          ],
          'imageUrl': 'assets/images/fish/fish (12).png',
        },
        {
          'fishId': 'fish_13',
          'commonName': 'Manila Catfish',
          'scientificName': 'Arius manillensis',
          'localName': 'Kanduli',
          'habitat': 'Freshwater',
          'sizeRange': '20–30 cm',
          'identifyingFeatures': [
            'Dark body coloration',
            'Large sharp pectoral spines',
          ],
          'imageUrl': 'assets/images/fish/fish (13).png',
        },
        {
          'fishId': 'fish_14',
          'commonName': 'White Goby',
          'scientificName': 'Glossogobius giuris',
          'localName': 'Puting biya',
          'habitat': 'Freshwater',
          'sizeRange': '10–15 cm',
          'identifyingFeatures': [
            'White to pale gray body',
            'Two separate dorsal fins',
          ],
          'imageUrl': 'assets/images/fish/fish (14).png',
        },
        {
          'fishId': 'fish_15',
          'commonName': 'Silver Perch',
          'scientificName': 'Leiopotherapon plumbeus',
          'localName': 'Ayuñgin',
          'habitat': 'Freshwater',
          'sizeRange': '15–20 cm',
          'identifyingFeatures': [
            'Silver body with dark longitudinal stripes',
            'Compressed body shape',
          ],
          'imageUrl': 'assets/images/fish/fish (15).png',
        },
        {
          'fishId': 'fish_16',
          'commonName': 'Giant Gourami',
          'scientificName': 'Osphronemus goramy',
          'localName': 'Gourami',
          'habitat': 'Freshwater',
          'sizeRange': '50–60 cm',
          'identifyingFeatures': [
            'Large, robust body',
            'Thick lips and compressed body',
          ],
          'imageUrl': 'assets/images/fish/fish (16).png',
        },
        {
          'fishId': 'fish_17',
          'commonName': 'Mudfish',
          'scientificName': 'Oxyeleotris marmoratus',
          'localName': 'Mudfish',
          'habitat': 'Freshwater',
          'sizeRange': '30–40 cm',
          'identifyingFeatures': [
            'Dark mottled or marbled pattern',
            'Elongated body shape',
          ],
          'imageUrl': 'assets/images/fish/fish (17).png',
        },
        {
          'fishId': 'fish_18',
          'commonName': 'Climbing Perch',
          'scientificName': 'Anabas testudineus',
          'localName': 'Climbing Perch',
          'habitat': 'Freshwater',
          'sizeRange': '20–25 cm',
          'identifyingFeatures': [
            'Brown body coloration',
            'Can breathe air and survive out of water',
          ],
          'imageUrl': 'assets/images/fish/fish (18).png',
        },
        {
          'fishId': 'fish_19',
          'commonName': 'Trevally',
          'scientificName': 'Carangidae spp',
          'localName': 'Trevally',
          'habitat': 'Saltwater',
          'sizeRange': '30–50 cm',
          'identifyingFeatures': [
            'Silver body with forked tail',
            'Streamlined, powerful build',
          ],
          'imageUrl': 'assets/images/fish/fish (19).png',
        },
        {
          'fishId': 'fish_20',
          'commonName': 'Grouper',
          'scientificName': 'Serranidae spp',
          'localName': 'Grouper',
          'habitat': 'Saltwater',
          'sizeRange': '40–80 cm',
          'identifyingFeatures': [
            'Large mouth and robust body',
            'Variable color patterns',
          ],
          'imageUrl': 'assets/images/fish/fish (20).png',
        },
        {
          'fishId': 'fish_21',
          'commonName': 'Red Snapper',
          'scientificName': 'Lutjanidae spp',
          'localName': 'Snapper',
          'habitat': 'Saltwater',
          'sizeRange': '25–40 cm',
          'identifyingFeatures': [
            'Red to pink body coloration',
            'Sharp teeth and pointed snout',
          ],
          'imageUrl': 'assets/images/fish/fish (21).png',
        },
        {
          'fishId': 'fish_22',
          'commonName': 'Goatfish',
          'scientificName': 'Mullidae spp',
          'localName': 'Goatfish',
          'habitat': 'Saltwater',
          'sizeRange': '20–30 cm',
          'identifyingFeatures': [
            'Yellow to red body coloration',
            'Two barbels under chin',
          ],
          'imageUrl': 'assets/images/fish/fish (22).png',
        },
        {
          'fishId': 'fish_23',
          'commonName': 'Emperor',
          'scientificName': 'Lethrinus lentjan',
          'localName': 'Bitilya',
          'habitat': 'Saltwater',
          'sizeRange': '35–50 cm',
          'identifyingFeatures': [
            'Blue-green back with silver sides',
            'Thick lips and robust body',
          ],
          'imageUrl': 'assets/images/fish/fish (23).png',
        },
        {
          'fishId': 'fish_24',
          'commonName': 'Indo-Pacific Tarpon',
          'scientificName': 'Megalops cyprinoides',
          'localName': 'Buan-buan',
          'habitat': 'Saltwater',
          'sizeRange': '80–100 cm',
          'identifyingFeatures': [
            'Large silver body with large scales',
            'Upturned mouth',
          ],
          'imageUrl': 'assets/images/fish/fish (24).png',
        },
        {
          'fishId': 'fish_25',
          'commonName': 'Dolphinfish',
          'scientificName': 'Coryphaena hippurus',
          'localName': 'Dorado',
          'habitat': 'Saltwater',
          'sizeRange': '50–80 cm',
          'identifyingFeatures': [
            'Golden-green iridescent coloring',
            'Blunt forehead and long dorsal fin',
          ],
          'imageUrl': 'assets/images/fish/fish (25).png',
        },
        {
          'fishId': 'fish_26',
          'commonName': 'Threadfin Salmon',
          'scientificName': 'Eleutheronema tetradactylum',
          'localName': 'Salmon',
          'habitat': 'Saltwater',
          'sizeRange': '80–120 cm',
          'identifyingFeatures': [
            'Silver body',
            'Long thread-like pectoral fin rays',
          ],
          'imageUrl': 'assets/images/fish/fish (26).png',
        },
        {
          'fishId': 'fish_27',
          'commonName': 'Red Bigeye',
          'scientificName': 'Priacanthus macracanthus',
          'localName': 'Dilat',
          'habitat': 'Saltwater',
          'sizeRange': '15–20 cm',
          'identifyingFeatures': [
            'Red body coloration',
            'Very large eyes',
          ],
          'imageUrl': 'assets/images/fish/fish (27).png',
        },
        {
          'fishId': 'fish_28',
          'commonName': 'Moonfish',
          'scientificName': 'Mene maculata',
          'localName': 'Chabeta',
          'habitat': 'Saltwater',
          'sizeRange': '15–20 cm',
          'identifyingFeatures': [
            'Disc-shaped, highly compressed body',
            'Silver body with dark spots',
          ],
          'imageUrl': 'assets/images/fish/fish (28).png',
        },
        {
          'fishId': 'fish_29',
          'commonName': 'Rabbit Fish',
          'scientificName': 'Siganus sp',
          'localName': 'Rabbit Fish',
          'habitat': 'Saltwater',
          'sizeRange': '25–30 cm',
          'identifyingFeatures': [
            'Brown to green body',
            'Venomous spines on fins',
          ],
          'imageUrl': 'assets/images/fish/fish (29).png',
        },
        {
          'fishId': 'fish_30',
          'commonName': 'Surgeonfish',
          'scientificName': 'Acanthurus sp',
          'localName': 'Surgeonfish',
          'habitat': 'Saltwater',
          'sizeRange': '20–30 cm',
          'identifyingFeatures': [
            'Colorful body',
            'Sharp scalpel-like spine on tail base',
          ],
          'imageUrl': 'assets/images/fish/fish (30).png',
        },
        {
          'fishId': 'fish_31',
          'commonName': 'Butterflyfish',
          'scientificName': 'Chaetodon sp',
          'localName': 'Butterflyfish',
          'habitat': 'Saltwater',
          'sizeRange': '15–20 cm',
          'identifyingFeatures': [
            'Colorful patterns and stripes',
            'Disc-shaped, compressed body',
          ],
          'imageUrl': 'assets/images/fish/fish (31).png',
        },
        {
          'fishId': 'fish_32',
          'commonName': 'Damselfish',
          'scientificName': 'Pomacentridae sp',
          'localName': 'Damselfish',
          'habitat': 'Saltwater',
          'sizeRange': '10–15 cm',
          'identifyingFeatures': [
            'Bright coloration (blue, yellow, or orange)',
            'Small, oval-shaped body',
          ],
          'imageUrl': 'assets/images/fish/fish (32).png',
        },
        {
          'fishId': 'fish_33',
          'commonName': 'Wrasse',
          'scientificName': 'Labridae sp',
          'localName': 'Wrasse',
          'habitat': 'Saltwater',
          'sizeRange': '20–30 cm',
          'identifyingFeatures': [
            'Colorful body with variable patterns',
            'Thick lips and elongated body',
          ],
          'imageUrl': 'assets/images/fish/fish (33).png',
        },
        {
          'fishId': 'fish_34',
          'commonName': 'Parrotfish',
          'scientificName': 'Scaridae sp',
          'localName': 'Parrotfish',
          'habitat': 'Saltwater',
          'sizeRange': '25–35 cm',
          'identifyingFeatures': [
            'Colorful body',
            'Beak-like fused teeth',
          ],
          'imageUrl': 'assets/images/fish/fish (34).png',
        },
        {
          'fishId': 'fish_35',
          'commonName': 'Sweetlip',
          'scientificName': 'Haemulidae sp',
          'localName': 'Sweetlip',
          'habitat': 'Saltwater',
          'sizeRange': '30–40 cm',
          'identifyingFeatures': [
            'Striped or spotted pattern',
            'Thick lips',
          ],
          'imageUrl': 'assets/images/fish/fish (35).png',
        },
        {
          'fishId': 'fish_36',
          'commonName': 'Barracuda',
          'scientificName': 'Sphyraena sp',
          'localName': 'Barracuda',
          'habitat': 'Saltwater',
          'sizeRange': '50–80 cm',
          'identifyingFeatures': [
            'Elongated, torpedo-shaped body',
            'Large mouth with sharp teeth',
          ],
          'imageUrl': 'assets/images/fish/fish (36).png',
        },
        {
          'fishId': 'fish_37',
          'commonName': 'Jack',
          'scientificName': 'Caranx sp',
          'localName': 'Jack',
          'habitat': 'Saltwater',
          'sizeRange': '30–50 cm',
          'identifyingFeatures': [
            'Silver body',
            'Forked tail and streamlined shape',
          ],
          'imageUrl': 'assets/images/fish/fish (37).png',
        },
        {
          'fishId': 'fish_38',
          'commonName': 'Asian Seabass',
          'scientificName': 'Lates calcarifer',
          'localName': 'Barramundi',
          'habitat': 'Saltwater/Freshwater',
          'sizeRange': '60–100 cm',
          'identifyingFeatures': [
            'Silver body with large scales',
            'Concave forehead profile',
          ],
          'imageUrl': 'assets/images/fish/fish (38).png',
        },
        {
          'fishId': 'fish_39',
          'commonName': 'Eel',
          'scientificName': 'Anguilla sp',
          'localName': 'Eel',
          'habitat': 'Freshwater/Saltwater',
          'sizeRange': '60–100 cm',
          'identifyingFeatures': [
            'Long, snake-like body',
            'Continuous dorsal, caudal, and anal fins',
          ],
          'imageUrl': 'assets/images/fish/fish (39).png',
        },
        {
          'fishId': 'fish_40',
          'commonName': 'Halfbeak',
          'scientificName': 'Hemirhamphus sp',
          'localName': 'Halfbeak',
          'habitat': 'Saltwater',
          'sizeRange': '20–25 cm',
          'identifyingFeatures': [
            'Silver body',
            'Extended lower jaw',
          ],
          'imageUrl': 'assets/images/fish/fish (40).png',
        },
        {
          'fishId': 'fish_41',
          'commonName': 'Needlefish',
          'scientificName': 'Belonidae sp',
          'localName': 'Needlefish',
          'habitat': 'Saltwater',
          'sizeRange': '30–40 cm',
          'identifyingFeatures': [
            'Elongated, needle-like body',
            'Long, beak-like jaws with sharp teeth',
          ],
          'imageUrl': 'assets/images/fish/fish (41).png',
        },
        {
          'fishId': 'fish_42',
          'commonName': 'Flying Fish',
          'scientificName': 'Exocoetus sp',
          'localName': 'Flying Fish',
          'habitat': 'Saltwater',
          'sizeRange': '20–30 cm',
          'identifyingFeatures': [
            'Large, wing-like pectoral fins',
            'Can glide above water surface',
          ],
          'imageUrl': 'assets/images/fish/fish (42).png',
        },
        {
          'fishId': 'fish_43',
          'commonName': 'Seahorse',
          'scientificName': 'Syngnathidae sp',
          'localName': 'Seahorse',
          'habitat': 'Saltwater',
          'sizeRange': '10–15 cm',
          'identifyingFeatures': [
            'Horse-like head and neck',
            'Prehensile tail',
          ],
          'imageUrl': 'assets/images/fish/fish (43).png',
        },
        {
          'fishId': 'fish_44',
          'commonName': 'Sea Dragon',
          'scientificName': 'Hippocampus sp',
          'localName': 'Sea Dragon',
          'habitat': 'Saltwater',
          'sizeRange': '15–20 cm',
          'identifyingFeatures': [
            'Leaf-like appendages for camouflage',
            'Elongated snout',
          ],
          'imageUrl': 'assets/images/fish/fish (44).png',
        },
        {
          'fishId': 'fish_45',
          'commonName': 'Pufferfish',
          'scientificName': 'Tetraodontidae sp',
          'localName': 'Pufferfish',
          'habitat': 'Saltwater',
          'sizeRange': '10–20 cm',
          'identifyingFeatures': [
            'Can inflate body when threatened',
            'Contains toxic tetrodotoxin',
          ],
          'imageUrl': 'assets/images/fish/fish (45).png',
        },
        {
          'fishId': 'fish_46',
          'commonName': 'Porcupinefish',
          'scientificName': 'Diodon sp',
          'localName': 'Porcupinefish',
          'habitat': 'Saltwater',
          'sizeRange': '20–30 cm',
          'identifyingFeatures': [
            'Body covered with spines',
            'Can inflate when threatened',
          ],
          'imageUrl': 'assets/images/fish/fish (46).png',
        },
        {
          'fishId': 'fish_47',
          'commonName': 'Boxfish',
          'scientificName': 'Ostraciidae sp',
          'localName': 'Boxfish',
          'habitat': 'Saltwater',
          'sizeRange': '10–20 cm',
          'identifyingFeatures': [
            'Cube-shaped, box-like body',
            'Bony carapace',
          ],
          'imageUrl': 'assets/images/fish/fish (47).png',
        },
        {
          'fishId': 'fish_48',
          'commonName': 'Pomfret',
          'scientificName': 'Stromateidae sp',
          'localName': 'Pomfret',
          'habitat': 'Saltwater',
          'sizeRange': '20–30 cm',
          'identifyingFeatures': [
            'Flat, disc-shaped body',
            'Deeply forked tail',
          ],
          'imageUrl': 'assets/images/fish/fish (48).png',
        },
        {
          'fishId': 'fish_49',
          'commonName': 'Ribbonfish',
          'scientificName': 'Trichiuridae sp',
          'localName': 'Ribbonfish',
          'habitat': 'Saltwater',
          'sizeRange': '100–150 cm',
          'identifyingFeatures': [
            'Long, ribbon-like compressed body',
            'Pointed tail without caudal fin',
          ],
          'imageUrl': 'assets/images/fish/fish (49).png',
        },
        {
          'fishId': 'fish_50',
          'commonName': 'Spotted Scat',
          'scientificName': 'Scatophagus argus',
          'localName': 'Kitang',
          'habitat': 'Brackish Water',
          'sizeRange': '15–20 cm',
          'identifyingFeatures': [
            'Silver-bronze body with black spots',
            'Disc-shaped, compressed body',
          ],
          'imageUrl': 'assets/images/fish/fish (50).png',
        },
      ];
      for (var fish in fishData) {
        await _db.child('fish').child(fish['fishId']).set(fish);
      }
      print('✅ 50 Fish records initialized successfully');
    } catch (e) {
      print('❌ Error initializing fish: $e');
    }
  }

    // Initialize Map Locations (same as before)
  Future<void> initializeMapLocations() async {
    try {
// Updated Map Locations with 2-3 locations per fish based on actual Philippine fishing areas

      List<Map<String, dynamic>> mapData = [
        // fish_1 (Yellowfin Tuna) - General Santos, Lagonoy Gulf, Occidental Mindoro
        {'locationId': 'location_1', 'fishId': 'fish_1', 'latitude': 6.1115, 'longitude': 125.1715, 'region': 'General Santos'},
        {'locationId': 'location_1b', 'fishId': 'fish_1', 'latitude': 13.6833, 'longitude': 123.7667, 'region': 'Lagonoy Gulf, Albay'},
        {'locationId': 'location_1c', 'fishId': 'fish_1', 'latitude': 13.0833, 'longitude': 120.5333, 'region': 'Occidental Mindoro'},
        
        // fish_2 (Gray Snapper/Maya-maya) - Manila Bay, Palawan, Negros
        {'locationId': 'location_2', 'fishId': 'fish_2', 'latitude': 14.5994, 'longitude': 120.9842, 'region': 'Manila Bay'},
        {'locationId': 'location_2b', 'fishId': 'fish_2', 'latitude': 9.7604, 'longitude': 118.7282, 'region': 'Palawan'},
        {'locationId': 'location_2c', 'fishId': 'fish_2', 'latitude': 10.3157, 'longitude': 123.0854, 'region': 'Negros'},
        
        // fish_3 (Goldstripe Sardinella) - Navotas, Zamboanga, Davao Gulf
        {'locationId': 'location_3', 'fishId': 'fish_3', 'latitude': 14.6667, 'longitude': 120.8333, 'region': 'Navotas'},
        {'locationId': 'location_3b', 'fishId': 'fish_3', 'latitude': 6.9271, 'longitude': 122.0725, 'region': 'Zamboanga'},
        {'locationId': 'location_3c', 'fishId': 'fish_3', 'latitude': 6.5000, 'longitude': 125.5000, 'region': 'Davao Gulf'},
        
        // fish_4 (Long-jawed Mackerel/Alumahan) - Visayas, Palawan, Mindanao
        {'locationId': 'location_4', 'fishId': 'fish_4', 'latitude': 10.3157, 'longitude': 123.8854, 'region': 'Cebu'},
        {'locationId': 'location_4b', 'fishId': 'fish_4', 'latitude': 9.5381, 'longitude': 118.7399, 'region': 'Palawan'},
        {'locationId': 'location_4c', 'fishId': 'fish_4', 'latitude': 7.0731, 'longitude': 125.6114, 'region': 'Mindanao'},
        
        // fish_5 (Mackerel Scad/Galunggong) - Palawan, Manila Bay, Batangas
        {'locationId': 'location_5', 'fishId': 'fish_5', 'latitude': 9.5381, 'longitude': 118.7399, 'region': 'Palawan'},
        {'locationId': 'location_5b', 'fishId': 'fish_5', 'latitude': 14.5994, 'longitude': 120.9842, 'region': 'Manila Bay'},
        {'locationId': 'location_5c', 'fishId': 'fish_5', 'latitude': 13.7565, 'longitude': 121.0583, 'region': 'Batangas'},
        
        // fish_6 (Threadfin Bream/Bisugo) - Mindanao, Maguindanao, Palawan
        {'locationId': 'location_6', 'fishId': 'fish_6', 'latitude': 7.0731, 'longitude': 125.6114, 'region': 'Mindanao'},
        {'locationId': 'location_6b', 'fishId': 'fish_6', 'latitude': 6.5244, 'longitude': 124.2118, 'region': 'Maguindanao'},
        {'locationId': 'location_6c', 'fishId': 'fish_6', 'latitude': 9.7604, 'longitude': 118.7282, 'region': 'Palawan'},
        
        // fish_7 (Leopard Coral Grouper/Lapu-lapu) - Palawan, Panglao Bohol, Cebu
        {'locationId': 'location_7', 'fishId': 'fish_7', 'latitude': 9.7604, 'longitude': 118.7282, 'region': 'Palawan'},
        {'locationId': 'location_7b', 'fishId': 'fish_7', 'latitude': 9.5810, 'longitude': 123.7578, 'region': 'Panglao, Bohol'},
        {'locationId': 'location_7c', 'fishId': 'fish_7', 'latitude': 10.3157, 'longitude': 123.8854, 'region': 'Cebu'},
        
        // fish_8 (Nile Tilapia) - Laguna de Bay, Taal Lake, Bicol
        {'locationId': 'location_8', 'fishId': 'fish_8', 'latitude': 14.3127, 'longitude': 121.1978, 'region': 'Laguna de Bay'},
        {'locationId': 'location_8b', 'fishId': 'fish_8', 'latitude': 13.9781, 'longitude': 120.9881, 'region': 'Taal Lake'},
        {'locationId': 'location_8c', 'fishId': 'fish_8', 'latitude': 13.6833, 'longitude': 123.7667, 'region': 'Bicol'},
        
        // fish_9 (Milkfish/Bangus) - Dagupan, Bulacan, Iloilo
        {'locationId': 'location_9', 'fishId': 'fish_9', 'latitude': 16.0433, 'longitude': 120.3333, 'region': 'Dagupan, Pangasinan'},
        {'locationId': 'location_9b', 'fishId': 'fish_9', 'latitude': 14.7942, 'longitude': 120.8806, 'region': 'Bulacan'},
        {'locationId': 'location_9c', 'fishId': 'fish_9', 'latitude': 10.7202, 'longitude': 122.5621, 'region': 'Iloilo'},
        
        // fish_10 (Striped Snakehead/Dalag) - Pampanga, Laguna, Mindoro
        {'locationId': 'location_10', 'fishId': 'fish_10', 'latitude': 14.8791, 'longitude': 120.5596, 'region': 'Pampanga'},
        {'locationId': 'location_10b', 'fishId': 'fish_10', 'latitude': 14.2691, 'longitude': 121.4113, 'region': 'Laguna'},
        {'locationId': 'location_10c', 'fishId': 'fish_10', 'latitude': 13.1939, 'longitude': 121.2058, 'region': 'Mindoro'},
        
        // fish_11 (Common Carp) - Laguna, Central Luzon, Mindanao
        {'locationId': 'location_11', 'fishId': 'fish_11', 'latitude': 14.2691, 'longitude': 121.4113, 'region': 'Laguna'},
        {'locationId': 'location_11b', 'fishId': 'fish_11', 'latitude': 15.4833, 'longitude': 120.7167, 'region': 'Central Luzon'},
        {'locationId': 'location_11c', 'fishId': 'fish_11', 'latitude': 7.0731, 'longitude': 125.6114, 'region': 'Mindanao'},
        
        // fish_12 (Asian Catfish) - Laguna, Pampanga, Mindanao
        {'locationId': 'location_12', 'fishId': 'fish_12', 'latitude': 14.2691, 'longitude': 121.4113, 'region': 'Laguna'},
        {'locationId': 'location_12b', 'fishId': 'fish_12', 'latitude': 14.8791, 'longitude': 120.5596, 'region': 'Pampanga'},
        {'locationId': 'location_12c', 'fishId': 'fish_12', 'latitude': 7.0731, 'longitude': 125.6114, 'region': 'Mindanao'},
        
        // fish_13 (Manila Catfish/Kanduli) - Laguna, Cagayan River, Mindanao
        {'locationId': 'location_13', 'fishId': 'fish_13', 'latitude': 14.3127, 'longitude': 121.1978, 'region': 'Laguna de Bay'},
        {'locationId': 'location_13b', 'fishId': 'fish_13', 'latitude': 17.6132, 'longitude': 121.7270, 'region': 'Cagayan River'},
        {'locationId': 'location_13c', 'fishId': 'fish_13', 'latitude': 8.2280, 'longitude': 124.2452, 'region': 'Mindanao Rivers'},
        
        // fish_14 (White Goby/Puting biya) - Laguna, Pampanga, Bicol
        {'locationId': 'location_14', 'fishId': 'fish_14', 'latitude': 14.3127, 'longitude': 121.1978, 'region': 'Laguna de Bay'},
        {'locationId': 'location_14b', 'fishId': 'fish_14', 'latitude': 14.8791, 'longitude': 120.5596, 'region': 'Pampanga'},
        {'locationId': 'location_14c', 'fishId': 'fish_14', 'latitude': 13.6833, 'longitude': 123.7667, 'region': 'Bicol'},
        
        // fish_15 (Silver Perch/Ayungin) - Laguna, Taal, Mindanao
        {'locationId': 'location_15', 'fishId': 'fish_15', 'latitude': 14.3127, 'longitude': 121.1978, 'region': 'Laguna de Bay'},
        {'locationId': 'location_15b', 'fishId': 'fish_15', 'latitude': 13.9781, 'longitude': 120.9881, 'region': 'Taal Lake'},
        {'locationId': 'location_15c', 'fishId': 'fish_15', 'latitude': 7.0731, 'longitude': 125.6114, 'region': 'Mindanao Lakes'},
        
        // fish_16 (Giant Gourami) - Laguna, Mindanao, Bulacan
        {'locationId': 'location_16', 'fishId': 'fish_16', 'latitude': 14.3127, 'longitude': 121.1978, 'region': 'Laguna'},
        {'locationId': 'location_16b', 'fishId': 'fish_16', 'latitude': 7.0731, 'longitude': 125.6114, 'region': 'Mindanao'},
        {'locationId': 'location_16c', 'fishId': 'fish_16', 'latitude': 14.7942, 'longitude': 120.8806, 'region': 'Bulacan'},
        
        // fish_17 (Mudfish) - Mindoro, Pampanga, Isabela
        {'locationId': 'location_17', 'fishId': 'fish_17', 'latitude': 13.1939, 'longitude': 121.2058, 'region': 'Mindoro'},
        {'locationId': 'location_17b', 'fishId': 'fish_17', 'latitude': 14.8791, 'longitude': 120.5596, 'region': 'Pampanga'},
        {'locationId': 'location_17c', 'fishId': 'fish_17', 'latitude': 16.9754, 'longitude': 121.8107, 'region': 'Isabela'},
        
        // fish_18 (Climbing Perch) - Marinduque, Laguna, Pampanga
        {'locationId': 'location_18', 'fishId': 'fish_18', 'latitude': 13.4166, 'longitude': 122.0167, 'region': 'Marinduque'},
        {'locationId': 'location_18b', 'fishId': 'fish_18', 'latitude': 14.2691, 'longitude': 121.4113, 'region': 'Laguna'},
        {'locationId': 'location_18c', 'fishId': 'fish_18', 'latitude': 14.8791, 'longitude': 120.5596, 'region': 'Pampanga'},
        
        // fish_19 (Trevally) - Quezon, Batangas, Palawan
        {'locationId': 'location_19', 'fishId': 'fish_19', 'latitude': 14.7505, 'longitude': 121.9475, 'region': 'Quezon'},
        {'locationId': 'location_19b', 'fishId': 'fish_19', 'latitude': 13.7565, 'longitude': 121.0583, 'region': 'Batangas'},
        {'locationId': 'location_19c', 'fishId': 'fish_19', 'latitude': 9.7604, 'longitude': 118.7282, 'region': 'Palawan'},
        
        // fish_20 (Grouper) - Aklan, Palawan, Bohol
        {'locationId': 'location_20', 'fishId': 'fish_20', 'latitude': 11.6901, 'longitude': 122.0001, 'region': 'Aklan'},
        {'locationId': 'location_20b', 'fishId': 'fish_20', 'latitude': 9.7604, 'longitude': 118.7282, 'region': 'Palawan'},
        {'locationId': 'location_20c', 'fishId': 'fish_20', 'latitude': 9.8499, 'longitude': 124.1435, 'region': 'Bohol'},
        
        // fish_21 (Red Snapper) - Davao, Zamboanga, Palawan
        {'locationId': 'location_21', 'fishId': 'fish_21', 'latitude': 6.9271, 'longitude': 125.4092, 'region': 'Davao'},
        {'locationId': 'location_21b', 'fishId': 'fish_21', 'latitude': 6.9271, 'longitude': 122.0725, 'region': 'Zamboanga'},
        {'locationId': 'location_21c', 'fishId': 'fish_21', 'latitude': 9.7604, 'longitude': 118.7282, 'region': 'Palawan'},
        
        // fish_22 (Goatfish) - General Santos, Davao, Sarangani
        {'locationId': 'location_22', 'fishId': 'fish_22', 'latitude': 6.1115, 'longitude': 125.1915, 'region': 'General Santos'},
        {'locationId': 'location_22b', 'fishId': 'fish_22', 'latitude': 6.9271, 'longitude': 125.4092, 'region': 'Davao'},
        {'locationId': 'location_22c', 'fishId': 'fish_22', 'latitude': 6.0765, 'longitude': 125.6306, 'region': 'Sarangani'},
        
        // fish_23 (Emperor/Bitilya) - Zamboanga, Palawan, Tawi-Tawi
        {'locationId': 'location_23', 'fishId': 'fish_23', 'latitude': 6.9271, 'longitude': 122.0725, 'region': 'Zamboanga'},
        {'locationId': 'location_23b', 'fishId': 'fish_23', 'latitude': 9.7604, 'longitude': 118.7282, 'region': 'Palawan'},
        {'locationId': 'location_23c', 'fishId': 'fish_23', 'latitude': 5.1291, 'longitude': 119.9582, 'region': 'Tawi-Tawi'},
        
        // fish_24 (Indo-Pacific Tarpon/Buan-buan) - Coron, El Nido, Busuanga
        {'locationId': 'location_24', 'fishId': 'fish_24', 'latitude': 11.9990, 'longitude': 120.2050, 'region': 'Coron, Palawan'},
        {'locationId': 'location_24b', 'fishId': 'fish_24', 'latitude': 11.1949, 'longitude': 119.4010, 'region': 'El Nido, Palawan'},
        {'locationId': 'location_24c', 'fishId': 'fish_24', 'latitude': 12.1642, 'longitude': 120.0069, 'region': 'Busuanga'},
        
        // fish_25 (Dolphinfish/Dorado) - Sipalay, Batanes, Zambales
        {'locationId': 'location_25', 'fishId': 'fish_25', 'latitude': 9.8509, 'longitude': 123.4197, 'region': 'Sipalay'},
        {'locationId': 'location_25b', 'fishId': 'fish_25', 'latitude': 20.4486, 'longitude': 121.9697, 'region': 'Batanes'},
        {'locationId': 'location_25c', 'fishId': 'fish_25', 'latitude': 15.5082, 'longitude': 119.9692, 'region': 'Zambales'},
        
        // fish_26 (Threadfin Salmon) - Dinagat, Surigao, Leyte Gulf
        {'locationId': 'location_26', 'fishId': 'fish_26', 'latitude': 9.6833, 'longitude': 125.4667, 'region': 'Dinagat'},
        {'locationId': 'location_26b', 'fishId': 'fish_26', 'latitude': 9.7883, 'longitude': 125.5040, 'region': 'Surigao'},
        {'locationId': 'location_26c', 'fishId': 'fish_26', 'latitude': 10.9117, 'longitude': 125.0061, 'region': 'Leyte Gulf'},
        
        // fish_27 (Red Bigeye/Dilat) - Moalboal, Cebu, Bohol
        {'locationId': 'location_27', 'fishId': 'fish_27', 'latitude': 9.9274, 'longitude': 123.3950, 'region': 'Moalboal, Cebu'},
        {'locationId': 'location_27b', 'fishId': 'fish_27', 'latitude': 10.3157, 'longitude': 123.8854, 'region': 'Cebu'},
        {'locationId': 'location_27c', 'fishId': 'fish_27', 'latitude': 9.8499, 'longitude': 124.1435, 'region': 'Bohol'},
        
        // fish_28 (Moonfish/Chabeta) - Surigao, Dinagat, Leyte
        {'locationId': 'location_28', 'fishId': 'fish_28', 'latitude': 9.7883, 'longitude': 125.5040, 'region': 'Surigao'},
        {'locationId': 'location_28b', 'fishId': 'fish_28', 'latitude': 9.6833, 'longitude': 125.4667, 'region': 'Dinagat'},
        {'locationId': 'location_28c', 'fishId': 'fish_28', 'latitude': 10.7202, 'longitude': 124.7521, 'region': 'Leyte'},
        
        // fish_29 (Rabbit Fish) - Leyte, Samar, Bohol
        {'locationId': 'location_29', 'fishId': 'fish_29', 'latitude': 10.7202, 'longitude': 124.7521, 'region': 'Leyte'},
        {'locationId': 'location_29b', 'fishId': 'fish_29', 'latitude': 11.5799, 'longitude': 125.0060, 'region': 'Samar'},
        {'locationId': 'location_29c', 'fishId': 'fish_29', 'latitude': 9.8499, 'longitude': 124.1435, 'region': 'Bohol'},
        
        // fish_30 (Surgeonfish) - Cebu, Bohol, Palawan
        {'locationId': 'location_30', 'fishId': 'fish_30', 'latitude': 10.3157, 'longitude': 123.8854, 'region': 'Cebu'},
        {'locationId': 'location_30b', 'fishId': 'fish_30', 'latitude': 9.8499, 'longitude': 124.1435, 'region': 'Bohol'},
        {'locationId': 'location_30c', 'fishId': 'fish_30', 'latitude': 9.7604, 'longitude': 118.7282, 'region': 'Palawan'},
        
        // fish_31 (Butterflyfish) - Bohol, Cebu, Palawan
        {'locationId': 'location_31', 'fishId': 'fish_31', 'latitude': 9.8499, 'longitude': 124.1435, 'region': 'Bohol'},
        {'locationId': 'location_31b', 'fishId': 'fish_31', 'latitude': 10.3157, 'longitude': 123.8854, 'region': 'Cebu'},
        {'locationId': 'location_31c', 'fishId': 'fish_31', 'latitude': 9.7604, 'longitude': 118.7282, 'region': 'Palawan'},
        
        // fish_32 (Damselfish) - Butuan, Surigao, Leyte
        {'locationId': 'location_32', 'fishId': 'fish_32', 'latitude': 8.9475, 'longitude': 125.5406, 'region': 'Butuan'},
        {'locationId': 'location_32b', 'fishId': 'fish_32', 'latitude': 9.7883, 'longitude': 125.5040, 'region': 'Surigao'},
        {'locationId': 'location_32c', 'fishId': 'fish_32', 'latitude': 10.7202, 'longitude': 124.7521, 'region': 'Leyte'},
        
        // fish_33 (Wrasse) - Tandag, Surigao, Siargao
        {'locationId': 'location_33', 'fishId': 'fish_33', 'latitude': 9.0781, 'longitude': 126.1959, 'region': 'Tandag'},
        {'locationId': 'location_33b', 'fishId': 'fish_33', 'latitude': 9.7883, 'longitude': 125.5040, 'region': 'Surigao'},
        {'locationId': 'location_33c', 'fishId': 'fish_33', 'latitude': 9.8599, 'longitude': 126.0459, 'region': 'Siargao'},
        
        // fish_34 (Parrotfish) - Cotabato, Davao Gulf, General Santos
        {'locationId': 'location_34', 'fishId': 'fish_34', 'latitude': 7.2004, 'longitude': 124.2452, 'region': 'Cotabato'},
        {'locationId': 'location_34b', 'fishId': 'fish_34', 'latitude': 6.5000, 'longitude': 125.5000, 'region': 'Davao Gulf'},
        {'locationId': 'location_34c', 'fishId': 'fish_34', 'latitude': 6.1115, 'longitude': 125.1915, 'region': 'General Santos'},
        
        // fish_35 (Sweetlip) - Maguindanao, Zamboanga, Basilan
        {'locationId': 'location_35', 'fishId': 'fish_35', 'latitude': 6.9463, 'longitude': 124.4086, 'region': 'Maguindanao'},
        {'locationId': 'location_35b', 'fishId': 'fish_35', 'latitude': 6.9271, 'longitude': 122.0725, 'region': 'Zamboanga'},
        {'locationId': 'location_35c', 'fishId': 'fish_35', 'latitude': 6.5389, 'longitude': 121.9733, 'region': 'Basilan'},
        
        // fish_36 (Barracuda) - Cotabato City, Zamboanga, Davao
        {'locationId': 'location_36', 'fishId': 'fish_36', 'latitude': 7.2004, 'longitude': 124.2452, 'region': 'Cotabato City'},
        {'locationId': 'location_36b', 'fishId': 'fish_36', 'latitude': 6.9271, 'longitude': 122.0725, 'region': 'Zamboanga'},
        {'locationId': 'location_36c', 'fishId': 'fish_36', 'latitude': 6.9271, 'longitude': 125.4092, 'region': 'Davao'},
        
        // fish_37 (Jack) - Bislig, Hinatuan, Tandag
        {'locationId': 'location_37', 'fishId': 'fish_37', 'latitude': 8.2111, 'longitude': 126.3214, 'region': 'Bislig'},
        {'locationId': 'location_37b', 'fishId': 'fish_37', 'latitude': 8.3795, 'longitude': 126.3558, 'region': 'Hinatuan'},
        {'locationId': 'location_37c', 'fishId': 'fish_37', 'latitude': 9.0781, 'longitude': 126.1959, 'region': 'Tandag'},
        
        // fish_38 (Asian Seabass/Barramundi) - Bunawan, Agusan, Butuan
        {'locationId': 'location_38', 'fishId': 'fish_38', 'latitude': 8.1344, 'longitude': 126.0455, 'region': 'Bunawan'},
        {'locationId': 'location_38b', 'fishId': 'fish_38', 'latitude': 8.9475, 'longitude': 125.5406, 'region': 'Agusan River'},
        {'locationId': 'location_38c', 'fishId': 'fish_38', 'latitude': 8.9475, 'longitude': 125.5406, 'region': 'Butuan Bay'},
        
        // fish_39 (Eel) - Tandag Bay, Laguna, Mindoro
        {'locationId': 'location_39', 'fishId': 'fish_39', 'latitude': 9.0781, 'longitude': 126.1959, 'region': 'Tandag Bay'},
        {'locationId': 'location_39b', 'fishId': 'fish_39', 'latitude': 14.3127, 'longitude': 121.1978, 'region': 'Laguna'},
        {'locationId': 'location_39c', 'fishId': 'fish_39', 'latitude': 13.1939, 'longitude': 121.2058, 'region': 'Mindoro'},
        
        // fish_40 (Halfbeak) - Southern Leyte, Surigao, Bohol
        {'locationId': 'location_40', 'fishId': 'fish_40', 'latitude': 10.3333, 'longitude': 125.1667, 'region': 'Southern Leyte'},
        {'locationId': 'location_40b', 'fishId': 'fish_40', 'latitude': 9.7883, 'longitude': 125.5040, 'region': 'Surigao'},
        {'locationId': 'location_40c', 'fishId': 'fish_40', 'latitude': 9.8499, 'longitude': 124.1435, 'region': 'Bohol'},
        
        // fish_41 (Needlefish) - Panay, Aklan, Antique
        {'locationId': 'location_41', 'fishId': 'fish_41', 'latitude': 11.5564, 'longitude': 122.5136, 'region': 'Panay'},
        {'locationId': 'location_41b', 'fishId': 'fish_41', 'latitude': 11.6901, 'longitude': 122.0001, 'region': 'Aklan'},
        {'locationId': 'location_41c', 'fishId': 'fish_41', 'latitude': 11.0333, 'longitude': 122.0000, 'region': 'Antique'},
        // fish_42 (Flying Fish) – open coastal waters
        {'locationId': 'location_42',  'fishId': 'fish_42', 'latitude': 13.5000, 'longitude': 123.0000, 'region': 'Philippine Sea off Bicol'},
        {'locationId': 'location_42b', 'fishId': 'fish_42', 'latitude': 10.5000, 'longitude': 124.5000, 'region': 'Visayan Sea'},
        {'locationId': 'location_42c', 'fishId': 'fish_42', 'latitude': 8.5000,  'longitude': 126.0000, 'region': 'Offshore Surigao / Pacific side'},
        // fish_43 (Seahorse) – seagrass & reef areas
        {'locationId': 'location_43',  'fishId': 'fish_43', 'latitude': 9.5810,  'longitude': 123.7578, 'region': 'Panglao, Bohol'},
        {'locationId': 'location_43b', 'fishId': 'fish_43', 'latitude': 11.1949, 'longitude': 119.4010, 'region': 'El Nido, Palawan'},
        {'locationId': 'location_43c', 'fishId': 'fish_43', 'latitude': 9.9274,  'longitude': 123.3950, 'region': 'Moalboal, Cebu'},

        // fish_44 (Sea Dragon) – similar sheltered reef habitats
        {'locationId': 'location_44',  'fishId': 'fish_44', 'latitude': 9.8509,  'longitude': 123.4197, 'region': 'Sipalay, Negros'},
        {'locationId': 'location_44b', 'fishId': 'fish_44', 'latitude': 11.9990, 'longitude': 120.2050, 'region': 'Coron, Palawan'},
        {'locationId': 'location_44c', 'fishId': 'fish_44', 'latitude': 9.3031,  'longitude': 123.3056, 'region': 'Oslob, Cebu'},

        // fish_45 (Pufferfish) – coral reef zones
        {'locationId': 'location_45',  'fishId': 'fish_45', 'latitude': 9.0442,  'longitude': 123.2925, 'region': 'Apo Island, Negros'},
        {'locationId': 'location_45b', 'fishId': 'fish_45', 'latitude': 10.3157, 'longitude': 123.8854, 'region': 'Cebu Reefs'},
        {'locationId': 'location_45c', 'fishId': 'fish_45', 'latitude': 11.9673, 'longitude': 121.9247, 'region': 'Boracay, Aklan'},

        // fish_46 (Porcupinefish) – outer reef slopes
        {'locationId': 'location_46',  'fishId': 'fish_46', 'latitude': 9.7604,  'longitude': 118.7282, 'region': 'Puerto Princesa, Palawan'},
        {'locationId': 'location_46b', 'fishId': 'fish_46', 'latitude': 10.1964, 'longitude': 123.7618, 'region': 'Camotes Sea'},
        {'locationId': 'location_46c', 'fishId': 'location_46c', 'latitude': 11.2000, 'longitude': 125.0050, 'region': 'Southern Leyte Reefs'},

        // fish_47 (Boxfish) – lagoon and reef flats
        {'locationId': 'location_47',  'fishId': 'fish_47', 'latitude': 9.8499,  'longitude': 124.1435, 'region': 'Bohol Reefs'},
        {'locationId': 'location_47b', 'fishId': 'fish_47', 'latitude': 11.5564, 'longitude': 122.5136, 'region': 'Panay Reefs'},
        {'locationId': 'location_47c', 'fishId': 'fish_47', 'latitude': 5.9788,  'longitude': 126.0245, 'region': 'Davao Oriental Reefs'},

        // fish_48 (Pomfret) – deeper coastal waters
        {'locationId': 'location_48',  'fishId': 'fish_48', 'latitude': 10.7202, 'longitude': 124.7521, 'region': 'Leyte Gulf'},
        {'locationId': 'location_48b', 'fishId': 'fish_48', 'latitude': 11.5799, 'longitude': 125.0060, 'region': 'Samar Sea'},
        {'locationId': 'location_48c', 'fishId': 'fish_48', 'latitude': 15.5082, 'longitude': 119.9692, 'region': 'West Philippine Sea off Zambales'},

        // fish_49 (Ribbonfish) – offshore shelf areas
        {'locationId': 'location_49',  'fishId': 'fish_49', 'latitude': 13.0833, 'longitude': 120.5333, 'region': 'Occidental Mindoro Shelf'},
        {'locationId': 'location_49b', 'fishId': 'fish_49', 'latitude': 16.0433, 'longitude': 120.3333, 'region': 'Lingayen Gulf Offshore'},
        {'locationId': 'location_49c', 'fishId': 'fish_49', 'latitude': 6.5000,  'longitude': 125.5000, 'region': 'Davao Gulf Slope'},

        // fish_50 (Spotted Scat/Kitang) – brackish estuaries
        {'locationId': 'location_50',  'fishId': 'fish_50', 'latitude': 14.3127, 'longitude': 121.1978, 'region': 'Laguna de Bay River Mouths'},
        {'locationId': 'location_50b', 'fishId': 'fish_50', 'latitude': 14.5994, 'longitude': 120.9842, 'region': 'Manila Bay Estuaries'},
        {'locationId': 'location_50c', 'fishId': 'fish_50', 'latitude': 9.7457,  'longitude': 118.7302, 'region': 'Puerto Princesa Bay Mangroves'},
      ];


      for (var location in mapData) {
        await _db.child('map').child(location['locationId']).set(location);
      }
      print('✅ Map locations initialized successfully (with extra locations)');
    } catch (e) {
      print('❌ Error initializing map locations: $e');
    }
  }

  // Initialize all data
  Future<void> initializeAllData() async {
    await initializeFish();
    await initializeMapLocations();
    print('✅ All data initialization complete');
  }
}
