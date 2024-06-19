import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constans/colors_constans.dart';
import '../utls/app_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final String label;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final bool? obscure;
  final IconButton? iconButton;
  final TextInputType? keyboardType;
  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.label,
    required this.validator,
    required this.controller,
    this.obscure,
    this.iconButton,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 7,
        ),
        SizedBox(
          child: TextFormField(
            keyboardType: keyboardType,
            cursorColor: MyColors.myBlack,
            controller: controller,
            validator: validator,
            style: const TextStyle(color: MyColors.myBlack),
            obscureText: obscure ?? false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              fillColor: Colors.grey.shade100,
              filled: true,
              disabledBorder: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(7)),
              focusedBorder: InputBorder.none,
              hintText: hint,
              hintStyle: AppFonts.poppins(
                  textStyle: const TextStyle(
                      color: MyColors.lightGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              suffixIcon: iconButton,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomNumTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int num;
  final TextInputType type;
  final double sizedBoxHeight;
  const CustomNumTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    required this.num,
    required this.type,
    required this.sizedBoxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment:
            kIsWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            hint,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: kIsWeb ? 20 : 16,
            ),
          ),
          SizedBox(height: sizedBoxHeight),
          TextFormField(
            keyboardType: type,
            cursorColor: MyColors.myBlack,
            controller: controller,
            style: const TextStyle(color: MyColors.myBlack),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              fillColor: MyColors.whiteGrey,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(7)),
              focusedBorder: InputBorder.none,
            ),
            maxLines: num,
          ),
        ],
      ),
    );
  }
}
