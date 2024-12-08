import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../logic/choose image/choose_image_page_cubit.dart';
import '../../package/resocues/color.dart';
import '../../package/utils/image_utils.dart';

class CustomBottomSheets extends StatelessWidget {
  final VoidCallback onTapCamera;
  final VoidCallback onTapGallery;
  const CustomBottomSheets({
    super.key,
    required this.onTapGallery,
    required this.onTapCamera,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            child: Container(
              height: 5,
              width: 50,
              decoration: const BoxDecoration(
                color: AppColor.primaryGreen,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
          const Gap(25),
          const Align(
            child: Text(
              "Choose Picture",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                // color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          const Gap(30),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: onTapCamera,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColor.primaryGreen,
                              width: 2,
                            )),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: AppColor.primaryGreen,
                        ),
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      "Camera",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              // const Gap(0),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: onTapGallery,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColor.primaryGreen,
                              width: 2,
                            )),
                        child: Transform.scale(
                          scale: 0.5,
                          child: Image.asset(
                            ImagePath.gallery,
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      "Gallery",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
