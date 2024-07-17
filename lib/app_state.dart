import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier {
  String searchQuery = '';

  void updateSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ExplorePage(),
    );
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: SearchBar(),
            ),
          ),
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

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Places',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.mic),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (value) => appState.updateSearchQuery(value),
          ),
        );
      },
    );
  }
}

// class SearchBar extends StatelessWidget {
//   const SearchBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppState>(
//       builder: (context, appState, child) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             decoration: InputDecoration(
//               hintText: 'Search Places',
//               prefixIcon: const Icon(Icons.search),
//               suffixIcon: const Icon(Icons.mic),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               filled: true,
//               fillColor: Colors.white,
//             ),
//             onChanged: (value) => appState.updateSearchQuery(value),
//           ),
//         );
//       },
//     );
//   }
// }

class PopularPlacesSection extends StatelessWidget {
  const PopularPlacesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Popular places',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        const SortingOptions(),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Replace with actual data
            itemBuilder: (context, index) => const PlaceCard(),
          ),
        ),
      ],
    );
  }
}

class SortingOptions extends StatelessWidget {
  const SortingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SortChip(label: 'Sort'),
          SortChip(label: 'Distance away'),
          SortChip(label: 'Activity'),
          SortChip(label: 'Length'),
        ],
      ),
    );
  }
}

class SortChip extends StatelessWidget {
  final String label;

  const SortChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(label: Text(label)),
    );
  }
}

class PlaceCard extends StatelessWidget {
  const PlaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset('assets/images/pic_2.jpeg',
              height: 100, fit: BoxFit.cover),
          const Text('Place Name'),
          const Text('Location'),
          const Row(
            children: [
              Icon(Icons.star, color: Colors.yellow),
              Text('4.5'),
            ],
          ),
        ],
      ),
    );
  }
}

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Recommendations for you',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3, // Replace with actual data
          itemBuilder: (context, index) => const RecommendationCard(),
        ),
      ],
    );
  }
}

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset('assets/images/pic_1.jpeg',
            width: 60, height: 60, fit: BoxFit.cover),
        title: const Text('Place Name'),
        subtitle: const Text('Location'),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 16),
                Text('4.5'),
              ],
            ),
            Text('\$26 /Person'),
          ],
        ),
      ),
    );
  }
}

class TopRatedDiningSection extends StatelessWidget {
  const TopRatedDiningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Top Rated dining spots',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3, // Replace with actual data
          itemBuilder: (context, index) => const RecommendationCard(),
        ),
      ],
    );
  }
}

class LocalFavoritesSection extends StatelessWidget {
  const LocalFavoritesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Local favorites',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2, // Replace with actual data
          itemBuilder: (context, index) => const RecommendationCard(),
        ),
      ],
    );
  }
}
