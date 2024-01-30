import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sgold/components/no_account_text.dart';
import 'package:sgold/utils/constants/text_strings.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(TTexts.kEmailNullError)) {
                setState(() {
                  errors.remove(TTexts.kEmailNullError);
                });
              } else if (TTexts.emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(TTexts.kInvalidEmailError)) {
                setState(() {
                  errors.remove(TTexts.kInvalidEmailError);
                });
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(TTexts.kEmailNullError)) {
                setState(() {
                  errors.add(TTexts.kEmailNullError);
                });
              } else if (!TTexts.emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(TTexts.kInvalidEmailError)) {
                setState(() {
                  errors.add(TTexts.kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.mail),
            ),
          ),
          const SizedBox(height: 8),
          // FormError(errors: errors),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Do what you want to do
              }
            },
            child: const Text("Continue"),
          ),
          const SizedBox(height: 16),
          const NoAccountText(),
        ],
      ),
    );
  }
}
