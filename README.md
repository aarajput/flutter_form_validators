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

### Required

`Validators.required` is used to make sure that TextFormField is non-empty.
