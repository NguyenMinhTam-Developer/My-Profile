// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
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
      );

  const SkillsEditBottomSheet._();

  @override
  State<SkillsEditBottomSheet> createState() => _SkillsEditBottomSheetState();
}

class _SkillsEditBottomSheetState extends State<SkillsEditBottomSheet> {
  final controller = Get.find<HomePageController>();

  List<SkillsItemViewModel> skillsList = [];

  @override
  void initState() {
    super.initState();

    skillsList = List.generate(
      controller.currentUser.value.skills.length,
      (index) {
        var initialValue = controller.currentUser.value.skills[index].name;

        return SkillsItemViewModel(
          textEditingController: TextEditingController(text: initialValue),
          errorText: null,
        );
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
                      textEditingController: TextEditingController(),
                      errorText: null,
                    ),
                  );
                });
              },
              icon: const Icon(Icons.add),
              label: const Text("Add new skills"),
            );
          }

          return Card(
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
              title: TextFormField(
                keyboardType: TextInputType.text,
                controller: skillsList[index].textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter your skills",
                  errorText: skillsList[index].errorText,
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

    for (var i = 0; i < skillsList.length; i++) {
      if (skillsList[i].textEditingController!.text.isEmpty) {
        setState(() {
          skillsList[i] = skillsList[i].copyWith(
            errorText: "This field is required",
          );
        });

        isFormValid = false;
      } else {
        setState(() {
          skillsList[i] = skillsList[i].copyWith(
            errorText: null,
          );
        });
      }
    }

    if (isFormValid) {
      controller.currentUser.value = controller.currentUser.value.copyWith(
        skills: skillsList
            .map(
              (e) => SkillsEntity(name: e.textEditingController!.text),
            )
            .toList(),
      );

      Get.back();

      await controller.updateUser();
    }
  }
}

class SkillsItemViewModel {
  final TextEditingController? textEditingController;
  final String? errorText;

  SkillsItemViewModel({
    required this.textEditingController,
    required this.errorText,
  });

  SkillsItemViewModel copyWith({
    String? errorText,
  }) {
    return SkillsItemViewModel(
      textEditingController: textEditingController,
      errorText: errorText ?? this.errorText,
    );
  }
}
