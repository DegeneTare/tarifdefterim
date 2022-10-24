import 'dart:io';

import 'package:image_picker/image_picker.dart';

class imageUploadManager {
  File? image;
  imageUploadManager(this.image);

  Future<File?> fetchFromLibrary() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    final imageTemporary = File(image.path);
    this.image = imageTemporary;
    return this.image;
  }
}
