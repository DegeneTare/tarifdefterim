part of 'home_cubit.dart';

class HomeState extends Equatable {
  HomeState(
      {this.postItems,
      this.isCompleted = false,
      this.sortItems,
      this.postImages,
      this.items,
      this.isLoading,
      this.categoriesItem,
      this.xfile});

  final postProductModel? postItems;
  final ImageUploadResponse? postImages;
  final List<ProductModel>? items;
  final List<ProductModel>? sortItems;
  final List<CategoriesModel>? categoriesItem;

  final bool? isLoading;
  final bool isCompleted;
  File? xfile;

  @override
  List<Object?> get props =>
      [items, isLoading, categoriesItem, sortItems, postImages, xfile];

  HomeState copyWith({
    List<ProductModel>? items,
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
      items: items ?? this.items,
      postItems: postItems ?? this.postItems,
      postImages: postImages ?? this.postImages,
      sortItems: sortItems ?? this.sortItems,
      isLoading: isLoading ?? false,
      isCompleted: isCompleted ?? false,
      xfile: xfile ?? xfile,
    );
  }
}
