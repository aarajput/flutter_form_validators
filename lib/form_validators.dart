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

  static FormFieldValidator<String> min(double min, String errorMessage) {
    return (value) {
      if (value.isEmpty)
        return null;
      else {
        final dValue = double.parse(value);
        if (dValue < min)
          return errorMessage;
        else
          return null;
      }
    };
  }
}
