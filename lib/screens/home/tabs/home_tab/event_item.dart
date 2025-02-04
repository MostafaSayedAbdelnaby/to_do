import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/firebase/firebase_manager.dart';
import 'package:to_do/screens/create_event.dart';
import 'package:to_do/screens/home/tabs/favorite_tab.dart';

import '../../../../model/task_model.dart';

class EventItem extends StatelessWidget {
  final TaskModel model;

  const EventItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  // I must rap ClipRRect on Image & take borderRadius to edit the shape of Stack
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/images/${model.category}@1x.png",
                    fit: BoxFit.fill,
                    height: double.infinity,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(model.title,
                            style: Theme.of(context).textTheme.titleSmall),
                      ),
                      InkWell(
                        onTap: () async {
                          // Navigate to the create event screen with model details for editing
                          final success = await Navigator.pushNamed(
                            context,
                            CreateEvent.routeName,
                            arguments: model, // Pass the model as an argument
                          );

                          // Check if the event was updated successfully
                          if (success == true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Event updated successfully.')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Failed to update event.')),
                            );
                          }
                        },
                        child: Icon(
                          Icons.edit,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      InkWell(
                        onTap: () => FirebaseManager.deleteEvent(model.id),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Icon(
                            Icons.delete,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, FavoriteScreen.routeName);
                        },
                        child: Icon(
                          Icons.favorite_border,
                          color:  Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 8,
              top: 8,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  // model.date.toString().substring(9,10),
                  formatDateTime(model.date).split(",")[0].substring(8, 10),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ), // return date of day , like: 21
                ),
                Text(
                  formatDateTime(model.date).split(",")[2].substring(1, 4),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                      ), // return name of month , like: Nov OR Apri
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String formatDateTime(int milliseconds) {
    // create a DateTime from milliseconds Since Epoch
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);

    // create a DateFormat to format the DateTime object
    DateFormat formatter = DateFormat("yyyy-MM-dd, EEE, MMMM", 'en_US');
    // Format the DateTime object to a String using the formatter
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }
}
