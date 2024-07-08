import 'package:flutter/material.dart';

// Abstract class for status bar items
abstract class StatusBarItem {
  Widget build();
}

// Concrete class for image status bar items
class ImageStatusBarItem extends StatusBarItem {
  final String imagePath;

  ImageStatusBarItem({required this.imagePath});

  @override
  Widget build() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.asset(imagePath),
    );
  }
}

// Concrete class for text status bar items
class TextStatusBarItem extends StatusBarItem {
  final String text;

  TextStatusBarItem({required this.text});

  @override
  Widget build() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text(text),
    );
  }
}

// Factory class for creating status bar items
class StatusBarFactory {
  static Widget create(String type,
      {required String imagePath, required String text}) {
    switch (type) {
      case 'image':
        return Container(
          padding: EdgeInsets.all(8.0),
          child: Image.asset(imagePath),
        );
      case 'text':
        return Container(
          padding: EdgeInsets.all(8.0),
          child: Text(text),
        );
      default:
        throw ArgumentError('Invalid status bar item type');
    }
  }
}

// Example usage in a Flutter app
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: StatusBarFactory.create('image',
              imagePath: 'assets/images/home_pic_1.jpeg', text: ''),
          title: StatusBarFactory.create('text',
              text: 'Your App Name',
              imagePath: 'assets/images/home_pic_2.jpeg'),
          actions: [
            StatusBarFactory.create('image',
                imagePath: 'assets/images/home_pic_3.jpeg', text: ''),
          ],
        ),
        body: const Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}
