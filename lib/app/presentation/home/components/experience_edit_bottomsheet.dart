// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_profile/app/domain/entities/experience_entity.dart';

import '../../../../configs/themes/colors.dart';
import '../../../../configs/themes/typography.dart';
import '../controllers/home_controller.dart';
import '../layouts/default_bottom_sheet_layout.dart';

class ExperienceEditBottomSheet extends StatefulWidget {
  static show() => Get.bottomSheet(
        const ExperienceEditBottomSheet._(),
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
      );

  const ExperienceEditBottomSheet._();

  @override
  State<ExperienceEditBottomSheet> createState() => _ExperienceEditBottomSheetState();
}

class _ExperienceEditBottomSheetState extends State<ExperienceEditBottomSheet> {
  final controller = Get.find<HomePageController>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  List<ExperienceItemViewModel> experienceList = [];

  Future<void> _onSave() async {
    try {
      print("isFormValid");
      bool isFormValid = true;

      print("checking form validity");
      for (var experiences in experienceList) {
        print(experiences.formKey.currentState);
        if (!experiences.formKey.currentState!.saveAndValidate()) {
          print("form is invalid");
          isFormValid = false;
          setState(() {
            _autovalidateMode = AutovalidateMode.onUserInteraction;
          });
        }
      }

      if (isFormValid) {
        controller.currentUser.value = controller.currentUser.value.copyWith(
          experiences: experienceList
              .map(
                (e) => ExperienceEntity(
                  company: e.formKey.currentState!.fields["name"]!.value as String,
                  startDate: e.formKey.currentState!.fields["startDate"]!.value as DateTime,
                  endDate: e.formKey.currentState!.fields["endDate"]!.value as DateTime,
                  title: e.formKey.currentState!.fields["title"]!.value as String,
                  description: e.formKey.currentState!.fields["description"]!.value as String,
                ),
              )
              .toList(),
        );

        await controller.updateUser();

        Get.back();
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void initState() {
    super.initState();

    experienceList = List.generate(
      controller.currentUser.value.experiences.length,
      (index) {
        var formKey = GlobalKey<FormBuilderState>();
        var initialValue = controller.currentUser.value.experiences[index];

        return ExperienceItemViewModel(formKey: formKey, experience: initialValue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBottomSheetLayout(
      title: "Edit Experience",
      content: ListView.separated(
        itemCount: experienceList.length + 1,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16);
        },
        itemBuilder: (BuildContext context, int index) {
          if (index == experienceList.length) {
            return TextButton.icon(
              onPressed: () {
                setState(() {
                  experienceList.add(
                    ExperienceItemViewModel(
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
            key: experienceList[index].formKey,
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
                        Icons.verified,
                        size: 24,
                      ),
                    ),
                    title: FormBuilderTextField(
                      name: "name",
                      keyboardType: TextInputType.name,
                      initialValue: experienceList[index].experience?.company,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Company name",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              experienceList.removeAt(index);
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
                        Icons.date_range,
                        size: 24,
                      ),
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: FormBuilderDateTimePicker(
                            name: "startDate",
                            keyboardType: TextInputType.text,
                            initialValue: experienceList[index].experience?.startDate,
                            inputType: InputType.date,
                            format: DateFormat("MMM yyyy"),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: "Start date",
                            ),
                            style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FormBuilderDateTimePicker(
                            name: "endDate",
                            keyboardType: TextInputType.text,
                            initialValue: experienceList[index].experience?.endDate,
                            inputType: InputType.date,
                            format: DateFormat("MMM yyyy"),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: "End date",
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
                      initialValue: experienceList[index].experience?.title,
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
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: FormBuilderTextField(
                      name: "description",
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.newline,
                      initialValue: experienceList[index].experience?.description,
                      minLines: 5,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Description",
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

class ExperienceItemViewModel {
  final GlobalKey<FormBuilderState> formKey;
  final ExperienceEntity? experience;

  ExperienceItemViewModel({
    required this.formKey,
    required this.experience,
  });
}
