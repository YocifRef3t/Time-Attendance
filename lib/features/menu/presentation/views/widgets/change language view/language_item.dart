import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/features/menu/presentation/manage/language%20cubit/language_cubit.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/utls/app_fonts.dart';

class LanguageItem extends StatelessWidget {
  final String tag;
  final String title;
  final String currentLanguage;
  const LanguageItem({
    super.key,
    required this.tag,
    required this.title,
    required this.currentLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<LanguageCubit>(context)
            .changeLanguage(languageCode: tag);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
        decoration: const BoxDecoration(
          color: MyColors.askPermBackGroundColor,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: AppFonts.poppins(
                textStyle: const TextStyle(color: MyColors.myWazenLight),
              ),
            ),
            const Spacer(),
            Visibility(
              visible: tag == currentLanguage,
              child: const Icon(
                Icons.done,
                size: 20,
                color: MyColors.myWazenLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
