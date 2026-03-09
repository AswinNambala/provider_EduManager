import 'package:flutter/material.dart';

class AllTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? label;
  final bool readOnly;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final Widget? preffixIcon;
  final ValueChanged<String>? onChange;

  const AllTextFormField({
    super.key,
    required this.controller,
    this.hint = "",
    this.label,
    this.validator,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.preffixIcon,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 0.5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            readOnly: readOnly,
            onTap: onTap,
            onChanged: onChange,
            
            decoration: InputDecoration(
              labelText: label,
              prefixIcon: preffixIcon,
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
