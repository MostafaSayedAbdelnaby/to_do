class TaskModel {
  String id;
  String title;
  String description;
  String category;
  String location;
  int date;

  // String date; Eng
  bool isDone;
  String userId;
  // bool isFavorite;    for create favoriteScreen

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.category,
    this.location = "",
    required this.date,
    required this.userId,
    this.isDone = true,
  });

  // Named || parameterized constructor that it takes Map & return TaskModel
  /// this constructor to create a new TaskModel instance from a Map structure (JSON).
  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          // "id" is a key with first item in the Map
          title: json["title"],
          description: json["description"],
          category: json["category"],
          location: json["location"],
          date: json["date"],
          userId: json["userId"],
          isDone: json["isDone"],
        );

  // // Factory constructor to create a TaskModel from JSON
  // factory TaskModel.fromJson(Map<String, dynamic> json) {
  //   return TaskModel(
  //     id: json['id'],
  //     title: json['title'],
  //     description: json['description'],
  //     date: json['date'],
  //     isDone: json['isDone'],
  //   );
  // }

  // this function don't takes anything because it have a Model (from last constructor) & return Map.
  /// Method to convert TaskModel to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "category": category,
      "location": location,
      "date": date,
      "userId": userId,
      "isDone": isDone,
    };
  }
}
