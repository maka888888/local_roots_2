import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_roots_2/models/farmer_short_model.dart';

import '../ui/farmer/offers/new_offer/offer_new_main.dart';

class OfferModel {
  String id;
  String shortId;
  String name;
  String? description;
  String? ingredients;
  String category;
  String mainPhotoLarge;
  String mainPhotoSmall;
  List<String> photosLarge;
  List<String> photosSmall;
  double price;
  String currency;
  String unit;
  int heightCm;
  int widthCm;
  int lengthCm;
  int weightG;
  bool isWeightFixed;
  int? weightMinG;
  int? weightMaxG;
  bool isActive;
  bool isApproved;
  DateTime createdAt;
  DateTime updatedAt;
  FarmerShortModel farmerShort;
  FarmerOfferNewStep? onboardingStep;
  String uid;

  OfferModel({
    required this.id,
    required this.shortId,
    required this.name,
    this.description,
    this.ingredients,
    required this.category,
    required this.mainPhotoLarge,
    required this.mainPhotoSmall,
    required this.photosLarge,
    required this.photosSmall,
    required this.price,
    required this.currency,
    required this.unit,
    required this.heightCm,
    required this.widthCm,
    required this.lengthCm,
    required this.weightG,
    required this.isWeightFixed,
    this.weightMinG,
    this.weightMaxG,
    required this.isActive,
    required this.isApproved,
    required this.createdAt,
    required this.updatedAt,
    required this.farmerShort,
    this.onboardingStep,
    required this.uid,
  });

  factory OfferModel.fromFire(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return OfferModel(
      id: document.id,
      shortId: data['shortId'],
      name: data['name'],
      description: data['description'],
      ingredients: data['ingredients'],
      category: data['category'],
      mainPhotoLarge: data['mainPhotoLarge'],
      mainPhotoSmall: data['mainPhotoSmall'],
      photosLarge: List<String>.from(data['photosLarge']),
      photosSmall: List<String>.from(data['photosSmall']),
      price: data['price'],
      currency: data['currency'],
      unit: data['unit'],
      heightCm: data['heightCm'],
      widthCm: data['widthCm'],
      lengthCm: data['lengthCm'],
      weightG: data['weightG'],
      isWeightFixed: data['isWeightFixed'],
      weightMinG: data['weightMinG'] == null ? null : data['weightMinG'],
      weightMaxG: data['weightMaxG'] == null ? null : data['weightMaxG'],
      isActive: data['isActive'],
      isApproved: data['isApproved'],
      createdAt: DateTime.parse(data['createdAt']),
      updatedAt: DateTime.parse(data['updatedAt']),
      farmerShort: FarmerShortModel.fromFire(data['farmerShort']),
      uid: data['uid'],
    );
  }

  static OfferModel copyFrom(OfferModel model) {
    return OfferModel(
      id: model.id,
      shortId: model.shortId,
      name: model.name,
      description: model.description,
      ingredients: model.ingredients,
      category: model.category,
      mainPhotoLarge: model.mainPhotoLarge,
      mainPhotoSmall: model.mainPhotoSmall,
      photosLarge: model.photosLarge,
      photosSmall: model.photosSmall,
      price: model.price,
      currency: model.currency,
      unit: model.unit,
      heightCm: model.heightCm,
      widthCm: model.widthCm,
      lengthCm: model.lengthCm,
      weightG: model.weightG,
      isWeightFixed: model.isWeightFixed,
      weightMinG: model.weightMinG,
      weightMaxG: model.weightMaxG,
      isActive: model.isActive,
      isApproved: model.isApproved,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      farmerShort: FarmerShortModel.copyFrom(model.farmerShort),
      onboardingStep: model.onboardingStep,
      uid: model.uid,
    );
  }

  OfferModel copyWith({
    String? id,
    String? shortId,
    String? name,
    String? description,
    String? ingredients,
    String? category,
    String? mainPhotoLarge,
    String? mainPhotoSmall,
    List<String>? photosLarge,
    List<String>? photosSmall,
    double? price,
    String? currency,
    String? unit,
    int? heightCm,
    int? widthCm,
    int? lengthCm,
    int? weightG,
    bool? isWeightFixed,
    int? weightMinG,
    int? weightMaxG,
    bool? isActive,
    bool? isApproved,
    DateTime? createdAt,
    DateTime? updatedAt,
    FarmerShortModel? farmerShort,
    FarmerOfferNewStep? onboardingStep,
    String? uid,
  }) {
    return OfferModel(
      id: id ?? this.id,
      shortId: shortId ?? this.shortId,
      name: name ?? this.name,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      category: category ?? this.category,
      mainPhotoLarge: mainPhotoLarge ?? this.mainPhotoLarge,
      mainPhotoSmall: mainPhotoSmall ?? this.mainPhotoSmall,
      photosLarge: photosLarge ?? this.photosLarge,
      photosSmall: photosSmall ?? this.photosSmall,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      unit: unit ?? this.unit,
      heightCm: heightCm ?? this.heightCm,
      widthCm: widthCm ?? this.widthCm,
      lengthCm: lengthCm ?? this.lengthCm,
      weightG: weightG ?? this.weightG,
      isWeightFixed: isWeightFixed ?? this.isWeightFixed,
      weightMinG: weightMinG ?? this.weightMinG,
      weightMaxG: weightMaxG ?? this.weightMaxG,
      isActive: isActive ?? this.isActive,
      isApproved: isApproved ?? this.isApproved,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      farmerShort: farmerShort ?? this.farmerShort,
      onboardingStep: onboardingStep ?? this.onboardingStep,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'shortId': shortId,
      'name': name,
      'description': description,
      'ingredients': ingredients,
      'category': category,
      'mainPhotoLarge': mainPhotoLarge,
      'mainPhotoSmall': mainPhotoSmall,
      'photosLarge': photosLarge,
      'photosSmall': photosSmall,
      'price': price,
      'currency': currency,
      'unit': unit,
      'heightCm': heightCm,
      'widthCm': widthCm,
      'lengthCm': lengthCm,
      'weightG': weightG,
      'isWeightFixed': isWeightFixed,
      'weightMinG': weightMinG,
      'weightMaxG': weightMaxG,
      'isActive': isActive,
      'isApproved': isApproved,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'farmerShort': farmerShort.toJson(),
      'uid': uid,
    };
  }
}
