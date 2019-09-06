import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class RequiredValidationContainer extends StatefulWidget {
  @override
  _RequiredValidationContainerState createState() =>
      _RequiredValidationContainerState();
}

class _RequiredValidationContainerState
    extends State<RequiredValidationContainer> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Required',
            ),
            validator: Validators.required('Field is required'),
          ),
          RaisedButton(
            child: Text('Validate Required Field'),
            onPressed: () {
              formKey.currentState.validate();
            },
          )
        ],
      ),
    );
  }
}
