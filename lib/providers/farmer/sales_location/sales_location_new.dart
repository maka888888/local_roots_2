import 'package:local_roots_2/models/sales_location_model.dart';
import 'package:local_roots_2/providers/farmer/sales_location/sales_location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/farmer_short_model.dart';
import '../../../ui/farmer/common/sales_location_widgets/sales_location_new/sales_location_main.dart';

part 'sales_location_new.g.dart';

@riverpod
class RefFarmerSalesLocationNew extends _$RefFarmerSalesLocationNew {
  @override
  SalesLocationModel build() {
    DateTime now = DateTime.now();
    DateTime workStart = DateTime(now.year, now.month, now.day, 8, 0);
    DateTime workEnd = DateTime(now.year, now.month, now.day, 18, 0);

    return SalesLocationModel(
      id: '',
      farmerAppUserId: '',
      farmerShort: FarmerShortModel(
        name: '',
        smallPhoto: '',
        appUserId: '',
        email: '',
        phone: '',
        street: '',
        city: '',
        country: '',
        isApproved: false,
        isActive: false,
      ),
      name: '',
      street: '',
      city: '',
      country: 'Lithuania',
      latitude: 0.0,
      longitude: 0.0,
      photoUrls: [],
      canPrepareOrderSameDay: false,
      prepareOrderSameDayLatest: null,
      workOnMonday: false,
      workOnMondayStart: workStart,
      workOnMondayEnd: workEnd,
      workOnTuesday: false,
      workOnTuesdayStart: workStart,
      workOnTuesdayEnd: workEnd,
      workOnWednesday: false,
      workOnWednesdayStart: workStart,
      workOnWednesdayEnd: workEnd,
      workOnThursday: false,
      workOnThursdayStart: workStart,
      workOnThursdayEnd: workEnd,
      workOnFriday: false,
      workOnFridayStart: workStart,
      workOnFridayEnd: workEnd,
      workOnSaturday: false,
      workOnSaturdayStart: workStart,
      workOnSaturdayEnd: workEnd,
      workOnSunday: false,
      workOnSundayStart: workStart,
      workOnSundayEnd: workEnd,
      minimalOrderPrice: 0.0,
      minimalOrderPriceCurrency: 'eur',
      paymentOptionsShow: false,
      paymentOptionsCash: false,
      paymentOptionsCard: false,
      paymentOptionsTransfer: false,
      paymentAccountNumber: null,
      additionalInfo: null,
      createdAt: now,
      updatedAt: now,
      isActive: true,
      isApproved: true,
      onboardingStep: SalesLocationNewStep.name,
      uid: '',
    );
  }

  updateSalesLocation(SalesLocationModel salesLocation) {
    state = SalesLocationModel.copyFrom(salesLocation);
  }

  Future<void> saveSalesLocation(SalesLocationModel salesLocation) async {
    await ServicesFarmerSalesLocation().createSalesLocation(salesLocation);
  }
}
