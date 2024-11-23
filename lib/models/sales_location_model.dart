import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_roots_2/models/farmer_short_model.dart';

import '../ui/farmer/common/sales_location_widgets/sales_location_new/sales_location_main.dart';

class SalesLocationModel {
  String id;
  String farmerAppUserId;
  FarmerShortModel farmerShort;
  String name;
  String street;
  String city;
  String country;
  double latitude;
  double longitude;
  List<String> photoUrls;
  bool canPrepareOrderSameDay;
  DateTime? prepareOrderSameDayLatest;
  bool workOnMonday;
  DateTime workOnMondayStart;
  DateTime workOnMondayEnd;
  bool workOnTuesday;
  DateTime workOnTuesdayStart;
  DateTime workOnTuesdayEnd;
  bool workOnWednesday;
  DateTime workOnWednesdayStart;
  DateTime workOnWednesdayEnd;
  bool workOnThursday;
  DateTime workOnThursdayStart;
  DateTime workOnThursdayEnd;
  bool workOnFriday;
  DateTime workOnFridayStart;
  DateTime workOnFridayEnd;
  bool workOnSaturday;
  DateTime workOnSaturdayStart;
  DateTime workOnSaturdayEnd;
  bool workOnSunday;
  DateTime workOnSundayStart;
  DateTime workOnSundayEnd;
  double minimalOrderPrice;
  String minimalOrderPriceCurrency;
  bool paymentOptionsShow;
  bool paymentOptionsCash;
  bool paymentOptionsCard;
  bool paymentOptionsTransfer;
  String? paymentAccountNumber;
  String? additionalInfo;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  bool isApproved;
  SalesLocationNewStep? onboardingStep;
  String? uid;

  SalesLocationModel({
    required this.id,
    required this.farmerAppUserId,
    required this.farmerShort,
    required this.name,
    required this.street,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.photoUrls,
    required this.canPrepareOrderSameDay,
    this.prepareOrderSameDayLatest,
    required this.workOnMonday,
    required this.workOnMondayStart,
    required this.workOnMondayEnd,
    required this.workOnTuesday,
    required this.workOnTuesdayStart,
    required this.workOnTuesdayEnd,
    required this.workOnWednesday,
    required this.workOnWednesdayStart,
    required this.workOnWednesdayEnd,
    required this.workOnThursday,
    required this.workOnThursdayStart,
    required this.workOnThursdayEnd,
    required this.workOnFriday,
    required this.workOnFridayStart,
    required this.workOnFridayEnd,
    required this.workOnSaturday,
    required this.workOnSaturdayStart,
    required this.workOnSaturdayEnd,
    required this.workOnSunday,
    required this.workOnSundayStart,
    required this.workOnSundayEnd,
    required this.minimalOrderPrice,
    required this.minimalOrderPriceCurrency,
    required this.paymentOptionsShow,
    required this.paymentOptionsCash,
    required this.paymentOptionsCard,
    required this.paymentOptionsTransfer,
    required this.paymentAccountNumber,
    required this.additionalInfo,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.isApproved,
    this.onboardingStep,
    required this.uid,
  });

  factory SalesLocationModel.fromFire(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return SalesLocationModel(
      id: document.id,
      farmerAppUserId: data['farmerAppUserId'],
      farmerShort: FarmerShortModel.fromFire(data['farmerShort']),
      name: data['name'],
      street: data['street'],
      city: data['city'],
      country: data['country'],
      latitude: data['latitude'],
      longitude: data['longitude'],
      photoUrls: List<String>.from(data['photoUrls']),
      canPrepareOrderSameDay: data['canPrepareOrderSameDay'],
      prepareOrderSameDayLatest: data['prepareOrderSameDayLatest'] == null
          ? null
          : data['prepareOrderSameDayLatest'].toDate(),
      workOnMonday: data['workOnMonday'],
      workOnMondayStart: data['workOnMondayStart'].toDate(),
      workOnMondayEnd: data['workOnMondayEnd'].toDate(),
      workOnTuesday: data['workOnTuesday'],
      workOnTuesdayStart: data['workOnTuesdayStart'].toDate(),
      workOnTuesdayEnd: data['workOnTuesdayEnd'].toDate(),
      workOnWednesday: data['workOnWednesday'],
      workOnWednesdayStart: data['workOnWednesdayStart'].toDate(),
      workOnWednesdayEnd: data['workOnWednesdayEnd'].toDate(),
      workOnThursday: data['workOnThursday'],
      workOnThursdayStart: data['workOnThursdayStart'].toDate(),
      workOnThursdayEnd: data['workOnThursdayEnd'].toDate(),
      workOnFriday: data['workOnFriday'],
      workOnFridayStart: data['workOnFridayStart'].toDate(),
      workOnFridayEnd: data['workOnFridayEnd'].toDate(),
      workOnSaturday: data['workOnSaturday'],
      workOnSaturdayStart: data['workOnSaturdayStart'].toDate(),
      workOnSaturdayEnd: data['workOnSaturdayEnd'].toDate(),
      workOnSunday: data['workOnSunday'],
      workOnSundayStart: data['workOnSundayStart'].toDate(),
      workOnSundayEnd: data['workOnSundayEnd'].toDate(),
      minimalOrderPrice: data['minimalOrderPrice'],
      minimalOrderPriceCurrency: data['minimalOrderPriceCurrency'],
      paymentOptionsShow: data['paymentOptionsShow'],
      paymentOptionsCash: data['paymentOptionsCash'],
      paymentOptionsCard: data['paymentOptionsCard'],
      paymentOptionsTransfer: data['paymentOptionsTransfer'],
      paymentAccountNumber: data['paymentAccountNumber'],
      additionalInfo: data['additionalInfo'],
      createdAt: data['createdAt'].toDate(),
      updatedAt: data['updatedAt'].toDate(),
      isActive: data['isActive'],
      isApproved: data['isApproved'],
      uid: data['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'farmerAppUserId': farmerAppUserId,
      'farmerShort': farmerShort.toJson(),
      'name': name,
      'street': street,
      'city': city,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'photoUrls': photoUrls,
      'canPrepareOrderSameDay': canPrepareOrderSameDay,
      'prepareOrderSameDayLatest': prepareOrderSameDayLatest,
      'workOnMonday': workOnMonday,
      'workOnMondayStart': workOnMondayStart,
      'workOnMondayEnd': workOnMondayEnd,
      'workOnTuesday': workOnTuesday,
      'workOnTuesdayStart': workOnTuesdayStart,
      'workOnTuesdayEnd': workOnTuesdayEnd,
      'workOnWednesday': workOnWednesday,
      'workOnWednesdayStart': workOnWednesdayStart,
      'workOnWednesdayEnd': workOnWednesdayEnd,
      'workOnThursday': workOnThursday,
      'workOnThursdayStart': workOnThursdayStart,
      'workOnThursdayEnd': workOnThursdayEnd,
      'workOnFriday': workOnFriday,
      'workOnFridayStart': workOnFridayStart,
      'workOnFridayEnd': workOnFridayEnd,
      'workOnSaturday': workOnSaturday,
      'workOnSaturdayStart': workOnSaturdayStart,
      'workOnSaturdayEnd': workOnSaturdayEnd,
      'workOnSunday': workOnSunday,
      'workOnSundayStart': workOnSundayStart,
      'workOnSundayEnd': workOnSundayEnd,
      'minimalOrderPrice': minimalOrderPrice,
      'minimalOrderPriceCurrency': minimalOrderPriceCurrency,
      'paymentOptionsShow': paymentOptionsShow,
      'paymentOptionsCash': paymentOptionsCash,
      'paymentOptionsCard': paymentOptionsCard,
      'paymentOptionsTransfer': paymentOptionsTransfer,
      'paymentAccountNumber': paymentAccountNumber,
      'additionalInfo': additionalInfo,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isActive': isActive,
      'isApproved': isApproved,
      'uid': uid,
    };
  }

  factory SalesLocationModel.copyFrom(SalesLocationModel salesLocation) {
    return SalesLocationModel(
      id: salesLocation.id,
      farmerAppUserId: salesLocation.farmerAppUserId,
      farmerShort: salesLocation.farmerShort,
      name: salesLocation.name,
      street: salesLocation.street,
      city: salesLocation.city,
      country: salesLocation.country,
      latitude: salesLocation.latitude,
      longitude: salesLocation.longitude,
      photoUrls: salesLocation.photoUrls,
      canPrepareOrderSameDay: salesLocation.canPrepareOrderSameDay,
      prepareOrderSameDayLatest: salesLocation.prepareOrderSameDayLatest,
      workOnMonday: salesLocation.workOnMonday,
      workOnMondayStart: salesLocation.workOnMondayStart,
      workOnMondayEnd: salesLocation.workOnMondayEnd,
      workOnTuesday: salesLocation.workOnTuesday,
      workOnTuesdayStart: salesLocation.workOnTuesdayStart,
      workOnTuesdayEnd: salesLocation.workOnTuesdayEnd,
      workOnWednesday: salesLocation.workOnWednesday,
      workOnWednesdayStart: salesLocation.workOnWednesdayStart,
      workOnWednesdayEnd: salesLocation.workOnWednesdayEnd,
      workOnThursday: salesLocation.workOnThursday,
      workOnThursdayStart: salesLocation.workOnThursdayStart,
      workOnThursdayEnd: salesLocation.workOnThursdayEnd,
      workOnFriday: salesLocation.workOnFriday,
      workOnFridayStart: salesLocation.workOnFridayStart,
      workOnFridayEnd: salesLocation.workOnFridayEnd,
      workOnSaturday: salesLocation.workOnSaturday,
      workOnSaturdayStart: salesLocation.workOnSaturdayStart,
      workOnSaturdayEnd: salesLocation.workOnSaturdayEnd,
      workOnSunday: salesLocation.workOnSunday,
      workOnSundayStart: salesLocation.workOnSundayStart,
      workOnSundayEnd: salesLocation.workOnSundayEnd,
      minimalOrderPrice: salesLocation.minimalOrderPrice,
      minimalOrderPriceCurrency: salesLocation.minimalOrderPriceCurrency,
      paymentOptionsShow: salesLocation.paymentOptionsShow,
      paymentOptionsCash: salesLocation.paymentOptionsCash,
      paymentOptionsCard: salesLocation.paymentOptionsCard,
      paymentOptionsTransfer: salesLocation.paymentOptionsTransfer,
      paymentAccountNumber: salesLocation.paymentAccountNumber,
      additionalInfo: salesLocation.additionalInfo,
      createdAt: salesLocation.createdAt,
      updatedAt: salesLocation.updatedAt,
      isActive: salesLocation.isActive,
      isApproved: salesLocation.isApproved,
      onboardingStep: salesLocation.onboardingStep,
      uid: salesLocation.uid,
    );
  }
}
