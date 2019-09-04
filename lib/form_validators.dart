library form_validators;

import 'package:flutter/widgets.dart' show FormFieldValidator;

/// Provides a set of built-in validators that can be used by form fields.
///
/// A validator is a function that processes a `FormField`
/// and returns an error [String] or null. A null [String] means that validation has passed.
class Validators {
  /// Validator that requires the field have a non-empty value.
  ///
  /// ### Validate that the field is non-empty
  ///
  ///
  /// ```dart
  ///          TextFormField(
  ///              labelText: 'Required',
  ///            ),
  ///            validator: Validators.required('Field is required'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> required(String errorMessage) {
    return (value) {
      if (value.isEmpty)
        return errorMessage;
      else
        return null;
    };
  }

  /// Validator that requires the field's value to be greater than or equal to the provided number.
  ///
  /// ### Validate against a minimum of 5
  ///
  ///
  /// ```dart
  ///           TextFormField(
  ///            keyboardType: TextInputType.numberWithOptions(
  ///              decimal: true,
  ///              signed: true,
  ///            ),
  ///            decoration: InputDecoration(
  ///              labelText: 'Minimum 5',
  ///            ),
  ///            validator: Validators.min(5, 'Value less than 5 not allowed'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> min(double min, String errorMessage) {
    return (value) {
      if (value.trim().isEmpty)
        return null;
      else {
        final dValue = _toDouble(value);
        if (dValue < min)
          return errorMessage;
        else
          return null;
      }
    };
  }

  /// Validator that requires the field's value to be less than or equal to the provided number.
  ///
  /// ### Validate against a maximum of 5
  ///
  /// ``` dart
  ///           TextFormField(
  ///            keyboardType: TextInputType.numberWithOptions(
  ///              decimal: true,
  ///              signed: true,
  ///            ),
  ///            decoration: InputDecoration(
  ///              labelText: 'Maximum 5',
  ///            ),
  ///            validator: Validators.max(5, 'Value greater than 5 not allowed'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> max(double max, String errorMessage) {
    return (value) {
      if (value.trim().isEmpty)
        return null;
      else {
        final dValue = _toDouble(value);
        if (dValue > max)
          return errorMessage;
        else
          return null;
      }
    };
  }

  /// Validator that requires the field's value pass an email validation test.
  ///
  /// This validator uses Regex of HTML5 email validator.
  ///
  /// ```dart
  /// RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  /// ```
  ///
  /// ### Validate that the field matches a valid email pattern
  ///
  /// ```dart
  ///           TextFormField(
  ///            decoration: InputDecoration(
  ///              labelText: 'Email',
  ///            ),
  ///            validator: Validators.email('Invalid email address'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> email(String errorMessage) {
    return (value) {
      if (value.trim().isEmpty)
        return null;
      else {
        final emailRegex = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
        if (emailRegex.hasMatch(value))
          return null;
        else
          return errorMessage;
      }
    };
  }


  static FormFieldValidator<String> minLength(
      int minLength, String errorMessage) {
    return (value) {
      if (value.isEmpty) return null;

      if (value.length < minLength)
        return errorMessage;
      else
        return null;
    };
  }

  static FormFieldValidator<String> maxLength(
      int maxLength, String errorMessage) {
    return (value) {
      if (value.isEmpty) return null;

      if (value.length > maxLength)
        return errorMessage;
      else
        return null;
    };
  }

  static FormFieldValidator<String> patternString(
      String pattern, String errorMessage) {
    return patternRegExp(RegExp(pattern), errorMessage);
  }

  static FormFieldValidator<String> patternRegExp(
      RegExp pattern, String errorMessage) {
    return (value) {
      if (value.isEmpty) return null;

      if (pattern.hasMatch(value))
        return null;
      else
        return errorMessage;
    };
  }

  static FormFieldValidator<String> compose(
      List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  // -------------------- private functions ---------------------- //

  static double _toDouble(String value) {
    value = value.replaceAll(' ', '').replaceAll(',', '');
    return double.parse(value);
  }
}
