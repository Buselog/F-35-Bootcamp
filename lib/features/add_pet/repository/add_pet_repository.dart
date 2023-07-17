// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f35/core/constants/firebase_constants.dart';
import 'package:f35/core/providers/firebase_providers.dart';
import 'package:f35/models/pet_post_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

final addPetRepositoryProvider = Provider((ref) => AddPetRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    firebaseStorage: ref.read(storageProvider)));

class AddPetRepository {
  // to save the post to db
  final FirebaseFirestore _firestore;
  // to save the uploader
  final FirebaseAuth _auth;
  // to save images
  final FirebaseStorage _firebaseStorage;
  late final String downloadUrl;

  AddPetRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required FirebaseStorage firebaseStorage,
  })  : _firestore = firestore,
        _auth = auth,
        _firebaseStorage = firebaseStorage;

  CollectionReference get _posts =>
      _firestore.collection(FirebaseConstants.postsCollection);

  void pickImageFromCamera() async {
    try {
      PlatformFile? file;
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) print('no photo returned');
      downloadUrl = image!.path;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  } //end-of-pickImageFromCamera

  void pickImageFromGallery() async {
    File? image;
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) print('no photo returned');
      downloadUrl = image!.path;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  } //end-of-pickImageFromGallery

  // util func to generate random post id's
  String generatePostID() {
    var uuid = Uuid();
    var v1 = uuid.v1();
    return v1;
  } // end-of-generatePostID

  String getCurrentUser() {
    User? user = _auth.currentUser;
    final String? uid = user?.uid;
    return uid ?? 'null';
  }

  void saveDataToFirestore(String petName, String petInfo, double moneyNeeded,
      int petAge, double petWeight, String petGender) async {
    PetModel petModel;
    final postID = generatePostID();
    final currUser = getCurrentUser();
    petModel = PetModel(
        vetUID: currUser,
        postID: postID,
        petName: petName,
        petInfo: petInfo,
        moneyNeeded: moneyNeeded,
        petPhoto: downloadUrl,
        petAge: petAge,
        petWeight: petWeight,
        petGender: petGender);

    await _posts.doc(postID).set(petModel.toMap());
    print('saved post to fb');
  } // end-of-saveDataToFirestore
}
