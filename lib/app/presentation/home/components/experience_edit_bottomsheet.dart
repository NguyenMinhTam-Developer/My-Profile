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

  List<ExperienceItemViewModel> experienceList = [];

  @override
  void initState() {
    super.initState();

    experienceList = List.generate(
      controller.currentUser.value.experiences.length,
      (index) {
        var experience = controller.currentUser.value.experiences[index];

        return ExperienceItemViewModel(
          companyName: TextEditingController(text: experience.company),
          startDate: experience.startDate,
          endDate: experience.endDate,
          title: TextEditingController(text: experience.title),
          description: TextEditingController(text: experience.description),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBottomSheetLayout(
      title: "Edit Experiences",
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
                      companyName: TextEditingController(),
                      startDate: null,
                      endDate: null,
                      title: TextEditingController(),
                      description: TextEditingController(),
                    ),
                  );
                });
              },
              icon: const Icon(Icons.add),
              label: const Text("Add new experience"),
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
                      Icons.verified,
                      size: 24,
                    ),
                  ),
                  title: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: experienceList[index].companyName,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Company name",
                      errorText: experienceList[index].companyNameError,
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
                          onChanged: (value) {
                            if (value != null && experienceList[index].endDate != null) {
                              if (value.isAfter(experienceList[index].endDate!)) {
                                setState(() {
                                  experienceList[index].startDateError = "Start date must be before end date";
                                });
                              } else {
                                setState(() {
                                  experienceList[index].startDateError = null;
                                  experienceList[index].startDate = value;
                                });
                              }
                            }
                          },
                          keyboardType: TextInputType.text,
                          initialValue: experienceList[index].startDate,
                          inputType: InputType.date,
                          format: DateFormat("MMM yyyy"),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Start date",
                            errorText: experienceList[index].startDateError,
                          ),
                          style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FormBuilderDateTimePicker(
                          name: "endDate",
                          onChanged: (value) {
                            if (value != null && experienceList[index].startDate != null) {
                              if (value.isBefore(experienceList[index].startDate!)) {
                                setState(() {
                                  experienceList[index].endDateError = "End date must be after start date";
                                });
                              } else {
                                setState(() {
                                  experienceList[index].endDateError = null;
                                  experienceList[index].endDate = value;
                                });
                              }
                            }
                          },
                          keyboardType: TextInputType.text,
                          initialValue: experienceList[index].endDate,
                          inputType: InputType.date,
                          format: DateFormat("MMM yyyy"),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "End date",
                            errorText: experienceList[index].endDateError,
                          ),
                          style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
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
                  title: TextFormField(
                    controller: experienceList[index].title,
                    keyboardType: TextInputType.name,
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
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.newline,
                    controller: experienceList[index].description,
                    minLines: 5,
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Description",
                      errorText: experienceList[index].descriptionError,
                    ),
                    style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
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

    for (var experiences in experienceList) {
      if (experiences.companyName.text.isEmpty) {
        setState(() {
          experiences.companyNameError = "This field is required";
        });

        isFormValid = false;
      } else {
        setState(() {
          experiences.companyNameError = null;
        });
      }

      if (experiences.startDate == null) {
        setState(() {
          experiences.startDateError = "This field is required";
        });

        isFormValid = false;
      } else {
        setState(() {
          experiences.startDateError = null;
        });
      }

      if (experiences.endDate == null) {
        setState(() {
          experiences.endDateError = "This field is required";
        });

        isFormValid = false;
      } else {
        setState(() {
          experiences.endDateError = null;
        });
      }

      if (experiences.title.text.isEmpty) {
        setState(() {
          experiences.titleError = "This field is required";
        });

        isFormValid = false;
      } else {
        setState(() {
          experiences.titleError = null;
        });
      }

      if (experiences.description.text.isEmpty) {
        setState(() {
          experiences.descriptionError = "This field is required";
        });

        isFormValid = false;
      } else {
        setState(() {
          experiences.descriptionError = null;
        });
      }
    }

    if (isFormValid) {
      controller.currentUser.value = controller.currentUser.value.copyWith(
        experiences: experienceList
            .map(
              (e) => ExperienceEntity(
                company: e.companyName.text,
                startDate: e.startDate!,
                endDate: e.endDate!,
                title: e.title.text,
                description: e.description.text,
              ),
            )
            .toList(),
      );

      Get.back();

      await controller.updateUser();
    }
  }
}

class ExperienceItemViewModel {
  final TextEditingController companyName;
  DateTime? startDate;
  DateTime? endDate;
  final TextEditingController title;
  final TextEditingController description;

  String? companyNameError;
  String? startDateError;
  String? endDateError;
  String? titleError;
  String? descriptionError;

  ExperienceItemViewModel({
    required this.companyName,
    required this.startDate,
    required this.endDate,
    required this.title,
    required this.description,
  });
}
