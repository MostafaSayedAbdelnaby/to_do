import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/firebase/firebase_manager.dart';
import 'package:to_do/providers/auth_provider.dart';
import '../../../../model/task_model.dart';
import 'event_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> eventCategories = [
    "All",
    "birthday",
    "book_club",
    "sport",
    "eating",
    "exhibtion",
    "gaming",
    "meeting",
    "workshop",
    "holiday",
  ];

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        leading: const SizedBox(),
        backgroundColor: Theme.of(context).primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back ✨",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
            ),
            Text(
              "${authProvider.userModel?.name}",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
        actions: [
          const Icon(
            Icons.sunny,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Text(
              "En",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ],
        bottom: AppBar(
          toolbarHeight: 120,
          centerTitle: false,
          leadingWidth: 0,
          backgroundColor: Theme.of(context).primaryColor,
          leading: const SizedBox(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.pin_drop_outlined, color: Colors.white),
                  Text("Cairo , Egypt",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 14, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 16,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {
                        selectedCategory = index;
                        setState(() {});
                      },
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selectedCategory == index
                                ? Colors.white
                                : Colors.transparent,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                          ),
                          child: Text(
                            eventCategories[index],
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: selectedCategory == index
                                        ? Colors.black
                                        : Colors.white),
                          )),
                    );
                  },
                  itemCount: eventCategories.length,
                ),
              )
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<TaskModel>>(
          stream: FirebaseManager.getEvent(eventCategories[selectedCategory]),
          builder: (context, snapshot) {
            // if I'm connect on data ,appears show for mini second
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(
                  child: Text("Something went wrong , Please try again"));
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("No Tasks"));
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
                itemBuilder: (context, index) {
                  return EventItem(
                    model: snapshot.data!.docs[index].data(),
                  );
                },
                itemCount: snapshot.data?.docs.length ?? 0,
              ),
            );
          }),
    );
  }
}
