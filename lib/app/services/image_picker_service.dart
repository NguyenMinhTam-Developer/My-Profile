import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerService {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickImage({required ImageSource source}) async {
    final XFile? image = await _picker.pickImage(source: source);

    if (image == null) {
      return null;
    }

    return File(image.path);
  }

  static Future<String?> saveImage(File imageFile) async {
    final String path = await getApplicationDocumentsDirectory().then((value) => value.path);

    final newImageFile = File("$path/${imageFile.path.split('/').last}");

    try {
      await imageFile.copy(newImageFile.path);
      return newImageFile.path;
    } catch (e) {
      return null;
    }
  }
}
