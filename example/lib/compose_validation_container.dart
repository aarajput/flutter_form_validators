import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class ComposeValidationContainer extends StatefulWidget {
  @override
  _ComposeValidationContainerState createState() =>
      _ComposeValidationContainerState();
}

class _ComposeValidationContainerState
    extends State<ComposeValidationContainer> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Compose',
            ),
            validator: Validators.compose([
              Validators.required('Compose is required'),
              Validators.minLength(5, 'Characters cannot be less than 5'),
              Validators.maxLength(10, 'Characters cannot be greater than 10'),
            ]),
          ),
          RaisedButton(
            child: Text('Validate compose Field'),
            onPressed: () {
              formKey.currentState.validate();
            },
          )
        ],
      ),
    );
  }
}
