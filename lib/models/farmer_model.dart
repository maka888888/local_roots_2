import '../ui/farmer/onboarding/onboarding_main.dart';

class FarmerModel {
  String appUserId;
  String name;
  String email;
  String phone;
  String companyId;
  String vatId;
  String street;
  String city;
  String country;
  double latitude;
  double longitude;
  bool isSellingInFarm;
  String? smallPhoto;
  String? largePhoto;
  List<String> farmPhotos;
  List<String> categories;
  List<String> certificatesPhotos;
  DateTime inBusinessSince;
  String description;
  bool isApproved;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime lastLogin;
  FarmerOnboardingStep? onboardingStep;
  String uid;

  FarmerModel({
    required this.appUserId,
    required this.name,
    required this.email,
    required this.phone,
    required this.companyId,
    required this.vatId,
    required this.street,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.isSellingInFarm,
    this.smallPhoto,
    this.largePhoto,
    required this.farmPhotos,
    required this.categories,
    required this.certificatesPhotos,
    required this.inBusinessSince,
    required this.description,
    required this.isApproved,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.lastLogin,
    this.onboardingStep,
    required this.uid,
  });

  factory FarmerModel.fromFire(Map<String, dynamic> data) {
    return FarmerModel(
      appUserId: data['appUserId'],
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      companyId: data['companyId'],
      vatId: data['vatId'],
      street: data['street'],
      city: data['city'],
      country: data['country'],
      latitude: data['latitude'],
      longitude: data['longitude'],
      isSellingInFarm: data['isSellingInFarm'],
      smallPhoto: data['smallPhoto'],
      largePhoto: data['largePhoto'],
      farmPhotos: List<String>.from(data['farmPhotos']),
      categories: List<String>.from(data['categories']),
      certificatesPhotos: List<String>.from(data['certificatesPhotos']),
      inBusinessSince: data['inBusinessSince'] == null
          ? DateTime.now()
          : DateTime.parse(data['inBusinessSince']),
      description: data['description'],
      isApproved: data['isApproved'],
      isActive: data['isActive'],
      createdAt: DateTime.parse(data['createdAt']),
      updatedAt: DateTime.parse(data['updatedAt']),
      lastLogin: DateTime.parse(data['lastLogin']),
      uid: data['uid'],
    );
  }

  factory FarmerModel.copyFrom(FarmerModel farmer) {
    return FarmerModel(
      appUserId: farmer.appUserId,
      name: farmer.name,
      email: farmer.email,
      phone: farmer.phone,
      companyId: farmer.companyId,
      vatId: farmer.vatId,
      street: farmer.street,
      city: farmer.city,
      country: farmer.country,
      latitude: farmer.latitude,
      longitude: farmer.longitude,
      isSellingInFarm: farmer.isSellingInFarm,
      smallPhoto: farmer.smallPhoto,
      largePhoto: farmer.largePhoto,
      farmPhotos: farmer.farmPhotos,
      categories: farmer.categories,
      certificatesPhotos: farmer.certificatesPhotos,
      inBusinessSince: farmer.inBusinessSince,
      description: farmer.description,
      isApproved: farmer.isApproved,
      isActive: farmer.isActive,
      createdAt: farmer.createdAt,
      updatedAt: farmer.updatedAt,
      lastLogin: farmer.lastLogin,
      onboardingStep: farmer.onboardingStep,
      uid: farmer.uid,
    );
  }

  FarmerModel copyWith({
    String? appUserId,
    String? name,
    String? email,
    String? phone,
    String? companyId,
    String? vatId,
    String? street,
    String? city,
    String? country,
    double? latitude,
    double? longitude,
    bool? isSellingInFarm,
    String? smallPhoto,
    String? largePhoto,
    List<String>? farmPhotos,
    List<String>? categories,
    List<String>? certificatesPhotos,
    DateTime? inBusinessSince,
    String? description,
    bool? isApproved,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastLogin,
    FarmerOnboardingStep? onboardingStep,
    String? uid,
  }) {
    return FarmerModel(
      appUserId: appUserId ?? this.appUserId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      companyId: companyId ?? this.companyId,
      vatId: vatId ?? this.vatId,
      street: street ?? this.street,
      city: city ?? this.city,
      country: country ?? this.country,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isSellingInFarm: isSellingInFarm ?? this.isSellingInFarm,
      smallPhoto: smallPhoto ?? this.smallPhoto,
      largePhoto: largePhoto ?? this.largePhoto,
      farmPhotos: farmPhotos ?? this.farmPhotos,
      categories: categories ?? this.categories,
      certificatesPhotos: certificatesPhotos ?? this.certificatesPhotos,
      inBusinessSince: inBusinessSince ?? this.inBusinessSince,
      description: description ?? this.description,
      isApproved: isApproved ?? this.isApproved,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastLogin: lastLogin ?? this.lastLogin,
      onboardingStep: onboardingStep ?? this.onboardingStep,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appUserId': appUserId,
      'name': name,
      'email': email,
      'phone': phone,
      'companyId': companyId,
      'vatId': vatId,
      'street': street,
      'city': city,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'isSellingInFarm': isSellingInFarm,
      'smallPhoto': smallPhoto,
      'largePhoto': largePhoto,
      'farmPhotos': farmPhotos,
      'categories': categories,
      'certificatesPhotos': certificatesPhotos,
      'inBusinessSince': inBusinessSince.toIso8601String(),
      'description': description,
      'isApproved': isApproved,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'lastLogin': lastLogin.toIso8601String(),
      'uid': uid,
    };
  }
}
