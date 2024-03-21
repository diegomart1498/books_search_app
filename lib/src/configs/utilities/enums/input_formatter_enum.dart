part of '../package.dart';

enum InputFormatter {
  name,
  email,
  number,
  address,
  link;

  bool get isNumber => this == InputFormatter.number;

  TextInputFormatter get formatter => formatterList[this]!;

  static Map<InputFormatter, TextInputFormatter> formatterList = {
    InputFormatter.name: InputFormatterConfig.nameCharacters,
    InputFormatter.email: InputFormatterConfig.emailCharacters,
  };
}
