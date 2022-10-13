part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.items, this.isLoading, this.categoriesItem});

  final List<ProductModel>? items;
  final List<CategoriesModel>? categoriesItem;
  final bool? isLoading;

  @override
  List<Object?> get props => [items, isLoading, categoriesItem];

  HomeState copyWith({
    List<ProductModel>? items,
    bool? isLoading,
    List<CategoriesModel>? categoriesItem,
  }) {
    return HomeState(
      categoriesItem: categoriesItem ?? this.categoriesItem,
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
