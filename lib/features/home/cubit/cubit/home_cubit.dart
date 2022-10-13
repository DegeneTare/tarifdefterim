import 'dart:async';
import 'dart:ffi';

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
    changeloading();
    final response = await homeService.fetchAllProducts();

    emit(state.copyWith(items: response ?? []));
    Timer(
      Duration(milliseconds: 500),
      () {
        changeloading();
      },
    );
  }

  Future<void> fetchAllCategories() async {
    final CategoriesResponse = await homeService.fetchAllCategories();

    emit(state.copyWith(categoriesItem: CategoriesResponse ?? []));
  }

  void changeloading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
