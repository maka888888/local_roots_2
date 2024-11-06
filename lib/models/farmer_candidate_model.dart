import 'package:cloud_firestore/cloud_firestore.dart';

import '../ui/customer/common/farmer_widgets/farmer_candidate/farmer_candidate_main.dart';

class FarmerCandidateModel {
  String id;
  String name;
  String email;
  String phone;
  String street;
  String city;
  String country;
  double latitude;
  double longitude;
  List<String> categories;
  List<String> certificatesPhotos;
  int yearsExperience;
  String description;
  bool isApproved;
  DateTime createdAt;
  FarmerCandidateStep? step;
  String uid;

  FarmerCandidateModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.street,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.categories,
    required this.certificatesPhotos,
    required this.yearsExperience,
    required this.description,
    required this.isApproved,
    required this.createdAt,
    this.step,
    required this.uid,
  });

  factory FarmerCandidateModel.fromFire(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return FarmerCandidateModel(
      id: document.id,
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      street: data['street'],
      city: data['city'],
      country: data['country'],
      latitude: data['latitude'],
      longitude: data['longitude'],
      categories: List<String>.from(data['categories']),
      certificatesPhotos: List<String>.from(data['certificatesPhotos']),
      yearsExperience: data['yearsExperience'],
      description: data['description'],
      isApproved: data['isApproved'],
      createdAt: DateTime.parse(data['createdAt']),
      uid: data['uid'],
    );
  }

  FarmerCandidateModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? street,
    String? city,
    String? country,
    double? latitude,
    double? longitude,
    List<String>? categories,
    List<String>? certificatesPhotos,
    int? yearsExperience,
    String? description,
    bool? isApproved,
    DateTime? createdAt,
    FarmerCandidateModel? step,
    String? uid,
  }) {
    return FarmerCandidateModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      street: street ?? this.street,
      city: city ?? this.city,
      country: country ?? this.country,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      categories: categories ?? this.categories,
      certificatesPhotos: certificatesPhotos ?? this.certificatesPhotos,
      yearsExperience: yearsExperience ?? this.yearsExperience,
      description: description ?? this.description,
      isApproved: isApproved ?? this.isApproved,
      createdAt: createdAt ?? this.createdAt,
      step: this.step,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'street': street,
      'city': city,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'categories': categories,
      'certificatesPhotos': certificatesPhotos,
      'yearsExperience': yearsExperience,
      'description': description,
      'isApproved': isApproved,
      'createdAt': createdAt.toIso8601String(),
      'uid': uid,
    };
  }

  factory FarmerCandidateModel.copyFrom(
      FarmerCandidateModel farmerCandidateModel) {
    return FarmerCandidateModel(
      id: farmerCandidateModel.id,
      name: farmerCandidateModel.name,
      email: farmerCandidateModel.email,
      phone: farmerCandidateModel.phone,
      street: farmerCandidateModel.street,
      city: farmerCandidateModel.city,
      country: farmerCandidateModel.country,
      latitude: farmerCandidateModel.latitude,
      longitude: farmerCandidateModel.longitude,
      categories: farmerCandidateModel.categories,
      certificatesPhotos: farmerCandidateModel.certificatesPhotos,
      yearsExperience: farmerCandidateModel.yearsExperience,
      description: farmerCandidateModel.description,
      isApproved: farmerCandidateModel.isApproved,
      createdAt: farmerCandidateModel.createdAt,
      step: farmerCandidateModel.step,
      uid: farmerCandidateModel.uid,
    );
  }
}
