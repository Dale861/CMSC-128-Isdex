import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              // later: open notifications
            },
            icon: const Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: const SafeArea(
        child: _FeedList(),
      ),

      // + button: if not logged in -> dialog; if logged in -> create post sheet
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

/// Feed list with dummy posts for now
class _FeedList extends StatelessWidget {
  const _FeedList();

  List<Map<String, String>> get _dummyPosts => [
        {
          'username': 'student_a',
          'location': 'Cage 1 – East Side',
          'species': 'Bangus (Milkfish)',
          'caption':
              'Morning check ✅ Water looks clearer today and feed response is good.',
          'timeAgo': '2h ago',
          'likes': '24',
        },
        {
          'username': 'fisher_b',
          'location': 'Pond 3',
          'species': 'Tilapia',
          'caption':
              'Anyone else seeing slower growth this week? Might be the temperature.',
          'timeAgo': '6h ago',
          'likes': '11',
        },
        {
          'username': 'researcher_c',
          'location': 'Zone 3 Shrimp Pond',
          'species': 'Penaeus monodon',
          'caption':
              'Sampled DO levels this afternoon. Slight drop vs yesterday, monitoring tomorrow.',
          'timeAgo': '1d ago',
          'likes': '37',
        },
      ];

  @override
  Widget build(BuildContext context) {
    final posts = _dummyPosts;

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return _PostItem(
          username: post['username'] ?? 'user',
          location: post['location'] ?? '',
          species: post['species'] ?? '',
          caption: post['caption'] ?? '',
          timeAgo: post['timeAgo'] ?? '',
          likes: post['likes'] ?? '0',
        );
      },
    );
  }
}

/// Single post card – picture-focused, unique layout, like+comment only
class _PostItem extends StatelessWidget {
  final String username;
  final String location;
  final String species;
  final String caption;
  final String timeAgo;
  final String likes;

  const _PostItem({
    required this.username,
    required this.location,
    required this.species,
    required this.caption,
    required this.timeAgo,
    required this.likes,
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
                      // later: show report / options menu
                    },
                    icon: const Icon(Icons.more_horiz),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),

            // IMAGE AREA – main focus
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
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

            // ACTIONS: like + comment only
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // later: like
                    },
                    icon: const Icon(Icons.favorite_border, size: 24),
                    splashRadius: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      // later: open comments
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

/// Bottom sheet for creating a new post (UI only for now)
void _openCreatePostSheet(BuildContext context) {
  final captionController = TextEditingController();

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

              // Image preview placeholder
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
                  // TODO: integrate image picker later
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Image picker not yet implemented'),
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
                  onPressed: () {
                    if (captionController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please add a caption or photo.'),
                        ),
                      );
                      return;
                    }

                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Post submitted (local only for now)'),
                      ),
                    );
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

/// Login-required dialog from your teammate, adapted to take BuildContext
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
