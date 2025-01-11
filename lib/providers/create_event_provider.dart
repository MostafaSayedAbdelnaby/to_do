import 'package:flutter/widgets.dart';

/// put all Logics in Provider
class CreateEventProvider extends ChangeNotifier {
  List<String> eventCategories = [
    "birthday",
    "book_club",
    "sport",
    "eating",
    "exhibition",
    "gaming",
    "meeting",
    "work_shop",
    "holiday",
  ];

  int selectedCategory = 0;

  changeCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }
}
