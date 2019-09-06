import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class PatternValidationContainer extends StatefulWidget {
  @override
  _PatternValidationContainerState createState() =>
      _PatternValidationContainerState();
}

class _PatternValidationContainerState
    extends State<PatternValidationContainer> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Pattern r"^[A-Za-z]+\$"',
            ),
            validator: Validators.patternRegExp(
                RegExp(r"^[A-Za-z]+$"), 'Only alphabets are allowed'),
          ),
          RaisedButton(
            child: Text('Validate Pattern Field'),
            onPressed: () {
              formKey.currentState.validate();
            },
          )
        ],
      ),
    );
  }
}
