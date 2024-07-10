import 'package:flutter/material.dart';
import 'package:flutter_test_playground/claude/bottom_nav.dart';

class Location {
  final String title;
  final String subtitle;
  final String distance;
  final List<String> imagePaths;
  final bool isLiked;
  final bool isSaved;
  final bool isOpen;
  final String description;
  final String type;

  Location({
    required this.title,
    required this.subtitle,
    required this.distance,
    required this.imagePaths,
    required this.isLiked,
    required this.isSaved,
    required this.description,
    required this.type,
    required this.isOpen,
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
        'assets/images/pic_1.jpeg',
        'assets/images/pic_2.jpeg',
        'assets/images/pic_3.jpeg',
      ],
      isLiked: true,
      isSaved: false,
      description: 'Authentic Japanese ramen with rich, flavorful broth',
      type: 'Restaurant',
      isOpen: true,
    ),
    Location(
      title:
          'Sushi Roku  Japanese ramen with rich, flavorful broth Japanese ramen with rich, flavorful broth',
      subtitle:
          'Japanese Cuisine Japanese ramen with rich, flavorful broth Japanese ramen with rich, flavorful broth',
      distance: '1.3 km',
      imagePaths: [
        'assets/images/pic_4.jpeg',
        'assets/images/pic_5.jpeg',
      ],
      isLiked: true,
      isSaved: false,
      description:
          'Authentic Japanese ramen with rich, flavorful broth Japanese ramen with rich, flavorful broth Japanese ramen with rich, flavorful broth',
      type: 'Restaurant',
      isOpen: false,
    ),
    Location(
      title: 'Hokkaido Ramen Santouka',
      subtitle: 'Santouka',
      distance: '800 meters',
      imagePaths: [
        'assets/images/pic_6.jpeg',
        'assets/images/pic_7.jpeg',
        'assets/images/pic_8.jpeg',
      ],
      isLiked: true,
      isSaved: false,
      description: 'Authentic Japanese ramen with rich, flavorful broth',
      type: 'Restaurant',
      isOpen: true,
    ),
    Location(
      title: 'Hokkaido Ramen Santouka',
      subtitle: 'Santouka',
      distance: '800 meters',
      imagePaths: [
        'assets/images/pic_9.jpeg',
        'assets/images/pic_10.jpeg',
        'assets/images/pic_11.jpeg',
      ],
      isLiked: true,
      isSaved: false,
      description: 'Authentic Japanese ramen with rich, flavorful broth',
      type: 'Restaurant',
      isOpen: false,
    ),
    Location(
      title: 'Hokkaido Ramen Santouka',
      subtitle: 'Santouka',
      distance: '800 meters',
      imagePaths: [
        'assets/images/pic_12.jpeg',
        'assets/images/pic_13.jpeg',
        'assets/images/pic_14.jpeg',
      ],
      isLiked: false,
      isSaved: true,
      description: 'Authentic Japanese ramen with rich, flavorful broth',
      type: 'Restaurant',
      isOpen: true,
    ),
    Location(
      title: 'Hokkaido Ramen Santouka',
      subtitle: 'Santouka',
      distance: '800 meters',
      imagePaths: [
        'assets/images/pic_15.jpeg',
        'assets/images/pic_16.jpeg',
      ],
      isLiked: true,
      isSaved: false,
      description: 'Authentic Japanese ramen with rich, flavorful broth',
      type: 'Restaurant',
      isOpen: true,
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
      // bottomNavigationBar: BottomNavigation(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: _onItemTapped,
      // ),
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
            flex: 7,
            child: _buildImageCarousel(location.imagePaths),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          location.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          location.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          location.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              location.isOpen
                                  ? Icons.access_time_filled
                                  : Icons.access_time,
                              color:
                                  location.isOpen ? Colors.green : Colors.red,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              location.isOpen ? "Open" : "Closed",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 16),
                            Flexible(
                              child: Text(
                                location.distance,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8), // Add space between text and icons
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          location.isLiked
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: location.isLiked ? Colors.red : null,
                        ),
                        onPressed: () {
                          // Handle like action
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          location.isSaved
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: location.isSaved ? Colors.blue : null,
                        ),
                        onPressed: () {
                          // Handle save action
                        },
                      ),
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
