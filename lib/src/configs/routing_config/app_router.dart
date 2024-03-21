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
        routes: [
          GoRoute(
            path: BookDetailsPage.route,
            name: BookDetailsPage.routeName,
            builder: (context, state) => BookDetailsPage(
              isbn13: state.uri.queryParameters['isbn13'].toString(),
            ),
            pageBuilder: (context, state) => slidePageBuilderState(
              state: state,
              context: context,
              slideFrom: SlideFrom.rigth,
              child: BookDetailsPage(
                isbn13: state.uri.queryParameters['isbn13'].toString(),
              ),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(state.error),
  );
}
