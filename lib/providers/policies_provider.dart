import 'package:dokan_retailer/Services/policies.dart';
import 'package:flutter/material.dart';
import '../models/policies.dart';


class PolicyProvider extends ChangeNotifier {
  final PolicyService _policyService = PolicyService();
  Policies? _policies;
  bool _isLoading = false;

  Policies? get policies => _policies;
  bool get isLoading => _isLoading;

  Future<void> fetchPolicies(String token) async {
    _isLoading = true;
    notifyListeners();

    _policies = await _policyService.getPolicies(token);

    _isLoading = false;
    notifyListeners();
  }
}
