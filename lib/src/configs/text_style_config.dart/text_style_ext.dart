import 'package:flutter/material.dart';

/// Helper extension that allows to use a text style like:
/// `context.textStyles.h1`
extension TextStyles on BuildContext {
  /// The list of text styles available to the app
  TextStylesExt get textStyles => TextStylesExt(
        h1: _h1,
        h2: _h2,
        h3: _h3,
        h4: _h4,
        h5: _h5,
        h6: _h6,
        bodyText1: _bodyText1,
        bodyText2: _bodyText2,
        caption: _caption,
        button: _button,
        subtitle1: _subtitle1,
        subtitle2: _subtitle2,
        overline: _overline,
      );

  TextTheme get _textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
  IconThemeData get iconThemeData => Theme.of(this).iconTheme;

  TextStyle get _h1 => _textTheme.displayLarge!;
  TextStyle get _h2 => _textTheme.displayMedium!;
  TextStyle get _h3 => _textTheme.displaySmall!;
  TextStyle get _h4 => _textTheme.headlineMedium!;
  TextStyle get _h5 => _textTheme.headlineSmall!;
  TextStyle get _h6 => _textTheme.titleLarge!;
  TextStyle get _bodyText1 => _textTheme.bodyLarge!;
  TextStyle get _bodyText2 => _textTheme.bodyMedium!;
  TextStyle get _caption => _textTheme.bodySmall!;
  TextStyle get _button => _textTheme.labelLarge!;
  TextStyle get _subtitle1 => _textTheme.titleMedium!;
  TextStyle get _subtitle2 => _textTheme.titleSmall!;
  TextStyle get _overline => _textTheme.labelSmall!;
}

class TextStylesExt {
  const TextStylesExt({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    required this.h6,
    required this.bodyText1,
    required this.bodyText2,
    required this.caption,
    required this.button,
    required this.overline,
    required this.subtitle1,
    required this.subtitle2,
  });

  /// See [TextTheme.displayLarge].
  final TextStyle h1;

  /// See [TextTheme.displayMedium].
  final TextStyle h2;

  /// See [TextTheme.displaySmall].
  final TextStyle h3;

  /// See [TextTheme.headlineMedium].
  final TextStyle h4;

  /// See [TextTheme.headlineSmall].
  final TextStyle h5;

  /// See [TextTheme.titleLarge].
  final TextStyle h6;

  /// See [TextTheme.bodyLarge].
  final TextStyle bodyText1;

  /// See [TextTheme.bodyMedium].
  final TextStyle bodyText2;

  /// See [TextTheme.bodySmall].
  final TextStyle caption;

  /// See [TextTheme.labelLarge].
  final TextStyle button;

  /// See [TextTheme.labelSmall].
  final TextStyle overline;

  /// See [TextTheme.titleMedium].
  final TextStyle subtitle1;

  /// See [TextTheme.titleSmall].
  final TextStyle subtitle2;
}

/// Converts in a simple way a textStyle to the desired font weight.
///
/// Example usage:
/// `context.textStyles.h1.semiBold`
extension FontWeights on TextStyle {
  /// Black, the most thick
  TextStyle get thick => copyWith(fontWeight: FontWeight.w900);

  /// Extra-bold
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  /// Bold
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Semi-bold
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Medium
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Normal, regular, plain
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  /// Light
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Extra-light
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);

  /// Thin, the least thick
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
}

/// Converts in a simple way a textStyle to the desired font style.
///
/// Example usage:
/// `context.textStyles.h1.italic`
extension FontStyles on TextStyle {
  /// Use the upright glyphs
  TextStyle get normal => copyWith(fontStyle: FontStyle.normal);

  /// Use glyphs designed for slanting
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

extension FontColor on TextStyle {
  TextStyle get black => copyWith(color: Colors.black87);

  TextStyle get white => copyWith(color: Colors.white);

  TextStyle get grey => copyWith(color: Colors.black54);
}
