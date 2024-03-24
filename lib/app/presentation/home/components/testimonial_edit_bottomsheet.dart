// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
      );

  const TestimonialEditBottomSheet._();

  @override
  State<TestimonialEditBottomSheet> createState() => _TestimonialEditBottomSheetState();
}

class _TestimonialEditBottomSheetState extends State<TestimonialEditBottomSheet> {
  final controller = Get.find<HomePageController>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  Future<void> _onSave() async {
    bool isFormValid = true;

    for (var skills in testimonialList) {
      if (skills.formKey.currentState?.validate() != true) {
        isFormValid = false;
        setState(() {
          _autovalidateMode = AutovalidateMode.onUserInteraction;
        });
      }
    }

    if (isFormValid) {
      controller.currentUser.value = controller.currentUser.value.copyWith(
        testimonials: testimonialList
            .map(
              (e) => TestimonialEntity(
                quote: e.formKey.currentState?.fields["quote"]?.value as String,
                company: e.formKey.currentState?.fields["name"]?.value as String,
                title: e.formKey.currentState?.fields["title"]?.value as String,
                name: e.formKey.currentState?.fields["name"]?.value as String,
              ),
            )
            .toList(),
      );

      await controller.updateUser();

      Get.back();
    }
  }

  List<TestimonialItemViewModel> testimonialList = [];

  @override
  void initState() {
    super.initState();

    testimonialList = List.generate(
      controller.currentUser.value.testimonials.length,
      (index) {
        var formKey = GlobalKey<FormBuilderState>();
        var initialValue = controller.currentUser.value.testimonials[index];

        return TestimonialItemViewModel(formKey: formKey, experience: initialValue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBottomSheetLayout(
      title: "Edit Experience",
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
                  testimonialList.add(
                    TestimonialItemViewModel(
                      formKey: GlobalKey<FormBuilderState>(),
                      experience: null,
                    ),
                  );
                });
              },
              icon: const Icon(Icons.add),
              label: const Text("Add new skills"),
            );
          }

          return FormBuilder(
            key: testimonialList[index].formKey,
            autovalidateMode: _autovalidateMode,
            child: Card(
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
                      initialValue: testimonialList[index].experience?.name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Recommender",
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
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
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
                      initialValue: testimonialList[index].experience?.title,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Title",
                      ),
                      style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
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
                      initialValue: testimonialList[index].experience?.company,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Company",
                      ),
                      style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: FormBuilderTextField(
                      name: "quote",
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      initialValue: testimonialList[index].experience?.quote,
                      minLines: 5,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Quote",
                      ),
                      style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                ],
              ),
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
}

class TestimonialItemViewModel {
  final GlobalKey<FormBuilderState> formKey;
  final TestimonialEntity? experience;

  TestimonialItemViewModel({
    required this.formKey,
    required this.experience,
  });
}
