import '../ui/customer/onboarding/onboarding_main.dart';

class CustomerModel {
  String name;
  String email;
  String phone;
  String street;
  String city;
  String country;
  double latitude;
  double longitude;
  String? photoSmall;
  String? photoLarge;
  DateTime createdAt;
  CustomerOnboardingStep? onboardingStep;
  String uid;

  CustomerModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.street,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
    this.photoSmall,
    this.photoLarge,
    required this.createdAt,
    this.onboardingStep,
    required this.uid,
  });

  factory CustomerModel.fromFire(Map<String, dynamic> data) {
    return CustomerModel(
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      street: data['street'],
      city: data['city'],
      country: data['country'],
      latitude: data['latitude'],
      longitude: data['longitude'],
      photoSmall: data['photoSmall'],
      photoLarge: data['photoLarge'],
      createdAt: DateTime.parse(data['createdAt']),
      uid: data['uid'],
    );
  }

  factory CustomerModel.copyFrom(CustomerModel customer) {
    return CustomerModel(
      name: customer.name,
      email: customer.email,
      phone: customer.phone,
      street: customer.street,
      city: customer.city,
      country: customer.country,
      latitude: customer.latitude,
      longitude: customer.longitude,
      photoSmall: customer.photoSmall,
      photoLarge: customer.photoLarge,
      createdAt: customer.createdAt,
      onboardingStep: customer.onboardingStep,
      uid: customer.uid,
    );
  }

  CustomerModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? street,
    String? city,
    String? country,
    double? latitude,
    double? longitude,
    String? photoSmall,
    String? photoLarge,
    DateTime? createdAt,
    CustomerOnboardingStep? onboardingStep,
    String? uid,
  }) {
    return CustomerModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      street: street ?? this.street,
      city: city ?? this.city,
      country: country ?? this.country,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      photoSmall: photoSmall ?? this.photoSmall,
      photoLarge: photoLarge ?? this.photoLarge,
      createdAt: createdAt ?? this.createdAt,
      onboardingStep: onboardingStep ?? this.onboardingStep,
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
      'photoSmall': photoSmall,
      'photoLarge': photoLarge,
      'createdAt': createdAt.toIso8601String(),
      'uid': uid,
    };
  }
}
