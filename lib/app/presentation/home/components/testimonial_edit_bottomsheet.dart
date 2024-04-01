// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:my_profile/app/domain/entities/testimonial_entity.dart';

import '../../../../configs/themes/colors.dart';
import '../../../../configs/themes/typography.dart';
import '../controllers/home_controller.dart';
import '../layouts/default_bottom_sheet_layout.dart';

class TestimonialEditBottomSheet extends StatefulWidget {
  static show() => Get.bottomSheet(
        const TestimonialEditBottomSheet._(),
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
      );

  const TestimonialEditBottomSheet._();

  @override
  State<TestimonialEditBottomSheet> createState() => _TestimonialEditBottomSheetState();
}

class _TestimonialEditBottomSheetState extends State<TestimonialEditBottomSheet> {
  final controller = Get.find<HomePageController>();

  List<TestimonialItemViewModel> testimonialList = [];

  @override
  void initState() {
    super.initState();

    testimonialList = List.generate(
      controller.currentUser.value.testimonials.length,
      (index) {
        var initialValue = controller.currentUser.value.testimonials[index];

        return TestimonialItemViewModel(initialValue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBottomSheetLayout(
      title: "Edit Testimonials",
      content: ListView.separated(
        itemCount: testimonialList.length + 1,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16);
        },
        itemBuilder: (BuildContext context, int index) {
          if (index == testimonialList.length) {
            return TextButton.icon(
              onPressed: () {
                setState(() {
                  testimonialList.add(TestimonialItemViewModel(null));
                });
              },
              icon: const Icon(Icons.add),
              label: const Text("Add new skills"),
            );
          }

          return Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.grayLight.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.sentiment_very_satisfied_outlined,
                      size: 24,
                    ),
                  ),
                  title: FormBuilderTextField(
                    name: "name",
                    keyboardType: TextInputType.name,
                    controller: testimonialList[index].nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Recommender",
                      errorText: testimonialList[index].nameErrorText,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            testimonialList.removeAt(index);
                          });
                        },
                        icon: const Icon(
                          Icons.clear_rounded,
                        ),
                      ),
                    ),
                    style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                  ),
                ),
                ListTile(
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.grayLight.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.badge_rounded,
                      size: 24,
                    ),
                  ),
                  title: FormBuilderTextField(
                    name: "title",
                    keyboardType: TextInputType.name,
                    controller: testimonialList[index].titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Title",
                      errorText: testimonialList[index].titleErrorText,
                    ),
                    style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                  ),
                ),
                ListTile(
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.grayLight.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.apartment_outlined,
                      size: 24,
                    ),
                  ),
                  title: FormBuilderTextField(
                    name: "company",
                    keyboardType: TextInputType.name,
                    controller: testimonialList[index].companyController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Company",
                      errorText: testimonialList[index].companyErrorText,
                    ),
                    style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: FormBuilderTextField(
                    name: "quote",
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    controller: testimonialList[index].quoteController,
                    minLines: 5,
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Quote",
                      errorText: testimonialList[index].quoteErrorText,
                    ),
                    style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      action: FilledButton(
        onPressed: _onSave,
        child: const Text("Save"),
      ),
    );
  }

  Future<void> _onSave() async {
    bool isFormValid = true;

    for (var testimonial in testimonialList) {
      if (testimonial.nameController.text.isEmpty) {
        setState(() {
          testimonial.nameErrorText = "Name is required";
        });

        isFormValid = false;
      } else {
        setState(() {
          testimonial.nameErrorText = null;
        });
      }

      if (testimonial.titleController.text.isEmpty) {
        setState(() {
          testimonial.titleErrorText = "Title is required";
        });

        isFormValid = false;
      } else {
        setState(() {
          testimonial.titleErrorText = null;
        });
      }

      if (testimonial.companyController.text.isEmpty) {
        setState(() {
          testimonial.companyErrorText = "Company is required";
        });

        isFormValid = false;
      } else {
        setState(() {
          testimonial.companyErrorText = null;
        });
      }

      if (testimonial.quoteController.text.isEmpty) {
        setState(() {
          testimonial.quoteErrorText = "Quote is required";
        });

        isFormValid = false;
      } else {
        setState(() {
          testimonial.quoteErrorText = null;
        });
      }
    }

    if (isFormValid) {
      controller.currentUser.value = controller.currentUser.value.copyWith(
        testimonials: testimonialList
            .map(
              (e) => TestimonialEntity(
                name: e.nameController.text,
                title: e.titleController.text,
                company: e.companyController.text,
                quote: e.quoteController.text,
              ),
            )
            .toList(),
      );

      Get.back();

      await controller.updateUser();
    }
  }
}

class TestimonialItemViewModel {
  late final TextEditingController nameController;
  late final TextEditingController titleController;
  late final TextEditingController companyController;
  late final TextEditingController quoteController;

  String? nameErrorText;
  String? titleErrorText;
  String? companyErrorText;
  String? quoteErrorText;

  TestimonialItemViewModel(TestimonialEntity? experience) {
    nameController = TextEditingController(text: experience?.name);
    titleController = TextEditingController(text: experience?.title);
    companyController = TextEditingController(text: experience?.company);
    quoteController = TextEditingController(text: experience?.quote);
  }
}
