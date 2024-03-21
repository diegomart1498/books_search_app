part of 'package.dart';

///-----------------------------------------------------------------------------
///Page transition fading
///-----------------------------------------------------------------------------

CustomTransitionPage _buildPageWithFadeTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 250),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

Page<dynamic> Function(BuildContext, GoRouterState) fadePageBuilder<T>(
  Widget child,
) =>
    (BuildContext context, GoRouterState state) {
      return _buildPageWithFadeTransition<T>(
        context: context,
        state: state,
        child: child,
      );
    };

Page<dynamic> fadePageBuilderState<T>(
  BuildContext context,
  GoRouterState state,
  Widget child,
) =>
    _buildPageWithFadeTransition<T>(
      context: context,
      state: state,
      child: child,
    );

///-----------------------------------------------------------------------------
///Page transition from up, left, rigth or down
///-----------------------------------------------------------------------------

enum SlideFrom {
  up,
  left,
  rigth,
  down;

  Offset get offset => slideDirection[this]!;

  static const Map<SlideFrom, Offset> slideDirection = {
    SlideFrom.up: Offset(0.0, -1.0),
    SlideFrom.left: Offset(-1.0, 0.0),
    SlideFrom.rigth: Offset(1.0, 0.0),
    SlideFrom.down: Offset(0.0, 1.0),
  };
}

CustomTransitionPage _buildPageWithSlideTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required SlideFrom slideFrom,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 200),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        SlideTransition(
      position: Tween<Offset>(
        begin: slideFrom.offset,
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}

Page<dynamic> Function(BuildContext, GoRouterState) slidePageBuilder<T>({
  required SlideFrom slideFrom,
  required Widget child,
}) =>
    (BuildContext context, GoRouterState state) {
      return _buildPageWithSlideTransition<T>(
        slideFrom: slideFrom,
        context: context,
        state: state,
        child: child,
      );
    };

Page<dynamic> slidePageBuilderState<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  required SlideFrom slideFrom,
}) =>
    _buildPageWithSlideTransition<T>(
      context: context,
      state: state,
      child: child,
      slideFrom: slideFrom,
    );
