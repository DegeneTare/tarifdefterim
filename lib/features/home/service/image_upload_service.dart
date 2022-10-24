import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService(this.dio);

  Future<void> uploadToImageServer(Uint8List byteArray) async {
    var formData = FormData.fromMap({
      '': await MultipartFile.fromBytes(byteArray),
    });
    dio.post('path',
        data: FormData, onSendProgress: ((int send, int total) {}));
  }
}
