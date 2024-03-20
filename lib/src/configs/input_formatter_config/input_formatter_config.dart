import 'package:flutter/services.dart';

class InputFormatterConfig {
  static FilteringTextInputFormatter onlyNumbers =
      FilteringTextInputFormatter.allow(RegExp(r'^\d+'));

  static FilteringTextInputFormatter nameCharacters =
      FilteringTextInputFormatter.allow(
    RegExp(r"^[a-zA-ZáéíóúüÜÁÉÍÓÚÁÉÍÓÚñÑ_'_. ]*"),
  );

  static FilteringTextInputFormatter emailCharacters =
      FilteringTextInputFormatter.allow(
    RegExp(r"^[a-zA-ZáéíóúüÜÁÉÍÓÚÁÉÍÓÚñÑ'._@0-9]*"),
  );

  static FilteringTextInputFormatter linkCharacters =
      FilteringTextInputFormatter.allow(
    RegExp(r"^[a-zA-Z.&/_?!=%@$~:;')(+#0-9-\]\[]*"),
  );
}
