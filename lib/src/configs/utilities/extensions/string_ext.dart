part of '../package.dart';

extension StringExtension on String {
  String get toCapitalize {
    if (isEmpty) return this;
    final firstLetter = substring(0, 1).toUpperCase();
    final remain = substring(1);
    return '$firstLetter$remain';
  }

  String get titleCase => ReCase(this).titleCase;

  String get camelCase => ReCase(this).camelCase;
}
