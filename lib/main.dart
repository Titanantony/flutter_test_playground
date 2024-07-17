import 'package:flutter/material.dart';
import 'package:flutter_test_playground/app_state.dart';
import 'package:flutter_test_playground/claude/adjusted.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test_playground/claude/bottom_nav.dart';
// import 'package:flutter_test_playground/claude/explore.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class AppState extends ChangeNotifier {
  String searchQuery = '';

  void updateSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    ExplorePage(),
    Placeholder(), // Placeholder for Favorites page
    Placeholder(), // Placeholder for Profile page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // const SliverAppBar(
          //   floating: true,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: SearchBar(),
          //   ),
          // ),
          SliverList(
            delegate: SliverChildListDelegate([
              const PopularPlacesSection(),
              const RecommendationsSection(),
              const TopRatedDiningSection(),
              const LocalFavoritesSection(),
            ]),
          ),
        ],
      ),
    );
  }
}
