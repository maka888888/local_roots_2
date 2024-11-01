import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/customer_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:local_roots_2/providers/common/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../ui/customer/onboarding/onboarding_main.dart';
import '../../common/app_user/app_user_services.dart';

part 'new_customer.g.dart';

@riverpod
class RefCustomerNew extends _$RefCustomerNew {
  @override
  CustomerModel build(bool isCreatingAdmin) {
    User user = ref.watch(refAuthProvider)!;
    return CustomerModel(
      email: isCreatingAdmin ? '' : (user.email ?? ''),
      name: isCreatingAdmin ? '' : (user.displayName ?? ''),
      phone: isCreatingAdmin ? '' : (user.phoneNumber ?? ''),
      street: '',
      city: '',
      country: 'Lietuva',
      latitude: 0,
      longitude: 0,
      photoSmall: null,
      photoLarge: null,
      createdAt: DateTime.now(),
      onboardingStep: CustomerOnboardingStep.name,
      uid: user.uid,
    );
  }

  updateCustomerNew(CustomerModel customer) {
    state = CustomerModel.copyFrom(customer);
  }

  Future<void> saveCustomerNew() async {
    AppUserModel appUser = ref.read(refAppUserProvider).value!;
    CustomerModel customer = state;
    appUser.isCustomer = true;
    appUser.customer = customer;

    await ServiceAppUser().updateAppUser(appUser);
  }
}
