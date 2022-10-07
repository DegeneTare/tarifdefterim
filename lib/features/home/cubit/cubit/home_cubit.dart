import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:yemektariflerim/features/home/model/categories_model.dart';
import 'package:yemektariflerim/features/home/model/product_model.dart';
import 'package:yemektariflerim/features/home/service/home_service.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeService) : super(const HomeState()) {
    fetchAllItems();
    fetchAllCategories();
  }
  final IHomeService homeService;

  Future<void> fetchAllItems() async {
    _changeloading();
    final response = await homeService.fetchAllProducts();

    emit(state.copyWith(items: response ?? []));
    _changeloading();
  }

  Future<void> fetchAllCategories() async {
    _changeloading();
    final CategoriesResponse = await homeService.fetchAllCategories();

    emit(state.copyWith(categoriesItem: CategoriesResponse ?? []));
    _changeloading();
  }

  void _changeloading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
