import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:local_roots_2/models/customer_model.dart';
import 'package:uuid/uuid.dart';

Future<String?> uploadPictureBig(
    BuildContext context, ImageSource source) async {
  var uuid = const Uuid();
  String fileName = uuid.v1();
  final ImagePicker picker = ImagePicker();
  String? url;

  XFile? image = await picker.pickImage(
    source: source,
    imageQuality: 80,
    maxWidth: 1024,
    maxHeight: 1024,
  );

  if (image != null) {
    await FirebaseStorage.instance.ref('images/$fileName.jpg').putData(
          await image.readAsBytes(),
          SettableMetadata(contentType: 'image/jpg'),
        );

    url = await FirebaseStorage.instance
        .ref('images/$fileName.jpg')
        .getDownloadURL();
  }

  return url;
}

Future<String?> uploadPictureSmall(
    BuildContext context, ImageSource source) async {
  var uuid = const Uuid();
  String fileName = uuid.v1();
  final ImagePicker picker = ImagePicker();
  String? url;

  XFile? image = await picker.pickImage(
    source: source,
    imageQuality: 80,
    maxWidth: 100,
    maxHeight: 100,
  );

  if (image != null) {
    await FirebaseStorage.instance.ref('images/$fileName.jpg').putData(
          await image.readAsBytes(),
          SettableMetadata(contentType: 'image/jpg'),
        );

    url = await FirebaseStorage.instance
        .ref('images/$fileName.jpg')
        .getDownloadURL();
  }

  return url;
}

Future<CustomerModel> uploadCustomerPictureProfile(
    ImageSource source, CustomerModel customer) async {
  const uuid = Uuid();
  final fileName = uuid.v1();
  final ImagePicker picker = ImagePicker();

  // Pick the image
  XFile? imageFile = await picker.pickImage(source: source);
  if (imageFile == null) {
    return customer; // If no image is selected, return customer without changes
  }

  // Read the image bytes
  final Uint8List imageBytes = await imageFile.readAsBytes();

  // Process large image
  final String largeImageUrl =
      await _uploadImage(imageBytes, 'images/$fileName-large.jpg', 800, 800);

  // Process small image
  final String smallImageUrl =
      await _uploadImage(imageBytes, 'images/$fileName-small.jpg', 50, 50);

  // Return updated customer with the image URLs
  return customer.copyWith(
      photoLarge: largeImageUrl, photoSmall: smallImageUrl);
}

Future<String> _uploadImage(
    Uint8List imageBytes, String path, int maxWidth, int maxHeight) async {
  // Resize the image
  final img.Image? originalImage = img.decodeImage(imageBytes);
  final img.Image resizedImage =
      img.copyResize(originalImage!, width: maxWidth, height: maxHeight);

  // Convert the resized image back to bytes
  final Uint8List resizedBytes =
      Uint8List.fromList(img.encodeJpg(resizedImage));

  // Upload to Firebase Storage
  final ref = FirebaseStorage.instance.ref(path);
  await ref.putData(resizedBytes, SettableMetadata(contentType: 'image/jpg'));

  // Get the download URL
  return await ref.getDownloadURL();
}

Future<void> deletePhoto(BuildContext context, String url) async {
  Reference ref = FirebaseStorage.instance.refFromURL(url);
  try {
    ref.delete();
  } catch (e) {
    debugPrint(e.toString());
  }
}

Future<String?> uploadCertificatePhoto(
    BuildContext context, ImageSource source) async {
  var uuid = const Uuid();
  String fileName = uuid.v1();
  final ImagePicker picker = ImagePicker();
  String? url;

  XFile? image = await picker.pickImage(
    source: source,
    maxWidth: 1024,
    maxHeight: 1024,
  );

  if (image != null) {
    await FirebaseStorage.instance.ref('images/$fileName.jpg').putData(
          await image.readAsBytes(),
          SettableMetadata(contentType: 'image/jpg'),
        );

    url = await FirebaseStorage.instance
        .ref('images/$fileName.jpg')
        .getDownloadURL();
  }

  return url;
}
