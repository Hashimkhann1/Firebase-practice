

import 'package:flutter/cupertino.dart';

class LoadingProvider with ChangeNotifier {

  bool _isloading = false;

  bool get isloading => _isloading;

  void startLoading() {
    _isloading = true;
    notifyListeners();
  }
  void stopLoading() {
    _isloading = false;
    notifyListeners();
  }


}