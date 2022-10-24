import 'dart:async';

import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:yemektariflerim/features/home/model/categories_model.dart';
import 'package:yemektariflerim/features/home/model/postProduct_model.dart';
import 'package:yemektariflerim/features/home/model/product_model.dart';
import 'package:yemektariflerim/features/home/service/home_service.dart';
import 'package:yemektariflerim/product/utility/image_upload.dart';

import '../../model/image_upload_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeService) : super(HomeState()) {
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

  Future<void> postProduct(
      String title,
      String name,
      String kacKisilik,
      String hazirlanmaSuresi,
      String pisirmeSuresi,
      String malzemeler,
      String hazirlanisi,
      String kategori,
      String img,
      int favorite) async {
    emit(state.copyWith(
        isLoading: true,
        postItems: postProductModel(title, name, kacKisilik, hazirlanmaSuresi,
            pisirmeSuresi, malzemeler, hazirlanisi, kategori, img, favorite)));
    final postProductResponse = await homeService.postProduct(state.postItems!);
    emit(state.copyWith(
        isLoading: false, isCompleted: postProductResponse?.data != null));
  }

  Future<void> postImages() async {
    changeloading();
    final postImageResponse = await homeService.postImages(state.xfile);
    emit(state.copyWith(postImages: postImageResponse?.data));
    changeloading();
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
