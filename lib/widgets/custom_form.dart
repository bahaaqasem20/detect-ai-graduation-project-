import 'package:detectai_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFormField {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  CustomFormField({
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
  });
}

class CustomForm extends StatefulWidget {
  final List<CustomFormField> fields;
  final void Function(Map<String, String>) onSubmit;
  final String buttonText;

  const CustomForm({
    super.key,
    required this.fields,
    required this.onSubmit,
    this.buttonText = 'Next',
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ...widget.fields.map((field) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: field.controller,
                          obscureText: field.obscureText,
                          keyboardType: field.keyboardType,
                          validator: field.validator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: field.label,
                            suffixIcon: field.suffixIcon,
                            labelStyle: TextStyle(color: AppColors.textLight),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),

                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: isMobile ? double.infinity : 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: AppColors.button,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final values = {
                              for (var field in widget.fields)
                                field.label: field.controller.text.trim(),
                            };
                            widget.onSubmit(values);
                          }
                        },
                        child: Text(
                          widget.buttonText,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.textLight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
