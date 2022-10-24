import 'package:json_annotation/json_annotation.dart';

import 'package:vexana/vexana.dart';

part 'image_upload_model.g.dart';

@JsonSerializable()
class ImageUploadResponse extends INetworkModel<ImageUploadResponse> {
  String? url;
  int? size;
  String? type;
  String? filename;

  @override
  ImageUploadResponse fromJson(Map<String, dynamic> json) {
    return _$ImageUploadResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ImageUploadResponseToJson(this);
  }
}
