import 'dart:io';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/core/helper/get_profile_data.dart';
import 'package:time_attendance/core/helper/translator.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/features/menu/presentation/manage/profile%20cubit/profile_cubit.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/widgets/loading/circle_loaging.dart';
import 'custom_image_dialog.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  File? image;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) async {
        if (state is PickImageSuccess) {
          image = state.image;
          setState(() {});
          if (image == null) return;
          BlocProvider.of<ProfileCubit>(context).uploadImage(photo: image!);
        } else if (state is PickImageFailure) {
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        } else if (state is UploadImageLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is UploadImageSuccess) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).done(message: state.message);
        } else if (state is UploadImageFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        }
      },
      child: Column(
        children: [
          Stack(
            children: [
              isLoading
                  ? CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: FileImage(image!),
                      radius: 60,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : image != null
                      ? ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: GetProfileData().employeeImage,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const CircleLoading(),
                          ),
                        )
                      : GetProfileData().employeeImage != ""
                          ? ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: GetProfileData().employeeImage,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const CircleLoading(),
                              ),
                            )
                          : const CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 60,
                            ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      alert(
                        context,
                        title: Text(translator(context).chooseImageFrom),
                        content: CustomImageDialog(
                          onCameraTap: () {
                            BlocProvider.of<ProfileCubit>(context).pickedImage(
                              source: ImageSource.camera,
                            );
                            GoRouter.of(context).pop();
                          },
                          onGalleryTap: () {
                            BlocProvider.of<ProfileCubit>(context).pickedImage(
                              source: ImageSource.gallery,
                            );
                            GoRouter.of(context).pop();
                          },
                        ),
                        textOK: GestureDetector(
                            onTap: () {
                              GoRouter.of(context).pop();
                            },
                            child: const Text("Cancel")),
                      );
                      // BlocProvider.of<ProfileCubit>(context).pickedImage();
                    },
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            GetEmployeeData().name,
            style: AppFonts.poppins(
              textStyle: const TextStyle(
                color: MyColors.myDarkBlue,
                fontSize: kIsWeb ? 20 : 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
