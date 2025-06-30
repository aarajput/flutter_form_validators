import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class TrimmedValidationContainer extends StatefulWidget {
  @override
  _TrimmedValidationContainerState createState() =>
      _TrimmedValidationContainerState();
}

class _TrimmedValidationContainerState
    extends State<TrimmedValidationContainer> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
            ),
            validator: Validators.trimmed(
                'Spaces at the beginning or end not allowed'),
          ),
          ElevatedButton(
            child: Text('Validate Trimmed field'),
            onPressed: () {
              formKey.currentState?.validate();
            },
          )
        ],
      ),
    );
  }
}
