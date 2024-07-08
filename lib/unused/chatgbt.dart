import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
          onPressed: () {
            // Get.offAndToNamed('/Sign-In');
          },
          child: const Text('Logout'),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryButton(
                  imageUrl: 'assets/images/home_pic_1.jpeg',
                  label: 'Hotel',
                ),
                CategoryButton(
                  imageUrl: 'assets/images/home_pic_2.jpeg',
                  label: 'Café',
                ),
                CategoryButton(
                  imageUrl: 'assets/images/home_pic_3.jpeg',
                  label: 'Restro',
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'For you',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const LocationCard(
            imageUrl: 'assets/images/home_pic_4.jpeg',
            distance: 800,
            name: 'Hokkaido Ramen',
            subtitle: 'Santouka',
          ),
          const LocationCard(
            imageUrl: 'assets/images/home_pic_5.jpeg',
            distance: 400,
            name: 'Sushi Bar',
            subtitle: 'Tokyo Sushi',
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String imageUrl;
  final String label;

  const CategoryButton({
    super.key,
    required this.imageUrl,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imageUrl),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final String imageUrl;
  final int distance;
  final String name;
  final String subtitle;

  const LocationCard({
    super.key,
    required this.imageUrl,
    required this.distance,
    required this.name,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: ListTile(
              title: Text(name),
              subtitle: Text(subtitle),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on),
                  Text('$distance meters'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
