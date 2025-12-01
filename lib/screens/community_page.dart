import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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

      // + button: if not logged in -> login dialog; if logged in -> new post sheet
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
      stream: dbRef.onValue, // listen to all changes under /community_posts
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

        // Realtime DB returns a Map of key -> postData
        final raw = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;

        // Convert entries to list and sort by timePosted (newest first)
        final entries = raw.entries.toList()
          ..sort((a, b) {
            final ma = a.value['timePosted'] ?? 0;
            final mb = b.value['timePosted'] ?? 0;
            // descending
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
              imageUrl: (data['imageUrl'] ?? '') as String?,
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
  final String? imageUrl;

  const _PostItem({
    required this.username,
    required this.location,
    required this.species,
    required this.caption,
    required this.timeAgo,
    required this.likes,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
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

            // IMAGE AREA – main focus (network if available, grey placeholder otherwise)
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (imageUrl != null && imageUrl!.isNotEmpty)
                    Image.network(
                      imageUrl!,
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

                  // Species chip on top-left, if provided
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

            // ACTIONS: like + comment only (no share/bookmark)
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

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
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

              // Image preview placeholder (we'll hook Storage later)
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 50,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              OutlinedButton.icon(
                onPressed: () {
                  // TODO: integrate image picker + Firebase Storage later
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Image upload not yet implemented (UI only).'),
                    ),
                  );
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
                  onPressed: () async {
                    final caption = captionController.text.trim();

                    if (caption.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please add a caption.'),
                        ),
                      );
                      return;
                    }

                    try {
                      // Create a new child under /community_posts
                      await dbRef.push().set({
                        'caption': caption,
                        'username':
                            user?.email?.split('@')[0] ?? 'Anonymous user',
                        'location': '', // can be filled later
                        'species': '',  // can be filled later
                        'likes': 0,
                        'imageUrl': '', // for now no real image
                        'timePosted': ServerValue.timestamp,
                      });

                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Post published!'),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to post: $e'),
                        ),
                      );
                    }
                  },
                  child: const Text('Post'),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// Login-required dialog (from your teammate) adapted to use here
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
