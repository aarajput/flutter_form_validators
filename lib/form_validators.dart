library form_validators;

import 'package:flutter/widgets.dart' show FormFieldValidator;

class Validators {
  static FormFieldValidator<String> required(String errorMessage) {
    return (value) {
      if (value.isEmpty)
        return errorMessage;
      else
        return null;
    };
  }
}
