import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../../core/common/widgets/images/edge_rounded_images.dart';
import '../../../../../../../core/common/widgets/texts/section_heading.dart';
import '../../../../../../../core/cubits/imagePicker/image_picker.dart';
import '../../../../../../../core/dependency/init_dependencies.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/enums.dart';
import '../../../../../../../utils/constants/sizes.dart';

class ImageUploadWidget extends StatelessWidget {
  const ImageUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        spacing: PSizes.spaceBtwItems,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PSectionHeading(title: 'Product Images', showActionButton: false),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: PSizes.spaceBtwItems / 2,
            runSpacing: PSizes.spaceBtwItems / 2,

            children: [
              BlocBuilder<ImageCubit, List<File>>(
                builder: (context, state) {
                  return Wrap(
                    alignment: WrapAlignment.start,
                    spacing: PSizes.spaceBtwItems / 2,
                    runSpacing: PSizes.spaceBtwItems / 2,
                    children:
                        state
                            .map(
                              (file) => Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  PRoundedImage(
                                    imageType: ImageType.file,
                                    file: file,
                                    width: 55,
                                    height: 65,
                                    borderRadius: 10,
                                  ),
                                  Positioned(
                                    top: -5,
                                    right: -5,
                                    child: GestureDetector(
                                      onTap: () {
                                        serviceLocator<ImageCubit>().removeFile(
                                          file.path,
                                        );
                                      },
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: PColors.white,
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                        child: Center(
                                          child: const Icon(
                                            Icons.close,
                                            size: 15,
                                            color: PColors.error,
                                            weight: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                  );
                },
              ),

              GestureDetector(
                onTap: () => serviceLocator<ImageCubit>().pickImage(),
                child: TRoundedContainer(
                  backgroundColor: PColors.accent.withValues(alpha: 0.1),
                  width: 55,
                  height: 65,
                  radius: 10,
                  child: SizedBox(
                    child: TRoundedContainer(
                      backgroundColor: PColors.transparent,
                      child: Icon(Icons.add_a_photo_outlined),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
