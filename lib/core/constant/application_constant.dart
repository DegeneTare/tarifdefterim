class applicationConstant {
  static applicationConstant? _instance;
  static applicationConstant get instance {
    _instance ??= applicationConstant._init();
    return _instance!;
  }

  applicationConstant._init();
  final String baseUrl = 'http://192.168.0.16:3000/';
  final String dummyImage = 'https://picsum.photos/200/300';
}
