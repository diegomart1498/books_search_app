part of '../package.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books Search App'),
        actions: [
          IconButton(
            onPressed: () async => await showCustomSearch<String?>(
              context: context,
              delegate: BookSearchDelegate(),
            ),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const HomePageBody(),
    );
  }
}
