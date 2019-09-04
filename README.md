# Form Validators
A Flutter plugin which provides a set of validators that can be used by form fields.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Unit Test](https://img.shields.io/badge/unit%20tests-passing-green)
[![Author](https://img.shields.io/badge/author-wisecrab-green)](https://wisecrab.com)

## About
This flutter plugin provides utility functions to make form validation easy. This plugin is inspiration from Angular Validators class.

## Version
This plugin supports dart version 2.2+

## How to use Form Validators

### For Example:
#### Validating if TextFormField is non-empty and has valid email address

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
- [Minimum](#minimun)
- [Maximum](#maximun)
- [Email](#email)
- [Minimum Length](#minimum-length)
- [Maximum Length](#maximum-length)
- [Pattern](#pattern)
- [Compose](#compose)

All validator functions have have return type of `FormFieldValidator<String>` which is required type for `validator` field in `TextFormField`.

___

### Required

`Validators.required(String errorMessage)` is used to make sure that TextFormField is non-empty.

#### Example
```dart
TextFormField(
  decoration: InputDecoration(
    labelText: 'Name',
  ),
  validator: Validators.required('Name is required'),
),
```
#### Documentation

| Params        | Description   |
| ------------- | ------------- |
| errorMessage  | `String` value is passed to to this parameter to show error in case of validation failure|

___

### Minimum
`Validators.min(double min, String errorMessage)` is used to make sure that TextFormField's value is greater than or equal to the provided number. Number can be integer or double.

#### Documentation
`Validators.min` takes two parameters.

| Params        | Description   |
| ------------- | ------------- |
|       min     | `double` value is passed to this param. Validator will return error if TextFormField is non-empty and its value is less than `min`|
| errorMessage  | `String` value is passed to to this parameter to show error in case of validation failure|

**_Note:_** _If `TextFormField`'s value is empty, then this validator won't return any error because it considers `TextFormField` as optional. Use this validation with combination of [Required](#required) validator if specified `TextFormField` is compulsory. Check [Compose](#compose) validator to find out how to combine two validators_

___