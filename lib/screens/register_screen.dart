import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common_widgets/custom_button.dart';
import '../common_widgets/custom_text_field.dart';
import '../main.dart';
import '../models/user_model.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            bottom: const PreferredSize(
              preferredSize: Size.zero,
              child: Text("Registration Form",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    onValidate: (value) =>
                        value!.isEmpty ? "Please enter name" : null,
                    controller: nameController,
                    label: 'Name',
                    hint: 'Name',
                    inputType: TextInputType.text,
                  ),
                  CustomTextField(
                    onValidate: (String? value) {
                      if (value !.isEmpty) {
                        return 'please enter email';
                      }
                      if (!EmailValidator.validate(value)) {
                        return 'please enter valid email';
                      }
                      return null;
                    },
                    controller: emailController,
                    label: 'Email',
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                  ),
                  CustomTextField(
                    onValidate: (value) =>
                        value!.isEmpty ? "Please enter gender" : null,
                    controller: genderController,
                    label: 'Gender',
                    hint: 'Gender',
                    inputType: TextInputType.text,
                  ),
                  CustomTextField(
                    onValidate: (value) => value!.length < 6
                        ? "Please enter a password with 6+ chars long"
                        : null,
                    controller: passwordController,
                    label: 'password',
                    hint: 'Enter password',
                    inputType: TextInputType.text,
                    isPassword: true,
                    passwordVisible: passwordVisible,
                    onVisibleIconTap: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  authProvider.status == Status.registering
                      ? const Center(
                    child: CircularProgressIndicator(),
                  ):CustomButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        UserModel? userModel = await authProvider.registerWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                        );

                        if (userModel == null) {
                          final _context = MyApp.navKey.currentContext;
                          const snackBar = SnackBar(
                            content: Text('Invalid email and/or password'),

                          );


                          ScaffoldMessenger.of(_context!).showSnackBar(snackBar);
                        }else{
                          Navigator.pop(context);
                        }
                      }
                    },
                    color: const Color(0xffFF0065),
                    textColor: Colors.white,
                    label: 'Next',
                  ),
                  CustomButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    color: const Color(0xffF3F7FF),
                    textColor: const Color(0xff73A4FF),
                    label: 'back to login form',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
