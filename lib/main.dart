import 'package:flutter/material.dart';

import 'claude/claude.dart';

// Import your HomePage file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title', // Replace with your app's name
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // Make HomePage the initial route
    );
  }
}


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   PageController _pageController = PageController();
//   double _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(() {
//       setState(() {
//         _currentPage = _pageController.page ?? 0;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         controller: _pageController,
//         itemCount: 5, // Number of pages
//         itemBuilder: (context, index) {
//           double opacity = (1 - (_currentPage - index).abs()).clamp(0.0, 1.0);
//           return Center(
//             child: AnimatedOpacity(
//               opacity: opacity,
//               duration: Duration(milliseconds: 300),
//               child: Container(
//                 color: Colors.blue,
//                 child: Center(
//                   child: Text(
//                     'Page $index',
//                     style: TextStyle(fontSize: 32, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
