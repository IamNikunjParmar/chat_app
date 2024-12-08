import 'dart:io';

import 'package:chat_app/src/components/button/button.dart';
import 'package:chat_app/src/logic/choose%20image/choose_image_page_cubit.dart';
import 'package:chat_app/src/package/resocues/color.dart';
import 'package:chat_app/src/package/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/bottom Sheet/custom_bottom_sheet.dart';
import '../../components/input field/input_field.darty.dart';

class ChooseImageView extends StatelessWidget {
  ChooseImageView({super.key});

  static const String routeName = 'choose_image_view';
  final nameController = TextEditingController();
  final aboutController = TextEditingController();

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (_) => ChooseImagePageCubit(
        const ChooseImagePageState(),
        context: context,
      ),
      child: ChooseImageView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return BlocBuilder<ChooseImagePageCubit, ChooseImagePageState>(
      builder: (context, state) {
        Log.debug("Image::::::${state.pickedImagePath}");
        return BlocListener<ChooseImagePageCubit, ChooseImagePageState>(
          listener: (context, state) {
            nameController.text = state.userName ?? '';
          },
          child: Stack(
            children: [
              Scaffold(
                body: Container(
                  height: screenHeight * 0.459,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.primaryGreen,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: theme.brightness == Brightness.light ? Colors.grey : Colors.black.withOpacity(0.5),
                        offset: const Offset(3, 3),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Gap(40),
                        const Center(
                          child: Text(
                            "Choose Picture",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Gap(50),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: theme.brightness == Brightness.light
                                    ? Colors.black.withOpacity(0.4)
                                    : Colors.black.withOpacity(0.5),
                                offset: const Offset(2, 2),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    state.pickedImagePath.isNotEmpty ? FileImage(File(state.pickedImagePath)) : null,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    final cubit = context.read<ChooseImagePageCubit>();
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return BlocProvider.value(
                                          value: cubit,
                                          child: CustomBottomSheets(
                                            onTapCamera: () {
                                              cubit.pickImage(ImageSource.camera);
                                              Navigator.pop(context);
                                            },
                                            onTapGallery: () {
                                              cubit.pickImage(ImageSource.gallery);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: screenHeight * 0.08,
                                    width: screenWidth * 0.08,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColor.primaryGreen,
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: theme.brightness == Brightness.light
                                              ? Colors.black.withOpacity(0.4)
                                              : Colors.black.withOpacity(0.5),
                                          offset: const Offset(2, 2),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      size: screenWidth * 0.04,
                                      Icons.camera_alt_outlined,
                                      color: AppColor.primaryGreen,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    top: screenHeight * 0.05,
                  ),
                  child: Container(
                    height: screenHeight * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.brightness == Brightness.light ? Colors.grey : Colors.black.withOpacity(0.5),
                          offset: const Offset(3, 3),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Gap(30),
                          Material(
                            color: Colors.white,
                            child: EmailTextFormField(
                              controller: nameController,
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                color: theme.brightness == Brightness.light ? Colors.grey : Colors.grey,
                              ),
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                color: theme.brightness == Brightness.light ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                          const Gap(30),
                          Material(
                            color: Colors.white,
                            child: EmailTextFormField(
                              controller: aboutController,
                              hintText: 'About (Optional)',
                              textInputAction: TextInputAction.done,
                              hintStyle: TextStyle(
                                color: theme.brightness == Brightness.light ? Colors.grey : Colors.grey,
                              ),
                              style: TextStyle(
                                color: theme.brightness == Brightness.light ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      context.read<ChooseImagePageCubit>().updateUsername(
                            nameController.text.trim(),
                            aboutController.text.trim(),
                          );
                      Log.debug("controller::::: ${nameController.text}");
                      //Navigator.pushReplacementNamed(context, HomePageView.routeName);
                    },
                    child: CustomButton(
                      screenHeight: screenHeight * 0.06,
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
