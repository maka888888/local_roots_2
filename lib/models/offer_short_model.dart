import 'package:local_roots_2/models/offer_model.dart';

class OfferShortModel {
  String id;
  String farmerId;
  String shortId;
  String name;
  String category;
  String mainPhotoSmall;
  double price;
  String currency;
  String unit;
  bool isActive;
  bool isApproved;

  OfferShortModel({
    required this.id,
    required this.farmerId,
    required this.shortId,
    required this.name,
    required this.category,
    required this.mainPhotoSmall,
    required this.price,
    required this.currency,
    required this.unit,
    required this.isActive,
    required this.isApproved,
  });

  factory OfferShortModel.fromFire(Map<String, dynamic> data) {
    return OfferShortModel(
      id: data['id'],
      farmerId: data['farmerId'],
      shortId: data['shortId'],
      name: data['name'],
      category: data['category'],
      mainPhotoSmall: data['mainPhotoSmall'],
      price: double.tryParse(data['price'].toString()) ?? 0,
      currency: data['currency'],
      unit: data['unit'],
      isActive: data['isActive'],
      isApproved: data['isApproved'],
    );
  }

  factory OfferShortModel.copyFrom(OfferShortModel offer) {
    return OfferShortModel(
      id: offer.id,
      farmerId: offer.farmerId,
      shortId: offer.shortId,
      name: offer.name,
      category: offer.category,
      mainPhotoSmall: offer.mainPhotoSmall,
      price: offer.price,
      currency: offer.currency,
      unit: offer.unit,
      isActive: offer.isActive,
      isApproved: offer.isApproved,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'farmerId': farmerId,
      'shortId': shortId,
      'name': name,
      'category': category,
      'mainPhotoSmall': mainPhotoSmall,
      'price': price,
      'currency': currency,
      'unit': unit,
      'isActive': isActive,
      'isApproved': isApproved,
    };
  }

  factory OfferShortModel.fromOffer(OfferModel offer) {
    return OfferShortModel(
      id: offer.id,
      farmerId: offer.farmerShort.appUserId,
      shortId: offer.shortId,
      name: offer.name,
      category: offer.category,
      mainPhotoSmall: offer.mainPhotoSmall,
      price: offer.price,
      currency: offer.currency,
      unit: offer.unit,
      isActive: offer.isActive,
      isApproved: offer.isApproved,
    );
  }

  factory OfferShortModel.fromOfferModel(OfferShortModel offer) {
    return OfferShortModel(
      id: offer.id,
      farmerId: offer.farmerId,
      shortId: offer.shortId,
      name: offer.name,
      category: offer.category,
      mainPhotoSmall: offer.mainPhotoSmall,
      price: offer.price,
      currency: offer.currency,
      unit: offer.unit,
      isActive: offer.isActive,
      isApproved: offer.isApproved,
    );
  }
}
