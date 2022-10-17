import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yemektariflerim/features/home/model/categories_model.dart';
import 'package:yemektariflerim/features/home/model/product_model.dart';
import 'package:yemektariflerim/features/home/service/home_service.dart';
import 'package:yemektariflerim/features/home/view/tabbarPages/tabbar1_pages.dart';
import 'package:yemektariflerim/product/widget/tabbarPage_widget.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeService) : super(const HomeState()) {
    fetchAllItems();
    fetchAllCategories();
    fetchAllProductsWithSort();
  }
  final IHomeService homeService;

  Future<void> fetchAllItems() async {
    changeloading();
    final response = await homeService.fetchAllProducts();
    emit(state.copyWith(items: response ?? []));
    Timer(
      const Duration(milliseconds: 500),
      () {
        changeloading();
      },
    );
  }

  Future<void> fetchAllProductsWithSort() async {
    changeloading();
    final response = await homeService.fetchAllProductsWithSort();
    emit(state.copyWith(sortItems: response ?? []));
    Timer(
      const Duration(milliseconds: 500),
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
