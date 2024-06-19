import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/constans/colors_constans.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/features/menu/presentation/manage/language%20cubit/language_cubit.dart';

import '../../../../../../core/helper/translator.dart';
import 'language_item.dart';

class ChangeLanguageViewBody extends StatefulWidget {
  const ChangeLanguageViewBody({super.key});

  @override
  State<ChangeLanguageViewBody> createState() => _ChangeLanguageViewBodyState();
}

class _ChangeLanguageViewBodyState extends State<ChangeLanguageViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LanguageCubit, LanguageState>(
      listener: (context, state) {
        if (state is LanguageChanged) {
          setState(() {});
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            translator(context).changeLanguage,
            style: AppFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: MyColors.myWazenLight,
              ),
            ),
          ),
          const SizedBox(height: 20),
          LanguageItem(
            title: "Arabic",
            tag: 'ar',
            currentLanguage: Intl.getCurrentLocale(),
          ),
          LanguageItem(
            title: "English",
            tag: 'en',
            currentLanguage: Intl.getCurrentLocale(),
          ),
        ],
      ),
    );
  }
}
