import 'package:flutter/material.dart';
import 'package:uplanit_supplier/core/models/category.dart';
import 'package:uplanit_supplier/core/repository/repository.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _categoryList = [];
  List<Category> _selectedCategoryList = [];

  bool isCategoryLoading = false;

  List<Category> get categoryList => _categoryList;
  List<Category> get selectedCategoryList => _selectedCategoryList;

  Repository repo = new Repository();

  void loadCategory() async {
    isCategoryLoading = true;
    _selectedCategoryList.clear();
    _categoryList.clear();
    List<Category> categories = await repo.getCategories();

    isCategoryLoading = false;
    _categoryList = categories;

    notifyListeners();
  }

  void toggleSelected(int index) {
    _categoryList[index].selected = !_categoryList[index].selected;
    notifyListeners();
  }

  void addSelected(Category category) {
    _selectedCategoryList
      ..removeWhere((element) => element.categoryId == category.categoryId)
      ..add(category);

    notifyListeners();
  }
}
