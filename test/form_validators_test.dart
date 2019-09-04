import 'package:flutter_test/flutter_test.dart';

import 'package:form_validators/form_validators.dart';

void main() {
  test('Test Validators.required', () {
    final errorMessage = 'Field is required';
    expect(Validators.required(errorMessage)(''), errorMessage);
    expect(Validators.required(errorMessage)('any value'), null);
  });

  test('Test Validators.min', () {
    final errorMessage = 'Value less than 3 not allowed';
    expect(Validators.min(3, errorMessage)(''), null);
    expect(Validators.min(3, errorMessage)(' '), null);
    expect(Validators.min(3, errorMessage)(' 2'), errorMessage);
    expect(Validators.min(3, errorMessage)('1,000.2'), null);
    expect(Validators.min(3, errorMessage)('1,000. 2'), null);
    expect(Validators.min(3, errorMessage)('2'), errorMessage);
    expect(Validators.min(3, errorMessage)('3'), null);
    expect(Validators.min(3, errorMessage)('4'), null);
  });

  test('Test Validators.max', () {
    final errorMessage = 'Value greater than 3 not allowed';
    expect(Validators.max(3, errorMessage)(''), null);
    expect(Validators.max(3, errorMessage)(' '), null);
    expect(Validators.max(3, errorMessage)(' 2'), null);
    expect(Validators.max(3, errorMessage)('1,000.2'), errorMessage);
    expect(Validators.max(3, errorMessage)('1,000. 2'), errorMessage);
    expect(Validators.max(3, errorMessage)('2'), null);
    expect(Validators.max(3, errorMessage)('3'), null);
    expect(Validators.max(3, errorMessage)('4'), errorMessage);
  });

  test('Test Validators.email', () {
    final errorMessage = 'Invalid email address';
    expect(Validators.email(errorMessage)('test'), errorMessage);
    expect(Validators.email(errorMessage)('test@example'), null);
    expect(Validators.email(errorMessage)('@example'), errorMessage);
    expect(Validators.email(errorMessage)('text@example.'), errorMessage);
    expect(Validators.email(errorMessage)('text@example.com'), null);
    expect(Validators.email(errorMessage)('example.com'), errorMessage);
    expect(Validators.email(errorMessage)('@example.com'), errorMessage);
  });

  test('Test Validators.minLength', () {
    final errorMessage = 'Characters count is less than 3';
    expect(Validators.minLength(3, errorMessage)(''), null);
    expect(Validators.minLength(3, errorMessage)('a'), errorMessage);
    expect(Validators.minLength(3, errorMessage)('ab'), errorMessage);
    expect(Validators.minLength(3, errorMessage)('abc'), null);
    expect(Validators.minLength(3, errorMessage)('abcd'), null);
    expect(Validators.minLength(3, errorMessage)('abcde'), null);
  });

  test('Test Validators.maxLength', () {
    final errorMessage = 'Characters count is greater than 3';
    expect(Validators.maxLength(3, errorMessage)(''), null);
    expect(Validators.maxLength(3, errorMessage)('a'), null);
    expect(Validators.maxLength(3, errorMessage)('ab'), null);
    expect(Validators.maxLength(3, errorMessage)('abc'), null);
    expect(Validators.maxLength(3, errorMessage)('abcd'), errorMessage);
    expect(Validators.maxLength(3, errorMessage)('abcde'), errorMessage);
  });

  test('Test Validators.patternString', () {
    final errorMessage = 'Invalid value';
    final regexString = r"^[A-Za-z]+$";
    expect(Validators.patternString(regexString, errorMessage)(''), null);
    expect(Validators.patternString(regexString, errorMessage)('a'), null);
    expect(Validators.patternString(regexString, errorMessage)('A'), null);
    expect(Validators.patternString(regexString, errorMessage)('abc'), null);
    expect(Validators.patternString(regexString, errorMessage)('AbC'), null);
    expect(Validators.patternString(regexString, errorMessage)('a1'),
        errorMessage);
    expect(Validators.patternString(regexString, errorMessage)('1a'),
        errorMessage);
    expect(Validators.patternString(regexString, errorMessage)('1a'),
        errorMessage);
    expect(Validators.patternString(regexString, errorMessage)('#()%'),
        errorMessage);
  });

  test('Test Validators.compose', () {
    final errorMessageRequired = 'Field is required';
    final errorMessageMin = 'Value less than 3 not allowed';
    final errorMessageMax = 'Value greater than 6 not allowed';
    final errorMessageEmail = 'Invalid email address';
    final errorMessageMinLength = 'Characters count is less than 3';
    final errorMessageMaxLength = 'Characters count is greater than 6';

    expect(Validators.compose([])(''), null);
    // required + email
    expect(
        Validators.compose([
          Validators.required(errorMessageRequired),
          Validators.email(errorMessageEmail),
        ])(''),
        errorMessageRequired);
    expect(
        Validators.compose([
          Validators.required(errorMessageRequired),
          Validators.email(errorMessageEmail),
        ])('ali@m..'),
        errorMessageEmail);
    expect(
        Validators.compose([
          Validators.required(errorMessageRequired),
          Validators.email(errorMessageEmail),
        ])('ali@m.c'),
        null);

    // required + minLength + maxLength
    expect(
        Validators.compose([
          Validators.required(errorMessageRequired),
          Validators.minLength(3, errorMessageMinLength),
          Validators.maxLength(6, errorMessageMaxLength),
        ])(''),
        errorMessageRequired);
    expect(
        Validators.compose([
          Validators.required(errorMessageRequired),
          Validators.minLength(3, errorMessageMinLength),
          Validators.maxLength(6, errorMessageMaxLength),
        ])('ab'),
        errorMessageMinLength);
    expect(
        Validators.compose([
          Validators.required(errorMessageRequired),
          Validators.minLength(3, errorMessageMinLength),
          Validators.maxLength(6, errorMessageMaxLength),
        ])('abcdefg'),
        errorMessageMaxLength);
    expect(
        Validators.compose([
          Validators.required(errorMessageRequired),
          Validators.minLength(3, errorMessageMinLength),
          Validators.maxLength(6, errorMessageMaxLength),
        ])('abcde'),
        null);

    // optional + min + max
    expect(
        Validators.compose([
          Validators.min(3, errorMessageMin),
          Validators.max(6, errorMessageMax),
        ])(''),
        null);
    expect(
        Validators.compose([
          Validators.min(3, errorMessageMin),
          Validators.max(6, errorMessageMax),
        ])('1'),
        errorMessageMin);
    expect(
        Validators.compose([
          Validators.min(3, errorMessageMin),
          Validators.max(6, errorMessageMax),
        ])('7'),
        errorMessageMax);
    expect(
        Validators.compose([
          Validators.min(3, errorMessageMin),
          Validators.max(6, errorMessageMax),
        ])('6'),
        null);
  });
}
