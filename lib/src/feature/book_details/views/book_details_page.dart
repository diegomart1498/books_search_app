part of '../package.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({
    this.isbn13 = '',
    super.key,
  });
  final String isbn13;

  static String route = 'details';
  static String fullRoute = '${HomePage.route}/$route';
  static String routeName = 'book-details';

  @override
  Widget build(BuildContext context) {
    loggwtf(isbn13);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles'),
      ),
      body: Align(child: Text(isbn13)),
    );
  }
}
