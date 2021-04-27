import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class EmailValidationContainer extends StatefulWidget {
  @override
  _EmailValidationContainerState createState() =>
      _EmailValidationContainerState();
}

class _EmailValidationContainerState extends State<EmailValidationContainer> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            validator: Validators.email('Invalid email address'),
          ),
          ElevatedButton(
            child: Text('Validate email Field'),
            onPressed: () {
              formKey.currentState?.validate();
            },
          )
        ],
      ),
    );
  }
}
