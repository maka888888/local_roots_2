import 'package:local_roots_2/models/order_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'orders_services.dart';

part 'orders_stream.g.dart';

@Riverpod(keepAlive: true)
class RefCustomerOrdersStream extends _$RefCustomerOrdersStream {
  @override
  Stream<List<OrderModel>> build() {
    final appUser = ref.watch(refAppUserProvider).value!;

    return ServicesCustomerOrders().streamCustomerOrders(appUser.uid);
  }
}
