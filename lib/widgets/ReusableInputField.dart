import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/input_field_type.dart';

class ReusableInputField extends StatelessWidget {
  final String label;
  final InputFieldType type;
  final bool isHalfWidth;
  final TextEditingController controller;
  final List<String>? dropdownItems;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  const ReusableInputField({
    super.key,
    required this.label,
    required this.type,
    required this.controller,
    this.isHalfWidth = false,
    this.dropdownItems,
    this.validator,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = isHalfWidth
        ? (MediaQuery.of(context).size.width / 2) - 24
        : double.infinity;

    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: _buildField(context),
      ),
    );
  }

  Widget _buildField(BuildContext context) {
    switch (type) {
      case InputFieldType.dropdown:
        return DropdownButtonFormField<String>(
          value: controller.text.isNotEmpty ? controller.text : null,
          decoration: _inputDecoration(label),
          items: dropdownItems
              ?.map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: (value) {
            if (value != null) controller.text = value;
          },
        );
      case InputFieldType.date:
        return TextFormField(
          controller: controller,
          readOnly: true,
          decoration: _inputDecoration(label, icon: Icons.calendar_today),
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (picked != null) {
              controller.text = DateFormat('yyyy-MM-dd').format(picked);
            }
          },
        );
      case InputFieldType.location:
        return TextFormField(
          controller: controller,
          readOnly: onTap != null,
          onTap: onTap,
          decoration: _inputDecoration(label, icon: Icons.location_on),
        );
      case InputFieldType.number:
        return TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: _inputDecoration(label),
        );
      case InputFieldType.text:
      // ignore: unreachable_switch_default
      default:
        return TextFormField(
          controller: controller,
          decoration: _inputDecoration(label),
        );
    }
  }

  InputDecoration _inputDecoration(String label, {IconData? icon}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: icon != null ? Icon(icon) : null,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    );
  }
}
