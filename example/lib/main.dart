import 'package:flutter/material.dart';

import 'required_validation_container.dart';
import 'min_validation_container.dart';
import 'max_validation_container.dart';
import 'email_validation_container.dart';
import 'min_length_validation_container.dart';
import 'max_length_validation_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          hasFloatingPlaceholder: true,
          border: OutlineInputBorder(),
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Validtors Example'),
        ),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      children: <Widget>[
        SizedBox(height: 8),
        RequiredValidationContainer(),
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
        MinValidationContainer(),
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
        MaxValidationContainer(),
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
        EmailValidationContainer(),
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
        MinLengthValidationContainer(),
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
        MaxLengthValidationContainer(),
      ],
    );
  }
}
