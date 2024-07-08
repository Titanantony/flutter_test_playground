import 'package:flutter/material.dart';

// Step 1: Abstract StatusItem class
abstract class StatusItem {
  Widget build(BuildContext context);
}

// Step 2: Concrete implementations
class TextStatusItem extends StatusItem {
  final String text;
  TextStatusItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}

class ImageStatusItem extends StatusItem {
  final String imageUrl;
  ImageStatusItem(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageUrl, fit: BoxFit.cover);
  }
}

// Step 3: StatusItemFactory
class StatusItemFactory {
  static StatusItem createStatusItem(Map<String, dynamic> data) {
    if (data['type'] == 'text') {
      return TextStatusItem(data['content']);
    } else if (data['type'] == 'image') {
      return ImageStatusItem(data['content']);
    }
    throw Exception('Invalid status item type');
  }
}

// Step 4-7: StatusBar widget
class StatusBar extends StatelessWidget {
  final List<Map<String, dynamic>> statusData;

  StatusBar({required this.statusData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: statusData.length,
        itemBuilder: (context, index) {
          StatusItem item =
              StatusItemFactory.createStatusItem(statusData[index]);
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                // Implement full status view
                print('Open full status view for item $index');
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.pink],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: EdgeInsets.all(3),
                child: CircleAvatar(
                  child: ClipOval(child: item.build(context)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Usage example
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dummyData = [
      {'type': 'text', 'content': 'A'},
      {'type': 'image', 'content': 'assets/images/home_pic_1.jpeg'},
      {'type': 'text', 'content': 'B'},
      {'type': 'image', 'content': 'assets/images/home_pic_2.jpeg'},
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Status Bar Example')),
        body: StatusBar(statusData: dummyData),
      ),
    );
  }
}
