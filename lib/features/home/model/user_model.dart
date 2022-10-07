import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UsersModel extends INetworkModel<UsersModel> {
  int? userId;
  String? name;
  String? email;
  String? password;
  @override
  UsersModel fromJson(Map<String, dynamic> json) {
    return _$UsersModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UsersModelToJson(this);
  }
}
