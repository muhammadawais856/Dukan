import 'package:dokan_retailer/Services/category.dart';
import 'package:dokan_retailer/models/category.dart';
import 'package:flutter/foundation.dart';


class CategoryProvider with ChangeNotifier {
  final CategoryService _categoryService = CategoryService();

  bool isLoading = false;
  Categorymodellist? categoryModelList;

  /// Load all categories
  Future<void> loadCategories() async {
    isLoading = true;
    notifyListeners();

    categoryModelList = await _categoryService.fetchCategories();

    isLoading = false;
    notifyListeners();
  }
}