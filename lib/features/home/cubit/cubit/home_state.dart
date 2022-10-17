part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.sortItems,
    this.items,
    this.isLoading,
    this.categoriesItem,
  });

  final List<ProductModel>? items;
  final List<ProductModel>? sortItems;
  final List<CategoriesModel>? categoriesItem;
  final bool? isLoading;

  @override
  List<Object?> get props => [items, isLoading, categoriesItem, sortItems];

  HomeState copyWith({
    List<ProductModel>? items,
    List<ProductModel>? sortItems,
    bool? isLoading,
    List<CategoriesModel>? categoriesItem,
  }) {
    return HomeState(
      categoriesItem: categoriesItem ?? this.categoriesItem,
      items: items ?? this.items,
      sortItems: sortItems ?? this.sortItems,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
