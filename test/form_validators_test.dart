import 'package:flutter_test/flutter_test.dart';

import 'package:form_validators/form_validators.dart';

void main() {
  test('Test Validators.required', () {
    final errorMessage = 'Field is required';
    expect(Validators.required(errorMessage)(''), errorMessage);
    expect(Validators.required(errorMessage)('any value'), null);
  });

  test('Test Validators.min', () {
    final errorMessage = 'Value less than 3 not allowed ';
    expect(Validators.min(3, errorMessage)(''), null);
    expect(Validators.min(3, errorMessage)('2'), errorMessage);
    expect(Validators.min(3, errorMessage)('3'), null);
    expect(Validators.min(3, errorMessage)('4'), null);
  });
}
