// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:my_profile/app/domain/entities/skills_entity.dart';

import '../../../../configs/themes/colors.dart';
import '../../../../configs/themes/typography.dart';
import '../controllers/home_controller.dart';
import '../layouts/default_bottom_sheet_layout.dart';

class SkillsEditBottomSheet extends StatefulWidget {
  static show() => Get.bottomSheet(
        const SkillsEditBottomSheet._(),
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
      );

  const SkillsEditBottomSheet._();

  @override
  State<SkillsEditBottomSheet> createState() => _SkillsEditBottomSheetState();
}

class _SkillsEditBottomSheetState extends State<SkillsEditBottomSheet> {
  final controller = Get.find<HomePageController>();

  Future<void> _onSave() async {
    bool isFormValid = true;

    for (var skills in skillsList) {
      if (!skills.formKey.currentState!.saveAndValidate()) {
        isFormValid = false;
        setState(() {
          _autovalidateMode = AutovalidateMode.onUserInteraction;
        });
        break;
      }
    }

    if (isFormValid) {
      controller.currentUser.value = controller.currentUser.value.copyWith(
        skills: skillsList
            .map(
              (e) => SkillsEntity(name: e.formKey.currentState!.value["name"] as String),
            )
            .toList(),
      );

      await controller.updateUser();

      Get.back();
    }
  }

  List<SkillsItemViewModel> skillsList = [];
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();

    skillsList = List.generate(
      controller.currentUser.value.skills.length,
      (index) {
        var formKey = GlobalKey<FormBuilderState>();
        var initialValue = controller.currentUser.value.skills[index].name;

        return SkillsItemViewModel(formKey: formKey, initialValue: initialValue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBottomSheetLayout(
      title: "Edit Skills",
      content: ListView.separated(
        itemCount: skillsList.length + 1,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16);
        },
        itemBuilder: (BuildContext context, int index) {
          if (index == skillsList.length) {
            return TextButton.icon(
              onPressed: () {
                setState(() {
                  skillsList.add(
                    SkillsItemViewModel(
                      formKey: GlobalKey<FormBuilderState>(),
                      initialValue: null,
                    ),
                  );
                });
              },
              icon: const Icon(Icons.add),
              label: const Text("Add new skills"),
            );
          }

          return FormBuilder(
            key: skillsList[index].formKey,
            autovalidateMode: _autovalidateMode,
            child: Card(
              margin: EdgeInsets.zero,
              child: ListTile(
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
                  keyboardType: TextInputType.text,
                  initialValue: skillsList[index].initialValue,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your skills",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          skillsList.removeAt(index);
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

class SkillsItemViewModel {
  final GlobalKey<FormBuilderState> formKey;
  final String? initialValue;

  SkillsItemViewModel({
    required this.formKey,
    required this.initialValue,
  });
}
