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
      this.xfile});

  final postProductModel? postItems;
  final ImageUploadResponse? postImages;
  final List<ProductModel>? items;
  final List<ProductModel>? selectedItems;
  final List<ProductModel>? sortItems;
  final List<CategoriesModel>? categoriesItem;
  String? selectItems;

  final bool? isLoading;
  final bool isCompleted;
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
        selectedItems
      ];

  HomeState copyWith({
    List<ProductModel>? items,
    List<ProductModel>? selectedItems,
    String? selectItems,
    postProductModel? postItems,
    ImageUploadResponse? postImages,
    List<ProductModel>? sortItems,
    bool? isLoading,
    bool? isCompleted,
    File? xfile,
    List<CategoriesModel>? categoriesItem,
  }) {
    return HomeState(
      categoriesItem: categoriesItem ?? this.categoriesItem,
      selectedItems: selectedItems ?? this.selectedItems,
      items: items ?? this.items,
      selectItems: selectItems,
      postItems: postItems ?? this.postItems,
      postImages: postImages ?? this.postImages,
      sortItems: sortItems ?? this.sortItems,
      isLoading: isLoading ?? false,
      isCompleted: isCompleted ?? false,
      xfile: xfile ?? xfile,
    );
  }
}
