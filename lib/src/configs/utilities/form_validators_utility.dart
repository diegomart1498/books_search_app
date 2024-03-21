part of 'package.dart';

class FormValidatorsUtility {
  static String? Function(dynamic) requiredField =
      FormBuilderValidators.required(
    errorText: 'Este campo no puede estar vacío.',
  );

  static String? Function(String?) email = FormBuilderValidators.email(
    errorText: 'Ingrese un correo electrónico válido.',
  );

  static String? Function(String?) passwordLenght =
      FormBuilderValidators.minLength(
    8,
    errorText: 'La contraseña debe tener al menos 8 carácteres.',
  );

  ///Composed validators
  static String? Function(String?) emailRequired =
      FormBuilderValidators.compose(
    [
      FormValidatorsUtility.requiredField,
      FormValidatorsUtility.email,
    ],
  );

  static String? Function(String?) passwordRequired =
      FormBuilderValidators.compose(
    [
      FormValidatorsUtility.requiredField,
      FormValidatorsUtility.passwordLenght,
    ],
  );
}
