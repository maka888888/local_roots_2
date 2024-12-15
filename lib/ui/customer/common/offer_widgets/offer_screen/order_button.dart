import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/constants/lists/units.dart';
import 'package:local_roots_2/constants/screen_sizes.dart';
import 'package:local_roots_2/models/offer_short_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:local_roots_2/providers/customer/orders/orders_stream.dart';

import '../../../../../models/customer_model.dart';
import '../../../../../models/offer_model.dart';
import '../../../../../models/order_model.dart';

class CustomerOfferOrderButton extends ConsumerStatefulWidget {
  final OfferModel offer;
  const CustomerOfferOrderButton({super.key, required this.offer});

  @override
  CustomerOfferOrderButtonState createState() =>
      CustomerOfferOrderButtonState();
}

class CustomerOfferOrderButtonState
    extends ConsumerState<CustomerOfferOrderButton> {
  int _initialQuantity = 0;
  late OrderItemModel _item;
  late OfferModel _offer;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    _offer = widget.offer;
    List<OrderModel> activeOrders =
        ref.read(refCustomerOrdersStreamProvider).value ?? [];
    OrderModel? order;

    for (var activeOrder in activeOrders) {
      if (activeOrder.farmerShort.appUserId ==
          widget.offer.farmerShort.appUserId) {
        order = activeOrder;
        break;
      }
    }

    if (order != null &&
        order.orderItems.any((element) => element.offerId == widget.offer.id)) {
      for (var item in order.orderItems) {
        if (item.offerId == widget.offer.id) {
          _item = item;
          _initialQuantity = item.quantity;
          break;
        }
      }
    } else {
      _item = OrderItemModel(
        orderId: DateTime.now().toString(),
        offerId: _offer.id,
        offerShort: OfferShortModel.fromOffer(_offer),
        quantity: 1,
        unit: _offer.unit,
        price: _offer.price,
        totalPrice: _offer.price,
      );
    }
  }

  void _updateQuantity(int quantity) {
    setState(() {
      _item.quantity = quantity;
      _item.totalPrice = _item.price * quantity;
    });
  }

  void _saveOrder() {
    //ref.read(refCustomerOrdersProvider.notifier).updateItemsInOrder(_item);
    Navigator.pop(context);
  }

  Widget _quantityButton() {
    final units = generateUnitsList(context);
    String unitInLocalLanguage = units
        .where((element) => element.id == widget.offer.unit)
        .first
        .nameTranslated;

    return SizedBox(
      height: 70,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                if (_item.quantity > 0) {
                  _updateQuantity(_item.quantity - 1);
                }
              },
              icon: const Icon(Icons.remove),
            ),
            Text('${_item.quantity} $unitInLocalLanguage'),
            IconButton(
              onPressed: () {
                _updateQuantity(_item.quantity + 1);
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
            child: Text(
              '${AppLocalizations.of(context)!.toOrder} €${(_offer.price * _item.quantity).toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }

  Widget _removeButton() {
    return InkWell(
      onTap: () {
        setState(() {
          _item.quantity = 0;
        });
        _saveOrder();
      },
      child: SizedBox(
        height: 70,
        child: Card(
          color: Theme.of(context).colorScheme.errorContainer,
          child: Center(
            child: Text(
              '${AppLocalizations.of(context)!.remove} €${(_offer.price * _item.quantity).toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CustomerModel? customer = ref.read(refAppUserProvider).value?.customer;

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
                    child: (_item.quantity == 0 ||
                            _initialQuantity == _item.quantity)
                        ? _removeButton()
                        : _orderButton(),
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
