import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';

class MinValidationContainer extends StatefulWidget {
  @override
  _MinValidationContainerState createState() => _MinValidationContainerState();
}

class _MinValidationContainerState extends State<MinValidationContainer> {
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
              labelText: 'Minimun 5',
            ),
            validator: Validators.min(5, 'Value less than 5 not allowed'),
          ),
          RaisedButton(
            child: Text('Validate Minimun 5 Field'),
            onPressed: () {
              formKey.currentState.validate();
            },
          )
        ],
      ),
    );
  }
}
