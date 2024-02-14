import 'package:flutter/material.dart';
import 'package:sgold/Account/forgot_password/forgot_password_screen.dart';
import 'package:sgold/Account/login_sucess/login_sucess_screen.dart';
import 'package:sgold/Account/components/form_error.dart';
import 'package:sgold/utils/constants/colors.dart';
import 'package:sgold/utils/constants/text_strings.dart';
import 'package:sgold/utils/device/device_utility.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

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
              if (value.isNotEmpty) {
                removeError(error: TTexts.kEmailNullError);
              } else if (TTexts.emailValidatorRegExp.hasMatch(value)) {
                removeError(error: TTexts.kInvalidEmailError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: TTexts.kEmailNullError);
                return "";
              } else if (!TTexts.emailValidatorRegExp.hasMatch(value)) {
                addError(error: TTexts.kInvalidEmailError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.mail),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: TTexts.kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: TTexts.kShortPassError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: TTexts.kPassNullError);
                return "";
              } else if (value.length < 8) {
                addError(error: TTexts.kShortPassError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: TColors.secondary,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(TColors.secondary),
              foregroundColor: MaterialStateProperty.all(Colors.black), // Set text color to black
              side: MaterialStateProperty.all(BorderSide.none),
              fixedSize: MaterialStateProperty.all(Size(200, 50)), 
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                TDeviceUtils.hideKeyboard(context);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
            child: const Text("Continue",style: TextStyle(fontSize: 14),),
          ),
        ],
      ),
    );
  }
}
