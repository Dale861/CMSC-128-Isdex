import 'package:firebase_database/firebase_database.dart';

class DatabaseInitService {
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  // Initialize structure with dummy records
  Future<void> initializeStructure() async {
    try {
      // Users collection
      await _db.child('users').child('user_placeholder').set({
        'userId': 'user_placeholder',
        'username': 'placeholder_user',
        'email': 'placeholder@example.com',
        'role': 'user',
      });

      // Searches collection  
      await _db.child('searches').child('search_placeholder').set({
        'searchId': 'search_placeholder',
        'userId': 'user_placeholder',
        'fishId': 'fish_1',
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });

      // Posts collection
      await _db.child('posts').child('post_placeholder').set({
        'postId': 'post_placeholder',
        'userId': 'user_placeholder',
        'likes': 0,
        'views': 0,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });

      print('✅ Collections created with placeholder data');
    } catch (e) {
      print('❌ Error initializing structure: $e');
    }
  }

  // Initialize Fish - 50 Philippine Fish (with LOCAL image paths)
  Future<void> initializeFish() async {
    try {
      List<Map<String, dynamic>> fishData = [
        {'fishId': 'fish_1', 'commonName': 'Yellowfin Tuna', 'scientificName': 'Thunnus albacares', 'localName': 'Tambakol', 'habitat': 'Saltwater', 'information': 'Blue back, yellow sides, size 100-150cm', 'imageUrl': 'assets/images/fish/fish (1).png'},
        {'fishId': 'fish_2', 'commonName': 'Gray Snapper', 'scientificName': 'Lutjanus griseus', 'localName': 'Maya-maya', 'habitat': 'Saltwater', 'information': 'Gray body, size 25-40cm', 'imageUrl': 'assets/images/fish/fish (2).png'},
        {'fishId': 'fish_3', 'commonName': 'Goldstripe Sardinella', 'scientificName': 'Hyperlophus vittatus', 'localName': 'Sardinella', 'habitat': 'Saltwater', 'information': 'Silver with gold stripe, size 15-20cm', 'imageUrl': 'assets/images/fish/fish (3).png'},
        {'fishId': 'fish_4', 'commonName': 'Long-jawed Mackerel', 'scientificName': 'Rastrelliger kanagurta', 'localName': 'Alumahan', 'habitat': 'Saltwater', 'information': 'Blue-green back, silver belly, size 30-35cm', 'imageUrl': 'assets/images/fish/fish (4).png'},
        {'fishId': 'fish_5', 'commonName': 'Mackerel Scad', 'scientificName': 'Decapterus sp', 'localName': 'Galunggong', 'habitat': 'Saltwater', 'information': 'Silver body, forked tail, size 20-25cm', 'imageUrl': 'assets/images/fish/fish (5).png'},
        {'fishId': 'fish_6', 'commonName': 'Threadfin Bream', 'scientificName': 'Nemipterus japonicus', 'localName': 'Bisugo', 'habitat': 'Saltwater', 'information': 'Pink-red coloring, size 20-25cm', 'imageUrl': 'assets/images/fish/fish (6).png'},
        {'fishId': 'fish_7', 'commonName': 'Leopard Coral Grouper', 'scientificName': 'Epinephelus sp', 'localName': 'Lapu-lapu', 'habitat': 'Saltwater', 'information': 'Orange-red with white streaks, size 40-60cm', 'imageUrl': 'assets/images/fish/fish (7).png'},
        {'fishId': 'fish_8', 'commonName': 'Nile Tilapia', 'scientificName': 'Oreochromis niloticus', 'localName': 'Tilapia', 'habitat': 'Freshwater', 'information': 'Golden coloring, size 20-30cm', 'imageUrl': 'assets/images/fish/fish (8).png'},
        {'fishId': 'fish_9', 'commonName': 'Milkfish', 'scientificName': 'Chanos chanos', 'localName': 'Bangus', 'habitat': 'Saltwater/Freshwater', 'information': 'Silver body, size 30-40cm', 'imageUrl': 'assets/images/fish/fish (9).png'},
        {'fishId': 'fish_10', 'commonName': 'Striped Snakehead', 'scientificName': 'Channa striata', 'localName': 'Dalag', 'habitat': 'Freshwater', 'information': 'Striped pattern, size 30-45cm', 'imageUrl': 'assets/images/fish/fish (10).png'},
        {'fishId': 'fish_11', 'commonName': 'Common Carp', 'scientificName': 'Cyprinus carpio', 'localName': 'Carp', 'habitat': 'Freshwater', 'information': 'Brown-gold coloring, size 40-60cm', 'imageUrl': 'assets/images/fish/fish (11).png'},
        {'fishId': 'fish_12', 'commonName': 'Asian Catfish', 'scientificName': 'Clarias batrachus', 'localName': 'Catfish', 'habitat': 'Freshwater', 'information': 'Dark body, whiskers, size 25-35cm', 'imageUrl': 'assets/images/fish/fish (12).png'},
        {'fishId': 'fish_13', 'commonName': 'Manila Catfish', 'scientificName': 'Arius manillensis', 'localName': 'Kanduli', 'habitat': 'Freshwater', 'information': 'Dark body, large pectoral spines, size 20-30cm', 'imageUrl': 'assets/images/fish/fish (13).png'},
        {'fishId': 'fish_14', 'commonName': 'White Goby', 'scientificName': 'Glossogobius giuris', 'localName': 'Puting biya', 'habitat': 'Freshwater', 'information': 'White-gray body, size 10-15cm', 'imageUrl': 'assets/images/fish/fish (14).png'},
        {'fishId': 'fish_15', 'commonName': 'Silver Perch', 'scientificName': 'Leiopotherapon plumbeus', 'localName': 'Ayuñgin', 'habitat': 'Freshwater', 'information': 'Silver body, size 15-20cm', 'imageUrl': 'assets/images/fish/fish (15).png'},
        {'fishId': 'fish_16', 'commonName': 'Giant Gourami', 'scientificName': 'Osphronemus goramy', 'localName': 'Gourami', 'habitat': 'Freshwater', 'information': 'Large, robust body, size 50-60cm', 'imageUrl': 'assets/images/fish/fish (16).png'},
        {'fishId': 'fish_17', 'commonName': 'Mudfish', 'scientificName': 'Oxyeleotris marmoratus', 'localName': 'Mudfish', 'habitat': 'Freshwater', 'information': 'Dark body, size 30-40cm', 'imageUrl': 'assets/images/fish/fish (17).png'},
        {'fishId': 'fish_18', 'commonName': 'Climbing Perch', 'scientificName': 'Anabas testudineus', 'localName': 'Climbing Perch', 'habitat': 'Freshwater', 'information': 'Brown body, can breathe air, size 20-25cm', 'imageUrl': 'assets/images/fish/fish (18).png'},
        {'fishId': 'fish_19', 'commonName': 'Trevally', 'scientificName': 'Carangidae spp', 'localName': 'Trevally', 'habitat': 'Saltwater', 'information': 'Silver body, size 30-50cm', 'imageUrl': 'assets/images/fish/fish (19).png'},
        {'fishId': 'fish_20', 'commonName': 'Grouper', 'scientificName': 'Serranidae spp', 'localName': 'Grouper', 'habitat': 'Saltwater', 'information': 'Various colors, size 40-80cm', 'imageUrl': 'assets/images/fish/fish (20).png'},
        {'fishId': 'fish_21', 'commonName': 'Red Snapper', 'scientificName': 'Lutjanidae spp', 'localName': 'Snapper', 'habitat': 'Saltwater', 'information': 'Red-pink body, size 25-40cm', 'imageUrl': 'assets/images/fish/fish (21).png'},
        {'fishId': 'fish_22', 'commonName': 'Goatfish', 'scientificName': 'Mullidae spp', 'localName': 'Goatfish', 'habitat': 'Saltwater', 'information': 'Yellow-red body, barbels, size 20-30cm', 'imageUrl': 'assets/images/fish/fish (22).png'},
        {'fishId': 'fish_23', 'commonName': 'Emperor', 'scientificName': 'Lethrinus lentjan', 'localName': 'Bitilya', 'habitat': 'Saltwater', 'information': 'Blue-green back, size 35-50cm', 'imageUrl': 'assets/images/fish/fish (23).png'},
        {'fishId': 'fish_24', 'commonName': 'Indo-Pacific Tarpon', 'scientificName': 'Megalops cyprinoides', 'localName': 'Buan-buan', 'habitat': 'Saltwater', 'information': 'Large silver body, size 80-100cm', 'imageUrl': 'assets/images/fish/fish (24).png'},
        {'fishId': 'fish_25', 'commonName': 'Dolphinfish', 'scientificName': 'Coryphaena hippurus', 'localName': 'Dorado', 'habitat': 'Saltwater', 'information': 'Golden-green coloring, size 50-80cm', 'imageUrl': 'assets/images/fish/fish (25).png'},
        {'fishId': 'fish_26', 'commonName': 'Threadfin Salmon', 'scientificName': 'Eleutheronema tetradactylum', 'localName': 'Salmon', 'habitat': 'Saltwater', 'information': 'Silver body, size 80-120cm', 'imageUrl': 'assets/images/fish/fish (26).png'},
        {'fishId': 'fish_27', 'commonName': 'Red Bigeye', 'scientificName': 'Priacanthus macracanthus', 'localName': 'Dilat', 'habitat': 'Saltwater', 'information': 'Red body, large eyes, size 15-20cm', 'imageUrl': 'assets/images/fish/fish (27).png'},
        {'fishId': 'fish_28', 'commonName': 'Moonfish', 'scientificName': 'Mene maculata', 'localName': 'Chabeta', 'habitat': 'Saltwater', 'information': 'Disc-shaped, silver body, size 15-20cm', 'imageUrl': 'assets/images/fish/fish (28).png'},
        {'fishId': 'fish_29', 'commonName': 'Rabbit Fish', 'scientificName': 'Siganus sp', 'localName': 'Rabbit Fish', 'habitat': 'Saltwater', 'information': 'Brown-green body, size 25-30cm', 'imageUrl': 'assets/images/fish/fish (29).png'},
        {'fishId': 'fish_30', 'commonName': 'Surgeonfish', 'scientificName': 'Acanthurus sp', 'localName': 'Surgeonfish', 'habitat': 'Saltwater', 'information': 'Colorful body, sharp spines, size 20-30cm', 'imageUrl': 'assets/images/fish/fish (30).png'},
        {'fishId': 'fish_31', 'commonName': 'Butterflyfish', 'scientificName': 'Chaetodon sp', 'localName': 'Butterflyfish', 'habitat': 'Saltwater', 'information': 'Colorful patterned body, size 15-20cm', 'imageUrl': 'assets/images/fish/fish (31).png'},
        {'fishId': 'fish_32', 'commonName': 'Damselfish', 'scientificName': 'Pomacentridae sp', 'localName': 'Damselfish', 'habitat': 'Saltwater', 'information': 'Bright colored, size 10-15cm', 'imageUrl': 'assets/images/fish/fish (32).png'},
        {'fishId': 'fish_33', 'commonName': 'Wrasse', 'scientificName': 'Labridae sp', 'localName': 'Wrasse', 'habitat': 'Saltwater', 'information': 'Colorful body, size 20-30cm', 'imageUrl': 'assets/images/fish/fish (33).png'},
        {'fishId': 'fish_34', 'commonName': 'Parrotfish', 'scientificName': 'Scaridae sp', 'localName': 'Parrotfish', 'habitat': 'Saltwater', 'information': 'Colorful body, beak-like mouth, size 25-35cm', 'imageUrl': 'assets/images/fish/fish (34).png'},
        {'fishId': 'fish_35', 'commonName': 'Sweetlip', 'scientificName': 'Haemulidae sp', 'localName': 'Sweetlip', 'habitat': 'Saltwater', 'information': 'Striped pattern, size 30-40cm', 'imageUrl': 'assets/images/fish/fish (35).png'},
        {'fishId': 'fish_36', 'commonName': 'Barracuda', 'scientificName': 'Sphyraena sp', 'localName': 'Barracuda', 'habitat': 'Saltwater', 'information': 'Elongated body, sharp teeth, size 50-80cm', 'imageUrl': 'assets/images/fish/fish (36).png'},
        {'fishId': 'fish_37', 'commonName': 'Jack', 'scientificName': 'Caranx sp', 'localName': 'Jack', 'habitat': 'Saltwater', 'information': 'Silver body, size 30-50cm', 'imageUrl': 'assets/images/fish/fish (37).png'},
        {'fishId': 'fish_38', 'commonName': 'Asian Seabass', 'scientificName': 'Lates calcarifer', 'localName': 'Barramundi', 'habitat': 'Saltwater/Freshwater', 'information': 'Silver body, large scales, size 60-100cm', 'imageUrl': 'assets/images/fish/fish (38).png'},
        {'fishId': 'fish_39', 'commonName': 'Eel', 'scientificName': 'Anguilla sp', 'localName': 'Eel', 'habitat': 'Freshwater/Saltwater', 'information': 'Long snake-like body, size 60-100cm', 'imageUrl': 'assets/images/fish/fish (39).png'},
        {'fishId': 'fish_40', 'commonName': 'Halfbeak', 'scientificName': 'Hemirhamphus sp', 'localName': 'Halfbeak', 'habitat': 'Saltwater', 'information': 'Silver body, half-long snout, size 20-25cm', 'imageUrl': 'assets/images/fish/fish (40).png'},
        {'fishId': 'fish_41', 'commonName': 'Needlefish', 'scientificName': 'Belonidae sp', 'localName': 'Needlefish', 'habitat': 'Saltwater', 'information': 'Elongated needle-like body, size 30-40cm', 'imageUrl': 'assets/images/fish/fish (41).png'},
        {'fishId': 'fish_42', 'commonName': 'Flying Fish', 'scientificName': 'Exocoetus sp', 'localName': 'Flying Fish', 'habitat': 'Saltwater', 'information': 'Can glide above water, size 20-30cm', 'imageUrl': 'assets/images/fish/fish (42).png'},
        {'fishId': 'fish_43', 'commonName': 'Seahorse', 'scientificName': 'Syngnathidae sp', 'localName': 'Seahorse', 'habitat': 'Saltwater', 'information': 'Horse-like head, prehensile tail, size 10-15cm', 'imageUrl': 'assets/images/fish/fish (43).png'},
        {'fishId': 'fish_44', 'commonName': 'Sea Dragon', 'scientificName': 'Hippocampus sp', 'localName': 'Sea Dragon', 'habitat': 'Saltwater', 'information': 'Leaf-like appendages, size 15-20cm', 'imageUrl': 'assets/images/fish/fish (44).png'},
        {'fishId': 'fish_45', 'commonName': 'Pufferfish', 'scientificName': 'Tetraodontidae sp', 'localName': 'Pufferfish', 'habitat': 'Saltwater', 'information': 'Can inflate body, toxic, size 10-20cm', 'imageUrl': 'assets/images/fish/fish (45).png'},
        {'fishId': 'fish_46', 'commonName': 'Porcupinefish', 'scientificName': 'Diodon sp', 'localName': 'Porcupinefish', 'habitat': 'Saltwater', 'information': 'Spines on body, size 20-30cm', 'imageUrl': 'assets/images/fish/fish (46).png'},
        {'fishId': 'fish_47', 'commonName': 'Boxfish', 'scientificName': 'Ostraciidae sp', 'localName': 'Boxfish', 'habitat': 'Saltwater', 'information': 'Cube-shaped body, size 10-20cm', 'imageUrl': 'assets/images/fish/fish (47).png'},
        {'fishId': 'fish_48', 'commonName': 'Pomfret', 'scientificName': 'Stromateidae sp', 'localName': 'Pomfret', 'habitat': 'Saltwater', 'information': 'Flat, disc-shaped, size 20-30cm', 'imageUrl': 'assets/images/fish/fish (48).png'},
        {'fishId': 'fish_49', 'commonName': 'Ribbonfish', 'scientificName': 'Trichiuridae sp', 'localName': 'Ribbonfish', 'habitat': 'Saltwater', 'information': 'Long ribbon-like body, size 100-150cm', 'imageUrl': 'assets/images/fish/fish (49).png'},
        {'fishId': 'fish_50', 'commonName': 'Spotted Scat', 'scientificName': 'Scatophagus argus', 'localName': 'Kitang', 'habitat': 'Brackish Water', 'information': 'Silver-bronze with black spots, size 15-20cm', 'imageUrl': 'assets/images/fish/fish (50).png'},
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
      List<Map<String, dynamic>> mapData = [
        {'locationId': 'location_1', 'fishId': 'fish_1', 'latitude': 6.0765, 'longitude': 125.6306, 'region': 'Sarangani'},
        {'locationId': 'location_2', 'fishId': 'fish_2', 'latitude': 14.5994, 'longitude': 120.9842, 'region': 'Manila Bay'},
        {'locationId': 'location_3', 'fishId': 'fish_3', 'latitude': 14.6667, 'longitude': 120.8333, 'region': 'Navotas'},
        {'locationId': 'location_4', 'fishId': 'fish_4', 'latitude': 10.3157, 'longitude': 123.8854, 'region': 'Visayas'},
        {'locationId': 'location_5', 'fishId': 'fish_5', 'latitude': 9.5381, 'longitude': 118.7399, 'region': 'Palawan'},
        {'locationId': 'location_6', 'fishId': 'fish_6', 'latitude': 7.0731, 'longitude': 125.6114, 'region': 'Mindanao'},
        {'locationId': 'location_7', 'fishId': 'fish_7', 'latitude': 9.7604, 'longitude': 118.7282, 'region': 'Palawan'},
        {'locationId': 'location_8', 'fishId': 'fish_8', 'latitude': 14.3127, 'longitude': 121.1978, 'region': 'Laguna de Bay'},
        {'locationId': 'location_9', 'fishId': 'fish_9', 'latitude': 13.9781, 'longitude': 120.9881, 'region': 'Lake Taal'},
        {'locationId': 'location_10', 'fishId': 'fish_10', 'latitude': 14.8791, 'longitude': 120.5596, 'region': 'Pampanga'},
        {'locationId': 'location_11', 'fishId': 'fish_11', 'latitude': 12.8797, 'longitude': 121.7740, 'region': 'Central Philippines'},
        {'locationId': 'location_12', 'fishId': 'fish_12', 'latitude': 11.9673, 'longitude': 121.9247, 'region': 'Boracay'},
        {'locationId': 'location_13', 'fishId': 'fish_13', 'latitude': 10.6919, 'longitude': 122.5675, 'region': 'Iloilo'},
        {'locationId': 'location_14', 'fishId': 'fish_14', 'latitude': 9.0442, 'longitude': 123.2925, 'region': 'Apo Island'},
        {'locationId': 'location_15', 'fishId': 'fish_15', 'latitude': 9.2081, 'longitude': 123.5241, 'region': 'Siquijor'},
        {'locationId': 'location_16', 'fishId': 'fish_16', 'latitude': 9.7604, 'longitude': 118.7282, 'region': 'Puerto Princesa'},
        {'locationId': 'location_17', 'fishId': 'fish_17', 'latitude': 13.1939, 'longitude': 121.2058, 'region': 'Mindoro'},
        {'locationId': 'location_18', 'fishId': 'fish_18', 'latitude': 13.4166, 'longitude': 122.0167, 'region': 'Marinduque'},
        {'locationId': 'location_19', 'fishId': 'fish_19', 'latitude': 14.7505, 'longitude': 121.9475, 'region': 'Quezon'},
        {'locationId': 'location_20', 'fishId': 'fish_20', 'latitude': 11.6901, 'longitude': 122.0001, 'region': 'Aklan'},
        {'locationId': 'location_21', 'fishId': 'fish_21', 'latitude': 6.9271, 'longitude': 125.4092, 'region': 'Davao'},
        {'locationId': 'location_22', 'fishId': 'fish_22', 'latitude': 6.1115, 'longitude': 125.1915, 'region': 'General Santos'},
        {'locationId': 'location_23', 'fishId': 'fish_23', 'latitude': 6.9271, 'longitude': 122.0725, 'region': 'Zamboanga'},
        {'locationId': 'location_24', 'fishId': 'fish_24', 'latitude': 9.7604, 'longitude': 118.7282, 'region': 'Coron'},
        {'locationId': 'location_25', 'fishId': 'fish_25', 'latitude': 9.8509, 'longitude': 123.4197, 'region': 'Sipalay'},
        {'locationId': 'location_26', 'fishId': 'fish_26', 'latitude': 9.6833, 'longitude': 125.4667, 'region': 'Dinagat'},
        {'locationId': 'location_27', 'fishId': 'fish_27', 'latitude': 9.9274, 'longitude': 123.3950, 'region': 'Moalboal'},
        {'locationId': 'location_28', 'fishId': 'fish_28', 'latitude': 9.7883, 'longitude': 125.5040, 'region': 'Surigao'},
        {'locationId': 'location_29', 'fishId': 'fish_29', 'latitude': 10.7202, 'longitude': 124.7521, 'region': 'Leyte'},
        {'locationId': 'location_30', 'fishId': 'fish_30', 'latitude': 10.3157, 'longitude': 123.8854, 'region': 'Cebu'},
        {'locationId': 'location_31', 'fishId': 'fish_31', 'latitude': 8.7380, 'longitude': 123.7380, 'region': 'Bohol'},
        {'locationId': 'location_32', 'fishId': 'fish_32', 'latitude': 7.9674, 'longitude': 124.5067, 'region': 'Butuan'},
        {'locationId': 'location_33', 'fishId': 'fish_33', 'latitude': 8.9449, 'longitude': 126.0121, 'region': 'Tandag'},
        {'locationId': 'location_34', 'fishId': 'fish_34', 'latitude': 5.9788, 'longitude': 126.0245, 'region': 'Cotabato'},
        {'locationId': 'location_35', 'fishId': 'fish_35', 'latitude': 6.5244, 'longitude': 124.2118, 'region': 'Maguindanao'},
        {'locationId': 'location_36', 'fishId': 'fish_36', 'latitude': 7.4632, 'longitude': 125.7621, 'region': 'Cotabato City'},
        {'locationId': 'location_37', 'fishId': 'fish_37', 'latitude': 8.4606, 'longitude': 124.6348, 'region': 'Bislig'},
        {'locationId': 'location_38', 'fishId': 'fish_38', 'latitude': 9.3100, 'longitude': 124.2133, 'region': 'Bunawan'},
        {'locationId': 'location_39', 'fishId': 'fish_39', 'latitude': 10.3944, 'longitude': 125.5885, 'region': 'Tandag Bay'},
        {'locationId': 'location_40', 'fishId': 'fish_40', 'latitude': 11.2000, 'longitude': 125.0050, 'region': 'Southern Leyte'},
        {'locationId': 'location_41', 'fishId': 'fish_41', 'latitude': 11.9673, 'longitude': 121.9247, 'region': 'Panay'},
        {'locationId': 'location_42', 'fishId': 'fish_42', 'latitude': 10.1964, 'longitude': 123.7618, 'region': 'Camotes'},
        {'locationId': 'location_43', 'fishId': 'fish_43', 'latitude': 10.2968, 'longitude': 124.0136, 'region': 'Dumaguete'},
        {'locationId': 'location_44', 'fishId': 'fish_44', 'latitude': 9.3031, 'longitude': 123.3056, 'region': 'Oslob'},
        {'locationId': 'location_45', 'fishId': 'fish_45', 'latitude': 8.3752, 'longitude': 123.7580, 'region': 'Tagbilaran'},
        {'locationId': 'location_46', 'fishId': 'fish_46', 'latitude': 8.1441, 'longitude': 124.2463, 'region': 'Calinog'},
        {'locationId': 'location_47', 'fishId': 'fish_47', 'latitude': 7.1964, 'longitude': 125.1918, 'region': 'Mati'},
        {'locationId': 'location_48', 'fishId': 'fish_48', 'latitude': 6.5500, 'longitude': 124.8000, 'region': 'Dadiangas'},
        {'locationId': 'location_49', 'fishId': 'fish_49', 'latitude': 5.9788, 'longitude': 126.0245, 'region': 'Cotabato Bay'},
        {'locationId': 'location_50', 'fishId': 'fish_50', 'latitude': 9.7457, 'longitude': 118.7302, 'region': 'Puerto Princesa Bay'},
      ];

      for (var location in mapData) {
        await _db.child('map').child(location['locationId']).set(location);
      }
      print('✅ 50 Map locations initialized successfully');
    } catch (e) {
      print('❌ Error initializing map locations: $e');
    }
  }

  // Initialize all data
  Future<void> initializeAllData() async {
    await initializeStructure();
    await initializeFish();
    await initializeMapLocations();
  }
}
