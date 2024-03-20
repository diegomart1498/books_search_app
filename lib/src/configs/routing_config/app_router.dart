part of 'package.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey();

GoRouter appRouter() {
  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: HomePage.route,
    routes: [
      GoRoute(
        path: HomePage.route,
        builder: (context, state) => const HomePage(),
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(state.error),
  );
}
