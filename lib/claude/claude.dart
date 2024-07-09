import 'package:flutter/material.dart';
import 'package:flutter_test_playground/claude/bottom_nav.dart';

class Location {
  final String title;
  final String subtitle;
  final String distance;
  final List<String> imagePaths;

  Location({
    required this.title,
    required this.subtitle,
    required this.distance,
    required this.imagePaths,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late ScrollController _scrollController;
  late double _itemHeight;
  int _currentIndex = 0;

  final List<Location> _locations = [
    Location(
      title: 'Hokkaido Ramen Santouka',
      subtitle: 'Santouka',
      distance: '800 meters',
      imagePaths: [
        'assets/images/home_pic_1.jpeg',
        'assets/images/home_pic_2.jpeg',
        'assets/images/home_pic_3.jpeg',
      ],
    ),
    Location(
      title: 'Sushi Roku',
      subtitle: 'Japanese Cuisine',
      distance: '1.2 km',
      imagePaths: [
        'assets/images/home_pic_4.jpeg',
        'assets/images/home_pic_5.jpeg',
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    int index = (_scrollController.offset / _itemHeight).round();
    if (index != _currentIndex) {
      setState(() => _currentIndex = index);
      _animateToIndex(index);
    }
  }

  void _animateToIndex(int index) {
    _scrollController.animateTo(
      index * _itemHeight,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    _itemHeight = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildStatusBar(),
            Expanded(child: _buildLocationList()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'For you',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'See All',
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 100,
      color: Colors.grey[200],
      child: const Center(child: Text('Status Bar Placeholder')),
    );
  }

  Widget _buildLocationList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _locations.length,
      itemBuilder: (context, index) => _buildLocationItem(index),
    );
  }

  Widget _buildLocationItem(int index) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: _currentIndex == index ? 1.0 : 0.5,
      child: SizedBox(
        height: _itemHeight,
        child: _buildLocationCard(_locations[index]),
      ),
    );
  }

  Widget _buildLocationCard(Location location) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: _buildImageCarousel(location.imagePaths),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(location.subtitle),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16),
                      Text(location.distance),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCarousel(List<String> imagePaths) {
    return PageView.builder(
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return Image.asset(
          imagePaths[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}
