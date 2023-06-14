import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.hint,
      required this.inputType,
      this.passwordVisible,
      this.isPassword,
      this.onVisibleIconTap,
      required this.onValidate})
      : super(key: key);
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType inputType;
  final bool? passwordVisible;
  final bool? isPassword;
  final Function()? onVisibleIconTap;
  final String? Function(String?)? onValidate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Color(0xFF6A788E)),
          ),
          const SizedBox(
            height: 3,
          ),
          TextFormField(
            enableSuggestions: false,
            autocorrect: false,
            validator: onValidate,
            obscureText: passwordVisible ?? false,
            keyboardType: TextInputType.emailAddress,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: isPassword != null
                  ? IconButton(
                      icon: Icon(
                        passwordVisible!
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: onVisibleIconTap)
                  : const SizedBox(),
              hintText: hint,
              hintStyle: const TextStyle(color: Color(0xFF959EAE)),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFCE6E9EC),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
