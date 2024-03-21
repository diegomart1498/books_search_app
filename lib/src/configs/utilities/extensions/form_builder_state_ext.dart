part of '../package.dart';

extension FormBuilderFields on GlobalKey<FormBuilderState> {
  String getString(String field) =>
      currentState!.fields[field]?.value.toString() ?? '';

  String getStringTrimmed(String field) {
    final String? value = currentState!.fields[field]?.value;
    if (value == null) return '';
    return value.toString().trim();
  }
}
