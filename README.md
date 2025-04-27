# Form Validators
A Flutter plugin which provides a set of validators that can be used by form fields.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Unit Test](https://img.shields.io/badge/unit%20tests-passing-green)
[![Author](https://img.shields.io/badge/author-wisecrab-green)](https://wisecrab.com)

## About
This flutter plugin provides utility functions to make form validation easy. This plugin was inspired by Angular Validators class.

## Version
This plugin supports dart version 2.2+

## How to use Form Validators

### For Example:
#### Validating if TextFormField is non-empty and has a valid email address
```dart
TextFormField(
  decoration: InputDecoration(
    labelText: 'Email',
  ),
  validator: Validators.compose([
    Validators.required('Email is required'),
    Validators.email('Invalid email address'),
  ]),
),
```

## Api Overview
### Utility Functions
- [Required](#required)
- [Minimum](#minimum)
- [Maximum](#maximum)
- [Email](#email)
- [Minimum Length](#minimum-length)
- [Maximum Length](#maximum-length)
- [Pattern](#pattern)
- [Match](#match)
- [Compose](#compose)

All validator functions have return type of `FormFieldValidator<String>` which is a required type for `validator` field in `TextFormField`.

___

### Required
`Validators.required(String errorMessage)` is validator that requires the field have a non-empty value.

#### Example
This code will validate the name and show error if it is empty.
```dart
TextFormField(
  decoration: InputDecoration(
    labelText: 'Name',
  ),
  validator: Validators.required('Name is required'),
),
```
#### Parameters

| Params       | Description                                                                                  |
| ------------ | -------------------------------------------------------------------------------------------- |
| errorMessage | `String` value is passed to this parameter to show an error in case of a validation failure. |

___

### Minimum
`Validators.min(double min, String errorMessage)` is a validator that requires the field's value be greater than or equal to the provided number (`double min`).  TextFormField's value must be an integer or double otherwise this validator will throw a parse exception.

#### Example
This code will validate a TextFormField's value and show an error in case its value is non-empty and less than 5.
```dart
  TextFormField(
    keyboardType: TextInputType.numberWithOptions(
      decimal: true,
      signed: true,
    ),
    decoration: InputDecoration(
      labelText: 'Minimum 5',
    ),
    validator: Validators.min(5, 'Value less than 5 not allowed'),
  ),

```

#### Parameters
`Validators.min` takes two parameters.

| Params       | Description                                                                                                                           |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------- |
| min          | `double` value is passed to this param. Validator will return an error if TextFormField is non-empty and its value is less than `min` |
| errorMessage | `String` value is passed to this parameter to show an error in case of a validation failure                                           |

---

### Maximum
`Validators.max(double max, String errorMessage)` is a validator that requires the field's value to be less than or equal to the provided number (`double max`). TextFormField's value must be an integer or double otherwise this validator will throw a parse exception.

#### Example
This code will validate TextFormField's value and show an error in case its value is non-empty and greater than 5.
```dart
  TextFormField(
    keyboardType: TextInputType.numberWithOptions(
      decimal: true,
      signed: true,
    ),
    decoration: InputDecoration(
      labelText: 'Maximum 5',
    ),
    validator: Validators.max(5, 'Value greater than 5 not allowed'),
  ),

```

#### Parameters
`Validators.max` takes two parameters.

| Params       | Description                                                                                                                              |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| max          | `double` value is passed to this param. Validator will return an error if TextFormField is non-empty and its value is greater than `max` |
| errorMessage | `String` value is passed to this parameter to show an error in case of validation failure                                                |

---

### Email
`Validators.email(String errorMessage)` is a validator that requires the field's value pass an email validation test. 

Its uses regex of HTML5 for email validation.
Its regex is ```^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$```

If you want to use custom regex for email validation, please take a look at [Pattern](#pattern).

#### Example
This code will validate the email and show an error if TextFormField's value is non-empty and the email address is invalid.
```dart
  TextFormField(
    decoration: InputDecoration(
      labelText: 'Email',
    ),
    validator: Validators.email('Invalid email address'),
  ),
```

#### Parameters

| Params       | Description                                                                                |
| ------------ | ------------------------------------------------------------------------------------------ |
| errorMessage | `String` value is passed to this parameter to show an error in case of validation failure. |


### Minimum Length
`Validators.minLength(int minLength, String errorMessage)` is a validator that requires the length of the field's value to be greater than or equal to the provided minimum length.

#### Example
This code will validate the TextFormField's value and show an error in case field's value is non-empty and its character length is less than 5.
```dart
  TextFormField(
    decoration: InputDecoration(
      labelText: 'Minimum length 5',
    ),
    validator: Validators.minLength(5, 'Characters are less than 5'),
  ),
```

#### Parameters

| Params       | Description                                                                                                                                              |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| minLength    | `int` value is passed to this param. Validator will return an error if TextFormField is non-empty and its number of characters is less than `minLength`. |
| errorMessage | `String` value is passed to this parameter to show error in case of validation failure.                                                                  |


### Maximum Length
`Validators.maxLength(int maxLength, String errorMessage)` is a validator that requires the length of the field's value to be less than or equal to the provided maximum length.

#### Example
This code will validate TextFormField's value and show an error in case the field's value is non-empty and its character length is greater than 5.
```dart
  TextFormField(
    decoration: InputDecoration(
      labelText: 'Maximum length 5',
    ),
    validator: Validators.maxLength(5, 'Characters are greater than 5'),
  ),
```

#### Parameters

| Params       | Description                                                                                                                                                          |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| maxLength    | `int` value is passed to this param. The validator will return an error if the TextFormField is non-empty and its number of characters are greater than `maxLength`. |
| errorMessage | `String` value is passed to this parameter to show error in case of validation failure.                                                                              |

---

### Pattern
`Validators.patternString(String pattern, String errorMessage)` and `Validators.patternRegExp(RegExp pattern, String errorMessage)` are validators that require the field's value to match a regex pattern.

In case of `Validators.patternString`, you need to pass regex like this `r"^[A-Za-z]+$"`

#### Examples
This code will validate the TextFormField's value and show an error in case the field's value is non-empty and it contains characters other than letters.
###### patternRegExp
```dart
  TextFormField(
    decoration: InputDecoration(
      labelText: 'Pattern r"^[A-Za-z]+\$"',
    ),
    validator: Validators.patternRegExp(
        RegExp(r"^[A-Za-z]+$"), 'Only alphabets are allowed'),
  ),

```

###### patternString
```dart
  TextFormField(
    decoration: InputDecoration(
      labelText: 'Pattern r"^[A-Za-z]+\$"',
    ),
    validator: Validators.patternString(
        r"^[A-Za-z]+$", 'Only alphabets are allowed'),
  ),
```

#### Parameters

| Params       | Description                                                                                                                                                                              |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| pattern      | `String` or `RegExp` the value is passed to this param. The validator will return an error if the TextFormField is non-empty and it's not matching the `pattern` that you have provided. |
| errorMessage | `String` value is passed to this parameter to show error in case of a validation failure.                                                                                                |

---

### Match
`Validators.match(String valueToCompare, String errorMessage)` is a validator that requires the field's value to match another value. This is particularly useful for password confirmation fields.

#### Example
This code will validate that the confirm password field matches the password field.
```dart
  TextFormField(
    decoration: InputDecoration(
      labelText: 'Confirm Password',
    ),
    obscureText: true,
    validator: Validators.compose([
      Validators.required('Confirm password is required'),
      Validators.match('password', 'Passwords do not match'),
    ]),
  ),
```

#### Parameters

| Params         | Description                                                                                                                                                |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| valueToCompare | `String` value is passed to this parameter. The validator will return an error if TextFormField is non-empty and its value doesn't match `valueToCompare`. |
| errorMessage   | `String` value is passed to this parameter to show error in case of a validation failure.                                                                  |

---

### Compose
`Validators.compose(List<FormFieldValidator<String>> validators)` composes multiple validators into a single validator.

#### How it works
This function takes multiple validators as a list and will validate each validator in the provided sequence. If any of its validator returns an error message, it won't check the remaining validators and will return this error to the `TextFormField`.

#### Example
This code will validate that _Name_ is non-empty and has a character length between 5 and 10.
```dart
  TextFormField(
    decoration: InputDecoration(
      labelText: 'Name',
    ),
    validator: Validators.compose([
      Validators.required('Name is required'),
      Validators.minLength(5, 'Name cannot be less than 5 characters'),
      Validators.maxLength(10, 'Name cannot be greater than 10 characters'),
    ]),
  ),
```

#### Parameters

| Params     | Description                                                                                                                        |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| validators | `List<FormFieldValidator<String>>` value is passed to this param containing validators that you want to combine into one validator |


---

#### **_Note:_**

>If `TextFormField`'s value is empty, then validators [Minimum](#minimum), [Maximum](#maximum), [Email](#email), [Minimum Length](#minimum-length), [Maximum Length](#maximum-length) and [Pattern](#pattern) won't return any error because it considers `TextFormField` as optional. Use these validators in combination with the [Required](#required) validator if the specified `TextFormField` is compulsory and you want a validation failure if the field is empty. Check [Compose](#compose) validator to find out how to merge multiple validators.

___