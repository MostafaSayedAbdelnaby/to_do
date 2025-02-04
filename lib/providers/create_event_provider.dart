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

  String get selectedCategoryName =>
      eventCategories[selectedCategory]; // return a name like "birthday"

  changeCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }

  DateTime selectedDate = DateTime.now();

  changeDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}
