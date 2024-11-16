import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:local_roots_2/models/customer_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/models/offer_model.dart';
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

  XFile? imageFile = await picker.pickImage(source: source);
  if (imageFile == null) {
    return customer;
  }

  final Uint8List imageBytes = await imageFile.readAsBytes();

  final String largeImageUrl =
      await _uploadImage(imageBytes, 'customers/$fileName-large.jpg', 800, 800);

  final String smallImageUrl =
      await _uploadImage(imageBytes, 'customers/$fileName-small.jpg', 50, 50);

  return customer.copyWith(
      photoLarge: largeImageUrl, photoSmall: smallImageUrl);
}

Future<FarmerModel> uploadFarmerPictureProfile(
    ImageSource source, FarmerModel farmer) async {
  const uuid = Uuid();
  final fileName = uuid.v1();
  final ImagePicker picker = ImagePicker();

  XFile? imageFile = await picker.pickImage(source: source);
  if (imageFile == null) {
    return farmer;
  }

  final Uint8List imageBytes = await imageFile.readAsBytes();

  final String largeImageUrl =
      await _uploadImage(imageBytes, 'farmers/$fileName-large.jpg', 800, 800);

  final String smallImageUrl =
      await _uploadImage(imageBytes, 'farmers/$fileName-small.jpg', 50, 50);

  return farmer.copyWith(largePhoto: largeImageUrl, smallPhoto: smallImageUrl);
}

Future<OfferModel> uploadOfferPhoto(
    ImageSource source, OfferModel offer) async {
  const uuid = Uuid();
  final fileName = uuid.v1();
  final ImagePicker picker = ImagePicker();

  XFile? imageFile = await picker.pickImage(source: source);
  if (imageFile == null) {
    return offer;
  }

  final Uint8List imageBytes = await imageFile.readAsBytes();

  final String largeImageUrl =
      await _uploadImage(imageBytes, 'offers/$fileName-large.jpg', 800, 800);

  final String smallImageUrl =
      await _uploadImage(imageBytes, 'offers/$fileName-small.jpg', 50, 50);

  return offer.copyWith(
    mainPhotoLarge: largeImageUrl,
    mainPhotoSmall: smallImageUrl,
  );
}

Future<String> _uploadImage(
    Uint8List imageBytes, String path, int maxWidth, int maxHeight) async {
  // Decode the image
  final img.Image? originalImage = img.decodeImage(imageBytes);
  if (originalImage == null) {
    throw Exception('Failed to decode image');
  }

  // Calculate dimensions to maintain aspect ratio
  final int originalWidth = originalImage.width;
  final int originalHeight = originalImage.height;

  final double aspectRatio = originalWidth / originalHeight;

  int targetWidth = maxWidth;
  int targetHeight = maxHeight;

  if (aspectRatio > 1) {
    // Landscape image
    targetHeight = (maxWidth / aspectRatio).round();
  } else {
    // Portrait or square image
    targetWidth = (maxHeight * aspectRatio).round();
  }

  // Resize the image while maintaining the aspect ratio
  final img.Image resizedImage =
      img.copyResize(originalImage, width: targetWidth, height: targetHeight);

  // Encode the resized image
  final Uint8List resizedBytes =
      Uint8List.fromList(img.encodeJpg(resizedImage));

  // Upload the resized image to Firebase Storage
  final ref = FirebaseStorage.instance.ref(path);
  await ref.putData(resizedBytes, SettableMetadata(contentType: 'image/jpg'));

  // Return the download URL
  return await ref.getDownloadURL();
}

// Future<String> _uploadImage(
//     Uint8List imageBytes, String path, int maxWidth, int maxHeight) async {
//   final img.Image? originalImage = img.decodeImage(imageBytes);
//   final img.Image resizedImage =
//       img.copyResize(originalImage!, width: maxWidth, height: maxHeight);
//
//   final Uint8List resizedBytes =
//       Uint8List.fromList(img.encodeJpg(resizedImage));
//
//   final ref = FirebaseStorage.instance.ref(path);
//   await ref.putData(resizedBytes, SettableMetadata(contentType: 'image/jpg'));
//
//   return await ref.getDownloadURL();
// }

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

Future<String?> uploadFarmPhoto(
    BuildContext context, ImageSource source) async {
  var uuid = const Uuid();
  String fileName = uuid.v1();
  final ImagePicker picker = ImagePicker();
  String? url;

  XFile? image = await picker.pickImage(
    source: source,
    maxWidth: 800,
    maxHeight: 800,
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
