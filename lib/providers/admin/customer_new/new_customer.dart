

import 'package:local_roots_2/models/app_user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/customer_model.dart';
import '../../../ui/customer/onboarding/onboarding_main.dart';
import '../app_users/app_users_services.dart';
part 'new_customer.g.dart';


@riverpod
class RefAdminCustomerNew extends _$RefAdminCustomerNew {
  @override
  CustomerModel build(AppUserModel appUser) {

    return CustomerModel(
      email: appUser.email,
      name: '',
      phone: '',
      street: '',
      city: '',
      country: 'Lietuva',
      latitude: 0,
      longitude: 0,
      photoSmall: null,
      photoLarge: null,
      createdAt: DateTime.now(),
      onboardingStep: CustomerOnboardingStep.name,
      uid: appUser.uid,
    );
  }

  updateCustomerNew(CustomerModel customer) {
    state = CustomerModel.copyFrom(customer);
  }

  Future<void> saveCustomerNew(AppUserModel appUser) async {
    CustomerModel customer = state;
    appUser.isCustomer = true;
    appUser.customer = customer;

    await ServiceAdminAppUser().updateAppUser(appUser);
  }
}
