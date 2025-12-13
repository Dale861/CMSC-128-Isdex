import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';

import 'login_page.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'Isdex Community',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: notifications page later
            },
            icon: const Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: const SafeArea(
        child: _FeedList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final user = FirebaseAuth.instance.currentUser;

          if (user == null) {
            _showLoginPrompt(context);
          } else {
            _openCreatePostSheet(context);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Feed list that listens to Realtime Database: /community_posts
class _FeedList extends StatelessWidget {
  const _FeedList();

  @override
  Widget build(BuildContext context) {
    final DatabaseReference dbRef =
        FirebaseDatabase.instance.ref().child('community_posts');

    return StreamBuilder<DatabaseEvent>(
      stream: dbRef.onValue,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
          return const Center(
            child: Text(
              'No posts yet.\nBe the first to share!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        final raw = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
        final entries = raw.entries.toList()
          ..sort((a, b) {
            final ma = a.value['timePosted'] ?? 0;
            final mb = b.value['timePosted'] ?? 0;
            return (mb as int).compareTo(ma as int);
          });

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 80),
          itemCount: entries.length,
          itemBuilder: (context, index) {
            final data = Map<String, dynamic>.from(entries[index].value);

            return _PostItem(
              username: data['username'] ?? 'Unknown',
              location: data['location'] ?? '',
              species: data['species'] ?? '',
              caption: data['caption'] ?? '',
              likes: (data['likes'] ?? 0).toString(),
              timeAgo: _timeAgoFromMillis(data['timePosted']),
              imageBase64: (data['imageBase64'] ?? '') as String,
            );
          },
        );
      },
    );
  }
}

/// Single post card – picture-focused, with like + comment only
class _PostItem extends StatelessWidget {
  final String username;
  final String location;
  final String species;
  final String caption;
  final String timeAgo;
  final String likes;
  final String imageBase64;

  const _PostItem({
    required this.username,
    required this.location,
    required this.species,
    required this.caption,
    required this.timeAgo,
    required this.likes,
    required this.imageBase64,
  });

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    if (imageBase64.isNotEmpty) {
      try {
        imageBytes = base64Decode(imageBase64);
      } catch (_) {
        imageBytes = null;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP: username + location + menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    child: Icon(Icons.person, size: 20),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        if (location.isNotEmpty)
                          Text(
                            location,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO: options / report menu
                    },
                    icon: const Icon(Icons.more_horiz),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),

            // IMAGE AREA
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (imageBytes != null)
                    Image.memory(
                      imageBytes,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.white70,
                            ),
                          ),
                        );
                      },
                    )
                  else
                    Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          size: 60,
                          color: Colors.white70,
                        ),
                      ),
                    ),

                  if (species.isNotEmpty)
                    Positioned(
                      left: 12,
                      top: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          species,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 6),

            // ACTIONS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // TODO: implement like update in DB
                    },
                    icon: const Icon(Icons.favorite_border, size: 24),
                    splashRadius: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO: open comments
                    },
                    icon: const Icon(Icons.mode_comment_outlined, size: 22),
                    splashRadius: 20,
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // LIKES + CAPTION + TIME
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$likes likes',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: '$username ',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(text: caption),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeAgo,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Bottom sheet for creating a NEW post -> writes to Realtime DB
void _openCreatePostSheet(BuildContext context) {
  final captionController = TextEditingController();
  final DatabaseReference dbRef =
      FirebaseDatabase.instance.ref().child('community_posts');
  final User? user = FirebaseAuth.instance.currentUser;

  File? pickedImage;
  String? base64Image;
  bool isUploading = false;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  const Text(
                    'New post',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Image preview
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: pickedImage != null
                          ? Image.file(
                              pickedImage!,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(
                                  Icons.add_photo_alternate_outlined,
                                  size: 50,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  OutlinedButton.icon(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final XFile? xfile = await picker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 50, // compress to keep b64 smaller
                      );
                      if (xfile == null) return;

                      final file = File(xfile.path);
                      final bytes = await file.readAsBytes();
                      final b64 = base64Encode(bytes);

                      setState(() {
                        pickedImage = file;
                        base64Image = b64;
                      });
                    },
                    icon: const Icon(Icons.photo_library_outlined),
                    label: const Text('Select photo'),
                  ),
                  const SizedBox(height: 12),

                  TextField(
                    controller: captionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Write a caption...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isUploading
                          ? null
                          : () async {
                              final caption = captionController.text.trim();

                              if (caption.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please add a caption.'),
                                  ),
                                );
                                return;
                              }

                              if (base64Image == null ||
                                  base64Image!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Please select an image first.'),
                                  ),
                                );
                                return;
                              }

                              try {
                                setState(() {
                                  isUploading = true;
                                });

                                await dbRef.push().set({
                                  'caption': caption,
                                  'username': user?.email
                                          ?.split('@')[0] ??
                                      'Anonymous user',
                                  'location': '',
                                  'species': '',
                                  'likes': 0,
                                  'imageBase64': base64Image,
                                  'timePosted': ServerValue.timestamp,
                                });

                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Post published!'),
                                  ),
                                );
                              } catch (e) {
                                setState(() {
                                  isUploading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Failed to post: $e'),
                                  ),
                                );
                              }
                            },
                      child: isUploading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text('Post'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

/// Login-required dialog
void _showLoginPrompt(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Login Required'),
      content: const Text('Please log in to use this feature.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            );
          },
          child: const Text('Log In'),
        ),
      ],
    ),
  );
}

/// Helper to convert Realtime DB timestamp (millis) into '2h ago', '1d ago'
String _timeAgoFromMillis(dynamic millis) {
  if (millis == null) return '';
  if (millis is! int) return '';

  final dt = DateTime.fromMillisecondsSinceEpoch(millis);
  final diff = DateTime.now().difference(dt);

  if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
  if (diff.inHours < 24) return '${diff.inHours}h ago';
  return '${diff.inDays}d ago';
}
