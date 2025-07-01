library wc_form_validators;

import 'package:flutter/widgets.dart' show FormFieldValidator;

/// Provides a set of built-in validators that can be used by form fields.
///
///
/// A validator is a function that processes a `FormField`
/// and returns an error [String] or null. A null [String] means that validation has passed.
class Validators {
  /// Validator that requires the field have a non-empty value.
  ///
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
      if (value == null) {
        value = '';
      }
      if (value.isEmpty)
        return errorMessage;
      else
        return null;
    };
  }

  /// Validator that requires the field's value to be greater than or equal to the provided number.
  ///
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
      if (value == null) {
        value = '';
      }
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
      if (value == null) {
        value = '';
      }
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
      if (value == null) {
        value = '';
      }
      if (value.isEmpty)
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

  /// Validator that requires the length of the field's value to be greater than or equal
  /// to the provided minimum length.
  ///
  ///
  /// ### Validate that the field has a minimum of 5 characters
  ///
  /// ```dart
  ///           TextFormField(
  ///            decoration: InputDecoration(
  ///              labelText: 'Minimum length 5',
  ///            ),
  ///            validator: Validators.minLength(5, 'Characters are less than 5'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> minLength(
      int minLength, String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.isEmpty) return null;

      if (value.length < minLength)
        return errorMessage;
      else
        return null;
    };
  }

  /// Validator that requires the length of the field's value to be less than or equal
  /// to the provided maximum length.
  ///
  ///
  /// ### Validate that the field has maximum of 5 characters
  ///
  /// ```dart
  ///           TextFormField(
  ///            decoration: InputDecoration(
  ///              labelText: 'Maximum length 5',
  ///            ),
  ///            validator: Validators.maxLength(5, 'Characters are greater than 5'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> maxLength(
      int maxLength, String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.isEmpty) return null;

      if (value.length > maxLength)
        return errorMessage;
      else
        return null;
    };
  }

  /// Validator that requires the field's value to match a regex pattern.
  ///
  ///
  /// Note that if a Regexp is provided, the Regexp is used as is to test the values.
  ///
  ///
  /// ### Validate that the field only contains alphabets
  ///
  /// ```dart
  ///           TextFormField(
  ///            decoration: InputDecoration(
  ///              labelText: 'Pattern r"^[A-Za-z]+\$"',
  ///            ),
  ///            validator: Validators.patternString(
  ///                r"^[A-Za-z]+$", 'Only alphabets are allowed'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> patternString(
      String pattern, String errorMessage) {
    return patternRegExp(RegExp(pattern), errorMessage);
  }

  /// Validator that requires the field's value to match another value.
  ///
  /// This is particularly useful for confirmation fields like password confirmation,
  /// email confirmation, etc.
  ///
  /// ### Validate that the field matches the expected value
  ///
  /// ```dart
  ///           TextFormField(
  ///             decoration: InputDecoration(
  ///               labelText: 'Confirm Value',
  ///             ),
  ///             validator: Validators.compose([
  ///               Validators.required('Confirmation is required'),
  ///               Validators.mustMatch('originalValue', 'Values do not match'),
  ///             ]),
  ///           ),
  /// ```
  ///
  static FormFieldValidator<String> mustMatch(
      String expectedValue, String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.isEmpty) return null;

      if (value != expectedValue)
        return errorMessage;
      else
        return null;
    };
  }

  /// Validator that requires the field's value to match a regex pattern.
  ///
  ///
  /// Note that if a Regexp is provided, the Regexp is used as is to test the values.
  ///
  ///
  /// ### Validate that the field only contains alphabets
  ///
  /// ```dart
  ///           TextFormField(
  ///            decoration: InputDecoration(
  ///              labelText: 'Pattern r"^[A-Za-z]+\$"',
  ///            ),
  ///            validator: Validators.patternRegExp(
  ///                RegExp(r"^[A-Za-z]+$"), 'Only alphabets are allowed'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> patternRegExp(
      RegExp pattern, String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.isEmpty) return null;

      if (pattern.hasMatch(value))
        return null;
      else
        return errorMessage;
    };
  }

  /// Validator that requires the field's value to not have spaces at the beginning or end
  ///
  ///
  /// ### Validate that the field does not have leading or trailing spaces
  ///
  /// ```dart
  ///           TextFormField(
  ///            decoration: InputDecoration(
  ///              labelText: 'Name',
  ///            ),
  ///            validator: Validators.trimmed('Spaces at the beginning or end not allowed'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> trimmed(String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.isEmpty)
        return null;
      else {
        if (value.trim() != value) {
          return errorMessage;
        }
        return null;
      }
    };
  }

  /// Compose multiple validators into a single validator.
  ///
  /// ### Validate that the field is non-empty and has character length between 5 and 10
  ///
  /// ```dart
  ///           TextFormField(
  ///            decoration: InputDecoration(
  ///              labelText: 'Compose',
  ///            ),
  ///            validator: Validators.compose([
  ///              Validators.required('Compose is required'),
  ///              Validators.minLength(5, 'Characters cannot be less than 5'),
  ///              Validators.maxLength(10, 'Characters cannot be greater than 10'),
  ///            ]),
  ///          ),
  /// ```
  ///
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
