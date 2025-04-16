import 'package:flutter/material.dart';
import 'package:intuji_infogrid/src/src.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepo _productRepo = ProductRepo();
  DataFetchStatus _status = DataFetchStatus.initial;
  ProductDetailModel? _productDetail;

  DataFetchStatus get status => _status;
  ProductDetailModel? get productDetail => _productDetail;

  Future<void> fetchProductDetail(String productId) async {
    _status = DataFetchStatus.loading;
    notifyListeners();

    final response = await _productRepo.fetchProductDetail(productId);

    if (response.status) {
      _productDetail = response.data as ProductDetailModel;
      _status = DataFetchStatus.success;
    } else {
      _status = DataFetchStatus.error;
    }
    notifyListeners();
  }
}
