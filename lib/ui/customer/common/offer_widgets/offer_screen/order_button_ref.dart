import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/order_model.dart';
import 'package:local_roots_2/providers/customer/orders/orders_stream.dart';

import '../../../../../constants/lists/units.dart';
import '../../../../../constants/screen_sizes.dart';
import '../../../../../models/customer_model.dart';
import '../../../../../models/offer_model.dart';
import '../../../../../providers/common/app_user/app_user.dart';
import '../../../../../providers/customer/orders/orders_services.dart';

class CustomerOfferOrderRefButton extends ConsumerWidget {
  final OfferModel offer;
  const CustomerOfferOrderRefButton({super.key, required this.offer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomerModel? customer = ref.read(refAppUserProvider).value?.customer;
    List<OrderModel> orders =
        ref.watch(refCustomerOrdersStreamProvider).valueOrNull ?? [];
    OrderModel? orderWithOffer;
    OrderItemModel? orderItem;

    if (orders.isNotEmpty) {
      for (var order in orders) {
        if (order.farmerShort.appUserId == offer.farmerShort.appUserId) {
          orderWithOffer = order;
        }
      }
    }

    if (orderWithOffer != null) {
      for (var item in orderWithOffer.orderItems) {
        if (item.offerId == offer.id) {
          orderItem = item;
          break;
        }
      }
    }

    void _saveOrder() {
      //ref.read(refCustomerOrdersProvider.notifier).updateItemsInOrder(_item);
      Navigator.pop(context);
    }

    Widget _quantityButton() {
      final units = generateUnitsList(context);
      String unitInLocalLanguage = units
          .where((element) => element.id == offer.unit)
          .first
          .nameTranslated;

      return SizedBox(
        height: 70,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: (orderItem?.quantity ?? 0) == 0
                    ? null
                    : () {
                        ServicesCustomerOrders().removeItemFromOrder(
                          orderWithOffer!,
                          offer.farmerShort,
                          offer,
                          customer!,
                        );
                      },
                icon: const Icon(Icons.remove),
              ),
              Text('${orderItem?.quantity ?? 0} $unitInLocalLanguage'),
              IconButton(
                onPressed: () {
                  ServicesCustomerOrders().addItemToOrder(
                    orderWithOffer,
                    offer.farmerShort,
                    offer,
                    customer!,
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      );
    }

    Widget _orderButton() {
      return InkWell(
        onTap: () {
          _saveOrder();
        },
        child: SizedBox(
          height: 70,
          child: Card(
            child: Center(
                // child: Text(
                //   '${AppLocalizations.of(context)!.toOrder} €${(_offer.price * _item.quantity).toStringAsFixed(2)}',
                //   style: Theme.of(context).textTheme.titleMedium,
                // ),
                ),
          ),
        ),
      );
    }

    Widget _removeButton() {
      return InkWell(
        onTap: () {
          // setState(() {
          //   _item.quantity = 0;
          // });
          _saveOrder();
        },
        child: SizedBox(
          height: 70,
          child: Card(
            color: Theme.of(context).colorScheme.errorContainer,
            child: Center(
                // child: Text(
                //   '${AppLocalizations.of(context)!.remove} €${(_offer.price * _item.quantity).toStringAsFixed(2)}',
                //   style: Theme.of(context).textTheme.titleMedium,
                // ),
                ),
          ),
        ),
      );
    }

    if (customer == null) {
      return const SizedBox();
      // return SizedBox(
      //   height: 60,
      //   width: 250,
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const CustomerOnboardingSocial(),
      //         ),
      //       );
      //     },
      //     child: Text(
      //       AppLocalizations.of(context)!.loginToPlaceOrder,
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      // );
    } else {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: ScreenSizes.smallScreen),
        child: Card(
          color: Theme.of(context).colorScheme.primaryFixedDim,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _quantityButton(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //   child: (_item.quantity == 0 ||
                    //       _initialQuantity == _item.quantity)
                    //       ? _removeButton()
                    //       : _orderButton(),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
