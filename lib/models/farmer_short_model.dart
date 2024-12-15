import 'farmer_model.dart';

class FarmerShortModel {
  String appUserId;
  String name;
  String email;
  String phone;
  String street;
  String city;
  String country;
  String? smallPhoto;
  bool isApproved;
  bool isActive;

  FarmerShortModel({
    required this.appUserId,
    required this.name,
    required this.email,
    required this.phone,
    required this.street,
    required this.city,
    required this.country,
    this.smallPhoto,
    required this.isApproved,
    required this.isActive,
  });

  factory FarmerShortModel.fromFire(Map<String, dynamic> data) {
    return FarmerShortModel(
      appUserId: data['appUserId'],
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      street: data['street'],
      city: data['city'],
      country: data['country'],
      smallPhoto: data['smallPhoto'],
      isApproved: data['isApproved'],
      isActive: data['isActive'],
    );
  }

  factory FarmerShortModel.copyFrom(FarmerShortModel farmer) {
    return FarmerShortModel(
      appUserId: farmer.appUserId,
      name: farmer.name,
      email: farmer.email,
      phone: farmer.phone,
      street: farmer.street,
      city: farmer.city,
      country: farmer.country,
      smallPhoto: farmer.smallPhoto,
      isApproved: farmer.isApproved,
      isActive: farmer.isActive,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appUserId': appUserId,
      'name': name,
      'email': email,
      'phone': phone,
      'street': street,
      'city': city,
      'country': country,
      'smallPhoto': smallPhoto,
      'isApproved': isApproved,
      'isActive': isActive,
    };
  }

  factory FarmerShortModel.fromFarmer(FarmerModel farmer) {
    return FarmerShortModel(
      appUserId: farmer.appUserId,
      name: farmer.name,
      email: farmer.email,
      phone: farmer.phone,
      street: farmer.street,
      city: farmer.city,
      country: farmer.country,
      smallPhoto: farmer.smallPhoto,
      isApproved: farmer.isApproved,
      isActive: farmer.isActive,
    );
  }
}
