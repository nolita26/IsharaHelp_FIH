import 'package:frugal_project1/SignsList.dart';
import 'package:flutter/cupertino.dart';

class BookmarkBloc extends ChangeNotifier {
  List<SignsList> items = [];

  void addItems(SignsList data) {
    items.add(data);
    notifyListeners();
  }

  void removeItems(SignsList data) {
    items.remove(data);
    notifyListeners();
  }
  List<SignsList> get entries {
    return items;
  }
}