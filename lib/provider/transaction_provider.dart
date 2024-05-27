// ignore_for_file: prefer_final_fields

import 'package:api_management/model/TransactionResponse.dart';
import 'package:api_management/services/transaction_service.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  TransactionProvider() {
    getTransaction();
  }

  TransactionService _service = TransactionService();

  bool isLoading = false;
  TransactionResponse? _response;

  TransactionResponse? get response => _response;

  Future<void> getTransaction() async {
    isLoading = true;
    notifyListeners();

    _response = await _service.getTransaction();
    isLoading = false;
    notifyListeners();
  }
}
