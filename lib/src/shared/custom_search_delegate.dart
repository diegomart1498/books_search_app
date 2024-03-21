part of 'package.dart';

// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:mi_barrio_app/core/constant/color_schemes.dart';
// import 'package:mi_barrio_app/core/constant/ui/ui.dart';
// import 'package:mi_barrio_app/share/util/extension/text_ext.dart';
// import 'package:mi_barrio_app/share/widgets/custom_back_button.dart';

Future<T?> showCustomSearch<T>({
  required BuildContext context,
  required CustomSearchDelegate<T> delegate,
  String? query = '',
  bool useRootNavigator = false,
}) {
  delegate.query = query ?? delegate.query;
  delegate._currentBody = _SearchBody.suggestions;
  return Navigator.of(context, rootNavigator: useRootNavigator)
      .push(_SearchPageRoute<T>(
    delegate: delegate,
  ));
}

abstract class CustomSearchDelegate<T> {
  CustomSearchDelegate({
    this.searchFieldLabel,
    this.searchFieldStyle,
    this.searchFieldDecorationTheme,
    this.keyboardType,
    this.textInputAction = TextInputAction.search,
  }) : assert(searchFieldStyle == null || searchFieldDecorationTheme == null);

  Widget buildSuggestions(BuildContext context);

  Widget buildResults(BuildContext context);

  String? hintText() => null;

  String? appbarTitle() => null;

  String get query => _queryTextController.text;

  set query(String value) {
    _queryTextController.text = value;
    if (_queryTextController.text.isNotEmpty) {
      _queryTextController.selection = TextSelection.fromPosition(
          TextPosition(offset: _queryTextController.text.length));
    }
  }

  void showResults(BuildContext context) {
    _focusNode?.unfocus();
    _currentBody = _SearchBody.results;
  }

  void showSuggestions(BuildContext context) {
    assert(_focusNode != null,
        '_focusNode must be set by route before showSuggestions is called.');
    _focusNode!.requestFocus();
    _currentBody = _SearchBody.suggestions;
  }

  void close(BuildContext context, T result) {
    _currentBody = null;
    _focusNode?.unfocus();
    Navigator.of(context)
      ..popUntil((Route<dynamic> route) => route == _route)
      ..pop(result);
  }

  final String? searchFieldLabel;
  final TextStyle? searchFieldStyle;
  final InputDecorationTheme? searchFieldDecorationTheme;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;

  final TextEditingController _queryTextController = TextEditingController();
  final ProxyAnimation _proxyAnimation =
      ProxyAnimation(kAlwaysDismissedAnimation);
  final ValueNotifier<_SearchBody?> _currentBodyNotifier =
      ValueNotifier<_SearchBody?>(null);

  _SearchBody? get _currentBody => _currentBodyNotifier.value;
  Animation<double> get transitionAnimation => _proxyAnimation;
  set _currentBody(_SearchBody? value) {
    _currentBodyNotifier.value = value;
  }

  FocusNode? _focusNode;
  _SearchPageRoute<T>? _route;
}

enum _SearchBody {
  suggestions,
  results,
}

class _SearchPageRoute<T> extends PageRoute<T> {
  _SearchPageRoute({
    required this.delegate,
  }) {
    assert(
      delegate._route == null,
      'The ${delegate.runtimeType} instance is currently used by another active '
      'search. Please close that search by calling close() on the CustomSearchDelegate '
      'before opening another search with the same delegate instance.',
    );
    delegate._route = this;
  }

  final CustomSearchDelegate<T> delegate;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => false;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  Animation<double> createAnimation() {
    final Animation<double> animation = super.createAnimation();
    delegate._proxyAnimation.parent = animation;
    return animation;
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _SearchPage<T>(
      delegate: delegate,
      animation: animation,
    );
  }

  @override
  void didComplete(T? result) {
    super.didComplete(result);
    assert(delegate._route == this);
    delegate._route = null;
    delegate._currentBody = null;
  }
}

class _SearchPage<T> extends StatefulWidget {
  const _SearchPage({
    required this.delegate,
    required this.animation,
  });

  final CustomSearchDelegate<T> delegate;
  final Animation<double> animation;

  @override
  State<StatefulWidget> createState() => _SearchPageState<T>();
}

class _SearchPageState<T> extends State<_SearchPage<T>> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.delegate._queryTextController.addListener(_onQueryChanged);
    widget.animation.addStatusListener(_onAnimationStatusChanged);
    widget.delegate._currentBodyNotifier.addListener(_onSearchBodyChanged);
    focusNode.addListener(_onFocusChanged);
    widget.delegate._focusNode = focusNode;
  }

  @override
  void dispose() {
    super.dispose();
    widget.delegate._queryTextController.removeListener(_onQueryChanged);
    widget.animation.removeStatusListener(_onAnimationStatusChanged);
    widget.delegate._currentBodyNotifier.removeListener(_onSearchBodyChanged);
    widget.delegate._focusNode = null;
    focusNode.dispose();
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    if (status != AnimationStatus.completed) {
      return;
    }
    widget.animation.removeStatusListener(_onAnimationStatusChanged);
    if (widget.delegate._currentBody == _SearchBody.suggestions) {
      focusNode.requestFocus();
    }
  }

  @override
  void didUpdateWidget(_SearchPage<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.delegate != oldWidget.delegate) {
      oldWidget.delegate._queryTextController.removeListener(_onQueryChanged);
      widget.delegate._queryTextController.addListener(_onQueryChanged);
      oldWidget.delegate._currentBodyNotifier
          .removeListener(_onSearchBodyChanged);
      widget.delegate._currentBodyNotifier.addListener(_onSearchBodyChanged);
      oldWidget.delegate._focusNode = null;
      widget.delegate._focusNode = focusNode;
    }
  }

  void _onFocusChanged() {
    if (focusNode.hasFocus &&
        widget.delegate._currentBody != _SearchBody.suggestions) {
      widget.delegate.showSuggestions(context);
    }
  }

  void _onQueryChanged() {
    setState(() {});
  }

  void _onSearchBodyChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));

    Widget? body;
    switch (widget.delegate._currentBody) {
      case _SearchBody.suggestions:
        body = KeyedSubtree(
          key: const ValueKey<_SearchBody>(_SearchBody.suggestions),
          child: widget.delegate.buildSuggestions(context),
        );
        break;
      case _SearchBody.results:
        body = KeyedSubtree(
          key: const ValueKey<_SearchBody>(_SearchBody.results),
          child: widget.delegate.buildResults(context),
        );
        break;
      case null:
        break;
    }

    return Semantics(
      explicitChildNodes: true,
      scopesRoute: true,
      namesRoute: true,
      child: SafeArea(
        child: Scaffold(
          appBar: _CustomAppbarSearch(widget.delegate, focusNode),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: body,
          ),
        ),
      ),
    );
  }
}

class _CustomAppbarSearch extends StatelessWidget
    implements PreferredSizeWidget {
  const _CustomAppbarSearch(
    this.delegate,
    this.focusNode,
  );

  final CustomSearchDelegate delegate;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH24,
      child: Column(
        children: [
          gapH16,
          Row(
            children: [
              CustomBackButton(
                onPressed: () => delegate.close(context, null),
              ),
              gapW12,
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  delegate.appbarTitle() ?? 'Búsqueda',
                  style: context.textStyles.h6.bold.black,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          gapH16,
          FormBuilderTextField(
            name: 'search',
            focusNode: focusNode,
            controller: delegate._queryTextController,
            style: context.textStyles.subtitle1.medium.black,
            onSubmitted: (value) => delegate.showResults(context),
            keyboardType: delegate.keyboardType,
            textInputAction: delegate.textInputAction,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: UISize.p8,
                horizontal: UISize.p8,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black45,
              ),
              suffixIcon: IconButton(
                onPressed: () => delegate._queryTextController.text = '',
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black45,
                ),
              ),
              hintText: delegate.hintText() ?? 'Buscar',
              hintStyle: context.textStyles.subtitle1.medium.lightGrey,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(UISize.p128);
}
