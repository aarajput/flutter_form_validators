## Examples
### Utility Functions
- [Required](#required)
- [Minimum](#minimum)
- [Maximum](#maximum)
- [Email](#email)
- [Minimum Length](#minimum-length)
- [Maximum Length](#maximum-length)
- [Pattern](#pattern)
- [Compose](#compose)



### Required
###### lib/required_validation_container.dart
```dart
Form(
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
```

### Minimum
###### lib/min_validation_container.dart
```dart
Form(
  key: formKey,
  child: Column(
    children: [
      TextFormField(
        keyboardType: TextInputType.numberWithOptions(
          decimal: true,
          signed: true,
        ),
        decoration: InputDecoration(
          labelText: 'Minimum 5',
        ),
        validator: Validators.min(5, 'Value less than 5 not allowed'),
      ),
      RaisedButton(
        child: Text('Validate Minimum 5 Field'),
        onPressed: () {
          formKey.currentState.validate();
        },
      )
    ],
  ),
);
```


### Maximum
###### lib/max_validation_container.dart
```dart
Form(
  key: formKey,
  child: Column(
    children: [
      TextFormField(
        keyboardType: TextInputType.numberWithOptions(
          decimal: true,
          signed: true,
        ),
        decoration: InputDecoration(
          labelText: 'Maximum 5',
        ),
        validator: Validators.max(5, 'Value greater than 5 not allowed'),
      ),
      RaisedButton(
        child: Text('Validate Maximum 5 Field'),
        onPressed: () {
          formKey.currentState.validate();
        },
      )
    ],
  ),
);
```

### Email
###### lib/email_validation_container.dart
```dart
Form(
  key: formKey,
  child: Column(
    children: [
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
        ),
        validator: Validators.email('Invalid email address'),
      ),
      RaisedButton(
        child: Text('Validate email Field'),
        onPressed: () {
          formKey.currentState.validate();
        },
      )
    ],
  ),
);
```

### Minimum Length
###### lib/min_length_validation_container.dart
```dart
Form(
  key: formKey,
  child: Column(
    children: [
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Minimum length 5',
        ),
        validator: Validators.minLength(5, 'Characters are less than 5'),
      ),
      RaisedButton(
        child: Text('Validate Minimum length 5 Field'),
        onPressed: () {
          formKey.currentState.validate();
        },
      )
    ],
  ),
);
```

### Maximum Length
###### lib/max_length_validation_container.dart
```dart
Form(
  key: formKey,
  child: Column(
    children: [
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Maximum length 5',
        ),
        validator: Validators.maxLength(5, 'Characters are greater than 5'),
      ),
      RaisedButton(
        child: Text('Validate Maximum length 5 Field'),
        onPressed: () {
          formKey.currentState.validate();
        },
      )
    ],
  ),
);
```

### Pattern
###### lib/pattern_validation_container.dart
```dart
Form(
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
```


### Compose
###### lib/compose_validation_container.dart
```dart
Form(
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
```