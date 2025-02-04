import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/model/task_model.dart';
import 'package:to_do/providers/create_event_provider.dart';
import '../firebase/firebase_manager.dart';
import '../widgets/category_event_item.dart';

// ignore: must_be_immutable
class CreateEvent extends StatelessWidget {
  static const String routeName = "CreateEvent";

  CreateEvent({super.key});

  var descriptionController = TextEditingController();
  var titleController = TextEditingController();
  var locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // create ChangeNotifierProvider because it's used in this only page
    // I'm used builder: to get var provider
    // but if I'm created ChangeNotifierProvider in main true too,
    return ChangeNotifierProvider(
      create: (context) => CreateEventProvider(),
      builder: (context, child) {
        var provider = Provider.of<CreateEventProvider>(context);
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Create Event",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // for Text("Title")
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/images/${provider.eventCategories[provider.selectedCategory]}@1x.png",
                      //"assets/images/${provider.selectedCategoryName}@1x.png",//return name of item where in list eventCategories
                      height: 220,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(22),
                          onTap: () {
                            provider.changeCategory(index);
                          },
                          // create container that it contains a Name related with eventCategories[].
                          child: CategoryEventItem(
                            text: provider.eventCategories[index],
                            // Name of eventCategories.
                            isSelected: provider.selectedCategory == index,
                          ),
                        );
                      },
                      itemCount: provider.eventCategories.length,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Title",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: titleController,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).focusColor,
                        ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).focusColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).focusColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).focusColor),
                      ),
                      labelText: "Event Title",
                      labelStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Theme.of(context).focusColor,
                              ),
                      prefixIcon: const Icon(
                        Icons.edit_note,
                        color: Color(0xFF7B7B7B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: descriptionController,
                    maxLines: 3, // it's important
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).focusColor,
                        ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).focusColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).focusColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).focusColor),
                      ),
                      labelText: "Event Description",
                      labelStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Theme.of(context).focusColor,
                              ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Event Date",
                          style: Theme.of(context).textTheme.titleSmall),
                      InkWell(
                        // for three year 2024,2025 & 2026 because firstDate:()
                        onTap: () async {
                          // this Future<DateTime?> showDatePicker return Calender of Date
                          var date = await showDatePicker(
                            // For the change to occur in this screen
                            context: context, // build in this screen
                            // return dateTime of today
                            initialDate: DateTime.now(),

                            firstDate: DateTime.now().subtract(
                              const Duration(days: 356),
                            ), // it's return { from 2024 to 2025 }

                            lastDate: DateTime.now().add(
                              const Duration(days: 356),
                            ), // it's return { from 2025 to 2026 }
                          );
                          // because if I'm not select a dateTime & clicked on Cancel
                          if (date != null) {
                            provider.changeDate(date);
                          }
                        },

                        child: Text(
                          // provider.selectedDate.toString(), 2025-01-16 18:40:08.397978
                          provider.selectedDate.toString().substring(0, 10),
                          // return 2025-01-16
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Event Time",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      InkWell(
                        onTap: () async {
                          // Show a Time Picker
                          var timeOfDay = await showTimePicker(
                            context: context,
                            // returns with current time
                            initialTime:
                                TimeOfDay.fromDateTime(provider.selectedDate),
                          );
                          //Today's date (year,month,day) is retained but the hour and minute are updated based on the time chosen.
                          if (timeOfDay != null) {
                            // Update the selectedDate with the new time
                            final newDateTime = DateTime(
                              provider.selectedDate.year, // don't changed
                              provider.selectedDate.month, // don't changed
                              provider.selectedDate.day, // don't changed
                              timeOfDay.hour, // changed
                              timeOfDay.minute, // changed
                            );
                            // The hour and minute are updated based on the time selected
                            // so that the new date and time are saved in provider
                            provider.changeDate(newDateTime);
                          }
                        },
                        child: Text(
                          // DateFormat.Hm('en_US').format(provider.selectedDate), // 24 hours
                          DateFormat.jm('en_US').format(provider.selectedDate),
                          // 12 hours
                          // return time like this => 5:30 PM
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Location",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: locationController,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).focusColor,
                        ),
                    maxLines: 2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).focusColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).focusColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).focusColor),
                      ),
                      label: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.my_location,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Choose Event Location",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ],
                      ),
                      suffixIcon: Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          );
                        },
                      );
                      TaskModel model = TaskModel(
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        title: titleController.text,
                        description: descriptionController.text,
                        category: provider.selectedCategoryName,
                        // convert date to int
                        date: provider.selectedDate
                            .millisecondsSinceEpoch, // 1737784800000 . from Eng
                        // date: provider.selectedDate
                        //     .toString()
                        //     .substring(0, 10), // "2025-01-25" .
                        /// print in the Screen type 'String' is not a subtype of type 'int' , String date in taskModel
                      );

                      await Future.delayed(const Duration(seconds: 5));
                      FirebaseManager.addEvent(model).then((value) {
                        Navigator.pop(context);
                        Navigator.pop(context); // for showDialog
                      });
                      // if i'm used to disable network access that in main , i must delete
                      // FirebaseManager.addEvent(model);
                      // Navigator.pop(context);
                      // Navigator.pop(context); // for showDialog
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Theme.of(context).primaryColor),
                    child: Text("Add Event",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white)),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
