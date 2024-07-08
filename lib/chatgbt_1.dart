import 'package:flutter/material.dart';

class statusBar extends StatelessWidget {
  const statusBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const StatusBar([
      {'username': '_a.nita.h', 'imagePath': 'assets/images/home_pic_1.jpeg'},
      {'username': '_issrissa', 'imagePath': 'assets/images/home_pic_2.jpeg'},
      {
        'username': '___c.h.e.c.h.e___',
        'imagePath': 'assets/images/home_pic_3.jpeg'
      },
      {'username': '_mal.emba', 'imagePath': 'assets/images/home_pic_5.jpeg'},
      {'username': '_mal.emba', 'imagePath': 'assets/images/home_pic_6.jpeg'},
      {'username': '_mal.emba', 'imagePath': 'assets/images/home_pic_7.jpeg'},
    ]);
  }
}

class StatusBar extends StatelessWidget {
  final List<Map<String, String>> statuses;

  const StatusBar(this.statuses);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: statuses.length,
        itemBuilder: (context, index) {
          final status = statuses[index];
          final username = status['username'] ?? 'Unknown';
          final imagePath = status['imagePath'] ??
              ''; // Provide a default empty string if null

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: StatusItem(
              username: username,
              imagePath: imagePath,
            ),
          );
        },
      ),
    );
  }
}

class StatusItem extends StatelessWidget {
  final String username;
  final String imagePath;

  const StatusItem._(this.username, this.imagePath);

  factory StatusItem({required String username, required String imagePath}) {
    return StatusItem._(username, imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.red, Colors.purple, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipOval(
                  child: imagePath.isNotEmpty
                      ? Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.person,
                          size: 50), // Placeholder if imagePath is empty
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(username, style: const TextStyle(color: Colors.black)),
      ],
    );
  }
}
