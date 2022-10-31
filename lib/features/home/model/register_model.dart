import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'register_model.g.dart';

@JsonSerializable()
class registerModel extends INetworkModel<registerModel> {
  String? name;
  String? email;
  String? password;

  registerModel(this.name, this.email, this.password);
  @override
  registerModel fromJson(Map<String, dynamic> json) {
    return _$registerModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$registerModelToJson(this);
  }
}
