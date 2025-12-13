import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'map_screen.dart';

class FishDetailPage extends StatelessWidget {
  final Map<dynamic, dynamic> fish;

  const FishDetailPage({super.key, required this.fish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.blue),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.blue[50],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Fish Information Page',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fish Title
                    Center(
                      child: Text(
                        fish['commonName'] ?? 'Unknown',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Fish Image
                    Center(
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: (fish['imageUrl'] != null &&
                                fish['imageUrl'].toString().isNotEmpty)
                            ? Image.asset(
                                fish['imageUrl'],
                                fit: BoxFit.contain,
                                width: double.infinity,
                                height: 200,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(
                                      Icons.image_outlined,
                                      size: 100,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              )
                            : const Center(
                                child: Icon(
                                  Icons.image_outlined,
                                  size: 100,
                                  color: Colors.grey,
                                ),
                              ),
                      ),
                    ),

                    // Tabs
                    _buildTabSection(context),

                    const SizedBox(height: 24),

                    // Common Name
                    _buildInfoSection(
                      'Common Name',
                      fish['commonName'] ?? 'Unknown',
                    ),

                    // Scientific Name
                    _buildInfoRow(
                      'Scientific Name',
                      fish['scientificName'] ?? 'N/A',
                    ),

                    // Local Name
                    _buildInfoRow(
                      'Local Name',
                      fish['localName'] ?? 'N/A',
                    ),

                    const SizedBox(height: 24),

                    // Description
                    _buildSectionHeader('Description'),
                    const SizedBox(height: 8),
                    Text(
                      fish['information'] ?? 'No description available',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Size Range
                    _buildSectionHeader('Size Range'),
                    const SizedBox(height: 8),
                    Text(
                      fish['sizeRange'] ?? 'N/A',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Identifying Features
                    _buildSectionHeader('Identifying Features'),
                    const SizedBox(height: 8),
                    if (fish['identifyingFeatures'] != null)
                      ...List.from(fish['identifyingFeatures']).map((feature) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '• ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  feature.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList()
                    else
                      Text(
                        'No identifying features listed',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),

                    const SizedBox(height: 24),

                    // Habitat
                    _buildSectionHeader('Habitat'),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        Chip(
                          label: Text(
                            fish['habitat'] ?? 'Unknown',
                            style: const TextStyle(fontSize: 12),
                          ),
                          backgroundColor: Colors.blue[50],
                          side: const BorderSide(color: Colors.blue),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Conservation Status
                    if (fish['conservationStatus'] != null) ...[
                      _buildSectionHeader('Conservation Status'),
                      const SizedBox(height: 8),
                      Text(
                        fish['conservationStatus'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Distribution
                    if (fish['distribution'] != null) ...[
                      _buildSectionHeader('Distribution'),
                      const SizedBox(height: 8),
                      Text(
                        fish['distribution'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tabs row
  Widget _buildTabSection(BuildContext context) {
    return Row(
      children: [
        _buildTab('Information', true, () {}),
        _buildTab('Map', false, () {
          final String? fishId = fish['fishId']?.toString();
          if (fishId == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No fishId found for this fish')),
            );
            return;
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MapScreen(
                fishId: fishId,                         // NEW
                fishName: fish['commonName'] ?? 'Fish',
              ),
            ),
          );
        }),
      ],
    );
  }


  Widget _buildTab(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[600],
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
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
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
