part of 'home_cubit.dart';

class HomeState extends Equatable {
  HomeState(
      {this.postItems,
      this.isCompleted = false,
      this.sortItems,
      this.postImages,
      this.items,
      this.isLoading,
      this.selectItems,
      this.categoriesItem,
      this.selectedItems,
      this.xfile,
      this.postRegisterItems,
      this.registerComplete = false,
      this.userItems});

  final postProductModel? postItems;
  final registerModel? postRegisterItems;
  final UsersModel? userItems;
  final ImageUploadResponse? postImages;
  final List<ProductModel>? items;
  final List<ProductModel>? selectedItems;
  final List<ProductModel>? sortItems;
  final List<CategoriesModel>? categoriesItem;

  String? selectItems;

  final bool? isLoading;
  final bool isCompleted;
  final bool registerComplete;
  File? xfile;

  @override
  List<Object?> get props => [
        items,
        isLoading,
        categoriesItem,
        sortItems,
        postImages,
        xfile,
        selectItems,
        selectedItems,
        postRegisterItems,
        registerComplete,
        userItems
      ];

  HomeState copyWith(
      {List<ProductModel>? items,
      List<ProductModel>? selectedItems,
      String? selectItems,
      postProductModel? postItems,
      ImageUploadResponse? postImages,
      List<ProductModel>? sortItems,
      bool? isLoading,
      bool? isCompleted,
      bool? registerComplete,
      File? xfile,
      List<CategoriesModel>? categoriesItem,
      registerModel? postRegisterItems,
      UsersModel? userItems}) {
    return HomeState(
      categoriesItem: categoriesItem ?? this.categoriesItem,
      selectedItems: selectedItems ?? this.selectedItems,
      items: items ?? this.items,
      selectItems: selectItems,
      postItems: postItems ?? this.postItems,
      postRegisterItems: postRegisterItems ?? this.postRegisterItems,
      userItems: userItems ?? this.userItems,
      postImages: postImages ?? this.postImages,
      sortItems: sortItems ?? this.sortItems,
      isLoading: isLoading ?? false,
      isCompleted: isCompleted ?? false,
      registerComplete: registerComplete ?? this.registerComplete,
      xfile: xfile ?? xfile,
    );
  }
}
