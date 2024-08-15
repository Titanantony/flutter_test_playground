import 'package:flutter/material.dart';
// import 'claude.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Page',
      home: ExplorePage(),
    );
  }
}

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: _buildLocationSelector(),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            SizedBox(height: 20),
            _buildSectionTitle("Popular place", () {}),
            _buildPopularPlaces(),
            SizedBox(height: 20),
            _buildSectionTitle("Recommendation for you", () {}),
            _buildRecommendations(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildLocationSelector() {
    return Row(
      children: [
        Icon(Icons.location_on, color: Colors.black),
        SizedBox(width: 8),
        Text("Jawa Timur", style: TextStyle(color: Colors.black)),
        Icon(Icons.arrow_drop_down, color: Colors.black),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, VoidCallback onSeeAllPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onSeeAllPressed,
          child: Text("See all"),
        ),
      ],
    );
  }

  Widget _buildPopularPlaces() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildPlaceCard('Kawah Ijen', 'Banyuwangi, Jawa Timur', '4.7',
              'assets/images/pic_4.jpeg'),
          _buildPlaceCard('Kelingking Beach', 'Klungkung, Bali', '4.6',
              'assets/images/pic_5.jpeg'),
        ],
      ),
    );
  }

  Widget _buildPlaceCard(
      String title, String location, String rating, String imagePath) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 14),
                    SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 14),
                    SizedBox(width: 4),
                    Text(
                      rating,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendations() {
    return Expanded(
      child: ListView(
        children: [
          _buildRecommendationCard('Mountain Bromo', 'Jawa Timur', '4.9', '26',
              'assets/images/pic_3.jpeg'),
          _buildRecommendationCard('Ulun Danu Beratan Lake', 'Tabanan, Bali',
              '4.8', '22', 'assets/images/pic_2.jpeg'),
          _buildRecommendationCard('Madakaripura Waterfall', 'Tabanan, Bali',
              '4.7', '20', 'assets/images/pic_1.jpeg'),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard(String title, String location, String rating,
      String price, String imagePath) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14),
                      SizedBox(width: 4),
                      Text(location),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 14),
                      SizedBox(width: 4),
                      Text(rating),
                    ],
                  ),
                ],
              ),
            ),
            Text("\$$price/Person"),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
      ],
    );
  }
}















// import 'package:flutter/material.dart';
// import 'package:flutter_test_playground/app_state.dart';
// import 'package:flutter_test_playground/claude/adjusted.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_test_playground/claude/bottom_nav.dart';
// // import 'package:flutter_test_playground/claude/explore.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => AppState(),
//       child: const MyApp(),
//     ),
//   );
// }

// class AppState extends ChangeNotifier {
//   String searchQuery = '';

//   void updateSearchQuery(String query) {
//     searchQuery = query;
//     notifyListeners();
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Travel App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const MainPage(),
//     );
//   }
// }

// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int _selectedIndex = 0;

//   static const List<Widget> _pages = <Widget>[
//     HomePage(),
//     ExplorePage(),
//     Placeholder(), // Placeholder for Favorites page
//     Placeholder(), // Placeholder for Profile page
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigation(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped,
//       ),
//     );
//   }
// }

// class ExplorePage extends StatelessWidget {
//   const ExplorePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverList(
//             delegate: SliverChildListDelegate([
//               const PopularPlacesSection(),
//               const RecommendationsSection(),
//               const TopRatedDiningSection(),
//               const LocalFavoritesSection(),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }
