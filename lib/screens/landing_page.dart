import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'map_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final DatabaseReference _db = FirebaseDatabase.instance.ref();
  List<Map<dynamic, dynamic>> filteredSpecies = [];
  List<Map<dynamic, dynamic>> allSpecies = [];
  TextEditingController searchController = TextEditingController();
  String selectedHabitat = 'All';
  List<String> habitats = ['All', 'Saltwater', 'Freshwater', 'Brackish Water'];

  @override
  void initState() {
    super.initState();
    _loadSpecies();
    searchController.addListener(_filterSpecies);
  }

  void _loadSpecies() {
    _db.child('species').onValue.listen((event) {
      List<Map<dynamic, dynamic>> species = [];
      
      if (event.snapshot.exists) {
        Map<dynamic, dynamic> speciesMap = event.snapshot.value as Map;
        speciesMap.forEach((key, value) {
          species.add(Map<dynamic, dynamic>.from(value));
        });
      }
      
      setState(() {
        allSpecies = species;
        _filterSpecies();
      });
    });
  }

  void _filterSpecies() {
    String searchText = searchController.text.toLowerCase();
    
    setState(() {
      filteredSpecies = allSpecies.where((fish) {
        bool matchesSearch = fish['commonName']
                .toString()
                .toLowerCase()
                .contains(searchText) ||
            fish['localName']
                .toString()
                .toLowerCase()
                .contains(searchText) ||
            fish['scientificName']
                .toString()
                .toLowerCase()
                .contains(searchText);
        
        bool matchesHabitat = selectedHabitat == 'All' ||
            fish['habitat'].toString() == selectedHabitat;
        
        return matchesSearch && matchesHabitat;
      }).toList();
    });
  }

  void _showFishDetails(Map<dynamic, dynamic> fish) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
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
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.image_outlined, size: 40, color: Colors.grey),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fish['commonName'] ?? 'Unknown',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          fish['scientificName'] ?? '',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildDetailItem('Local Name', fish['localName'] ?? 'N/A'),
              _buildDetailItem('Habitat', fish['habitat'] ?? 'N/A'),
              _buildDetailItem('Features', fish['features'] ?? 'N/A'),
              _buildDetailItem('Size Range', '${fish['features'] ?? 'N/A'}'),
              _buildDetailItem(
                'Conservation Status',
                fish['conservationStatus'] ?? 'N/A',
              ),
              _buildDetailItem(
                'Seasonality',
                fish['seasonality'] ?? 'N/A',
              ),
              _buildDetailItem('Region', fish['region'] ?? 'N/A'),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    'Close',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Image.asset(
      'assets/images/isdex_logo.png', // Change filename if needed
      height: 40,
      width: 40,
      fit: BoxFit.contain,
    ),
    ElevatedButton(
      onPressed: () {
        // TODO: Navigate to login
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.person, color: Colors.blue),
          SizedBox(width: 4),
          Text(
            'Log in/Sign up',
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    ),
  ],
),

                  SizedBox(height: 16),
                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search Species',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  // Filter Button Row
                  Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: habitats.map((habitat) {
                              return Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: FilterChip(
                                  label: Text(habitat),
                                  selected: selectedHabitat == habitat,
                                  onSelected: (selected) {
                                    setState(() {
                                      selectedHabitat = habitat;
                                    });
                                    _filterSpecies();
                                  },
                                  backgroundColor: Colors.white,
                                  selectedColor: Colors.blue[100],
                                  side: BorderSide(
                                    color: selectedHabitat == habitat
                                        ? Colors.blue
                                        : Colors.grey[300]!,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Species List
            Expanded(
              child: filteredSpecies.isEmpty
                  ? Center(
                      child: Text(
                        'No species found',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: filteredSpecies.length,
                      itemBuilder: (context, index) {
                        var fish = filteredSpecies[index];
                        return GestureDetector(
                          onTap: () => _showFishDetails(fish),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 12),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[200]!,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.image_outlined,
                                  size: 50,
                                  color: Colors.grey[300],
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        fish['commonName'] ?? 'Unknown',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        fish['scientificName'] ?? '',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        fish['habitat'] ?? 'Unknown',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(Icons.chevron_right,
                                    color: Colors.grey[400]),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            // Bottom Navigation
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.home, color: Colors.blue, size: 28),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapScreen()),
                      );
                    },
                    icon: Icon(Icons.map, color: Colors.grey[400], size: 28),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
