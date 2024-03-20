part of 'package.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen(this.error, {super.key});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ErrorScreen'),
            if (error != null) Text(error.toString()),
            TextButton(
              onPressed: () => context.go(HomePage.route),
              child: const Text('back'),
            ),
          ],
        ),
      ),
    );
  }
}
