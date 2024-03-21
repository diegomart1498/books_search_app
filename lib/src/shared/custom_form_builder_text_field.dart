part of 'package.dart';

class CustomFormBuilderTextField extends StatelessWidget {
  const CustomFormBuilderTextField({
    required this.formName,
    required this.label,
    this.keyboardType,
    this.hintText,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.maxLenghtInput = 10,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.inputFormatter = InputFormatter.name,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    super.key,
  });

  final String formName;
  final String label;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String? value)? onChanged;
  final void Function(String? value)? onSubmitted;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final int maxLenghtInput;
  final InputFormatter inputFormatter;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: formName,
      onChanged: (value) {
        if (value?.length == maxLenghtInput && inputFormatter.isNumber) {
          FocusScope.of(context).unfocus();
        }
        if (onChanged != null) onChanged!(value);
      },
      minLines: 1,
      maxLines: maxLines,
      validator: validator,
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      keyboardType: _inputType(),
      autovalidateMode: autovalidateMode,
      inputFormatters: _inputFormatters(),
      style: context.textStyles.subtitle1.regular.black,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding,
        labelText: label,
        hintText: hintText ?? label,
        hintStyle: context.textStyles.subtitle1.medium.grey,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black54),
          borderRadius: BorderRadius.circular(UISize.p8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black54),
          borderRadius: BorderRadius.circular(UISize.p8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black54),
          borderRadius: BorderRadius.circular(UISize.p8),
        ),
      ),
    );
  }

  TextInputType _inputType() {
    if (inputFormatter.isNumber) return TextInputType.phone;
    return keyboardType ?? TextInputType.name;
  }

  List<TextInputFormatter> _inputFormatters() {
    return [
      inputFormatter.formatter,
      if (inputFormatter.isNumber)
        LengthLimitingTextInputFormatter(maxLenghtInput),
    ];
  }
}
