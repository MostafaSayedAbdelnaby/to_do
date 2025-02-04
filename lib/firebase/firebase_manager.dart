import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do/model/task_model.dart';

import '../model/user_model.dart';

class FirebaseManager {
  // How to determine the name of this function because that withConverter return type is CollectionReference<TaskModel>
  /// I'm    Model > withConverter > Map > firebase.
  /// I'm  < Model < withConverter < Map   firebase.
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      // Type: TaskModel Function(DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
      fromFirestore: (snapshot, _) {
        // Map<String, dynamic>? data()
        return TaskModel.fromJson(snapshot
            .data()!); // snapshot takes {Map() == data()} & return Model
      },
      // Type: Map<String, Object?> Function(TaskModel, SetOptions?)
      toFirestore: (model, _) {
        return model.toJson(); // value have a Model & set Map
      },
    );

    /// .instance means to take an object from firebase
    /// add equivalent document("").thing
    // FirebaseFirestore.instance.collection("Tasks").add({
    //   "Name":"Mohamed",
    //   "Age":"11",
    //   "Phone":"01124861463"
    // });
  }

  static Future<void> addEvent(TaskModel model) {
    var collection =
        getTasksCollection(); // create collection for getTasksCollection
    var decRef = collection.doc(); // generate auto id
    model.id =
        decRef.id; // get id that created in firebase & it takes for model.id
    return decRef.set(model); // set data for document
  }

  static Stream<QuerySnapshot<TaskModel>> getEvent(String categoryName) {
    var collection = getTasksCollection();
    // use orderBy("date") to oder all created event occurs date
    // snapshots is realtimeChange

    if (categoryName == "All") {
      return collection
          .orderBy("date")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots();
    } else {
      return collection
          .orderBy("date")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where("category",
              isEqualTo: categoryName) // it's create index Firestore
          // .where("isFavorite", isEqualTo: true)  it's used when build favoriteScreen
          .snapshots();
    }
    // if i'm put Future without Stream & get() without snapshot(), in her and home_tab
    // hot reload don't appear a new created event so i'm Run app again
  }

  static Future<void> deleteEvent(String id) {
    var collection = getTasksCollection();
    return collection.doc(id).delete();
  }

  static Future<void> updateEvent(TaskModel model) {
    var collection = getTasksCollection();
    return collection.doc(model.id).update(model.toJson());
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (model, _) {
        return model.toJson();
      },
    );
  }

  static Future<void> addUser(UserModel model) {
    // create collection for getTasksCollection
    var collection = getUsersCollection();
    // should be that { id of Auth } the same { id of firestore }
    // So get modelId that in Auth to link with id of document
    var decRef = collection.doc(model.id);
    return decRef.set(model); // set data for document
  }

  static Future<UserModel?> readUserDate(String id) async {
    var collection = getUsersCollection();
    DocumentSnapshot<UserModel> snapshot = await collection.doc(id).get();
    return snapshot.data();
  }

  static Future<void> createUser(
    String email,
    String password,
    String name,
    Function onSuccess,
    Function onLoading,
    Function onError,
  ) async {
    try {
      onLoading(); // call back Function , it acts in RegisterScreen

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel model = UserModel(
        id: credential.user!.uid, // Use UID from Firebase Authentication
        email: email,
        name: name,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      await addUser(model); // Save user data to Firestore
      onSuccess(); // call back Function
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message!); // call back Function with message
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message!); // call back Function with message
        print('The account already exists for that email.');
      }
    } catch (e) {
      onError(
          "Something went wrong"); // call back Function with a default message
      print(e);
    }
  }



  static Future<void> logOut() {
    return FirebaseAuth.instance.signOut();
  }

  static Future<void> loginWithPhoneNumber(
      String phoneNumber,
      Function onCodeSent,
      Function onError,
      Function onSuccess) async {

    FirebaseAuth auth = FirebaseAuth.instance;
    return await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber ,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential);
      },

      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
        // Handle other errors
      },

      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = 'xxxx';
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },

      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }
}



// static Future<void> loginWithPhoneNumber(
// String phoneNumber,
// Function onCodeSent,
// Function onError,
// Function onSuccess) async {
// FirebaseAuth auth = FirebaseAuth.instance;
//
// await FirebaseAuth.instance.verifyPhoneNumber(
// phoneNumber: phoneNumber,
// verificationCompleted: (PhoneAuthCredential credential) async {
// // Automatically sign the user in (or link) with the auto-generated credential
// await auth.signInWithCredential(credential);
// onSuccess(); // Call onSuccess if login is successful
// },
// verificationFailed: (FirebaseAuthException e) {
// onError(e.message!); // Call onError with the error message
// },
// codeSent: (String verificationId, int? resendToken) {
// onCodeSent(verificationId);
// },
// codeAutoRetrievalTimeout: (String verificationId) {
// // Auto-resolution timed out...
// },
// );
// }

// static void resetPassword() {
//   FirebaseAuth.instance
//       .sendPasswordResetEmail(email: "mostafaalawamy9@gmail.com");
// }
