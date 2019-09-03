import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';

class MaxValidationContainer extends StatefulWidget {
  @override
  _MaxValidationContainerState createState() => _MaxValidationContainerState();
}

class _MaxValidationContainerState extends State<MaxValidationContainer> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            decoration: InputDecoration(
              labelText: 'Maximun 5',
            ),
            validator: Validators.max(5, 'Value greater than 5 not allowed'),
          ),
          RaisedButton(
            child: Text('Validate Maximun 5 Field'),
            onPressed: () {
              formKey.currentState.validate();
            },
          )
        ],
      ),
    );
  }
}
