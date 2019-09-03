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
    final errorMessage = 'Value less than 3 not allowed';
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
}
