import 'package:flutter/material.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openCreatePostSheet(context),
        child: const Icon(Icons.add),
      ),

    );
  }
}

/// Feed list with IG-style posts (for now uses dummy data)
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
        },
        {
          'username': 'fisher_b',
          'location': 'Pond 3',
          'species': 'Tilapia',
          'caption':
              'Anyone else seeing slower growth this week? Might be the temperature.',
          'timeAgo': '6h ago',
        },
        {
          'username': 'researcher_c',
          'location': 'Zone 3 Shrimp Pond',
          'species': 'Penaeus monodon',
          'caption':
              'Sampled DO levels this afternoon. Slight drop vs yesterday, monitoring tomorrow.',
          'timeAgo': '1d ago',
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
        );
      },
    );
  }
}

/// Single post item – IG-style: header, image, actions, caption, time
class _PostItem extends StatelessWidget {
  final String username;
  final String location;
  final String species;
  final String caption;
  final String timeAgo;

  const _PostItem({
    required this.username,
    required this.location,
    required this.species,
    required this.caption,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // HEADER: avatar, username, location, menu
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ),

        // IMAGE AREA (placeholder for now)
        AspectRatio(
          aspectRatio: 4 / 5, // tall post like IG
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: const Center(
              child: Icon(
                Icons.image,
                size: 60,
                color: Colors.white70,
              ),
            ),
          ),
        ),

        // ACTIONS: like, comment, share, bookmark
        Padding
        (
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  // later: like
                },
                icon: const Icon(Icons.favorite_border, size: 26),
              ),
              IconButton(
                onPressed: () {
                  // later: open comments
                },
                icon: const Icon(Icons.mode_comment_outlined, size: 24),
              ),
              IconButton(
                onPressed: () {
                  // later: share
                },
                icon: const Icon(Icons.send_outlined, size: 24),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  // later: save/bookmark
                },
                icon: const Icon(Icons.bookmark_border, size: 26),
              ),
            ],
          ),
        ),

        // SPECIES + CAPTION
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (species.isNotEmpty)
                Text(
                  species,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
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

        const SizedBox(height: 12),
        const Divider(height: 1),
      ],
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
                aspectRatio: 4 / 5,
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

              // Later: this button will open image picker
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
                    // UI only for now: we just close and show a message
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
