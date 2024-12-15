import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_roots_2/models/customer_model.dart';

import '../../../models/farmer_short_model.dart';
import '../../../models/offer_model.dart';
import '../../../models/offer_short_model.dart';
import '../../../models/order_model.dart';
import '../../../utils/id_generator.dart';

class ServicesCustomerOrders {
  CollectionReference fireOrders =
      FirebaseFirestore.instance.collection('orders');

  Stream<List<OrderModel>> streamCustomerOrders(String appUserId) {
    return fireOrders
        .where('customer.uid', isEqualTo: appUserId)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => OrderModel.fromFire(doc)).toList(),
        );
  }

  Future<void> addItemToOrder(
      OrderModel? orderToUpdate,
      FarmerShortModel farmerShort,
      OfferModel offer,
      CustomerModel currentCustomer) async {
    OrderModel order;

    if (orderToUpdate == null) {
      order = OrderModel(
        id: '', // Will be replaced with Firestore document ID
        orderNumber: generateFiveDigitString(),
        farmerShort: farmerShort,
        customer: currentCustomer,
        orderItems: [
          OrderItemModel(
            orderId: '', // Will be replaced with Firestore document ID
            offerId: offer.id,
            offerShort: OfferShortModel.fromOffer(offer),
            quantity: 1,
            price: offer.price,
            totalPrice: offer.price,
            unit: offer.unit,
          ),
        ],
        deliveryMethod: null,
        orderStatus: 'customer_selecting_items',
        totalPrice: offer.price,
        currency: 'EUR',
        status: 'active',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        completedAt: null,
      );

      await fireOrders.add(order.toJson());
    } else {
      OrderItemModel? existingItem;
      for (var item in orderToUpdate.orderItems) {
        if (item.offerId == offer.id) {
          existingItem = item;
          break;
        }
      }

      if (existingItem != null) {
        // Update quantity and total price of the existing item
        existingItem.quantity += 1;
        existingItem.totalPrice = existingItem.quantity * existingItem.price;

        // Update the total price of the order
        orderToUpdate.totalPrice = orderToUpdate.orderItems
            .map((e) => e.totalPrice)
            .reduce((value, element) => value + element);

        order = orderToUpdate;
      } else {
        // Add the new item to the order
        final newItem = OrderItemModel(
          orderId: orderToUpdate.id,
          offerId: offer.id,
          offerShort: OfferShortModel.fromOffer(offer),
          quantity: 1,
          price: offer.price,
          totalPrice: offer.price,
          unit: offer.unit,
        );

        orderToUpdate.orderItems.add(newItem);
        orderToUpdate.totalPrice += newItem.totalPrice;

        order = orderToUpdate;
      }
      await fireOrders.doc(order.id).set(order.toJson());
    }
  }

  Future<void> removeItemFromOrder(
      OrderModel orderToUpdate,
      FarmerShortModel farmerShort,
      OfferModel offer,
      CustomerModel currentCustomer) async {
    OrderItemModel? existingItem;

    for (var item in orderToUpdate.orderItems) {
      if (item.offerId == offer.id) {
        existingItem = item;
        break;
      }
    }

    if (existingItem != null) {
      if (existingItem.quantity > 1) {
        // Update quantity and total price of the existing item
        existingItem.quantity -= 1;
        existingItem.totalPrice = existingItem.quantity * existingItem.price;

        // Update the total price of the order
        orderToUpdate.totalPrice = orderToUpdate.orderItems
            .map((e) => e.totalPrice)
            .reduce((value, element) => value + element);

        await fireOrders.doc(orderToUpdate.id).set(orderToUpdate.toJson());
      } else {
        // Remove the item from the order
        orderToUpdate.orderItems.remove(existingItem);
        orderToUpdate.totalPrice -= existingItem.totalPrice;

        if (orderToUpdate.orderItems.isEmpty) {
          await fireOrders.doc(orderToUpdate.id).delete();
        } else {
          await fireOrders.doc(orderToUpdate.id).set(orderToUpdate.toJson());
        }
      }
    }
  }

  //
  // Future<void> addItemToOrder1(FarmerShortModel farmerShort, OfferModel offer,
  //     CustomerModel currentCustomer) async {
  //   try {
  //     // Check if an order for the farmer already exists
  //     final existingOrdersSnapshot = await fireOrders
  //         .where('farmerShort.id', isEqualTo: farmerShort.appUserId)
  //         .where('customer.id', isEqualTo: currentCustomer.uid)
  //         .get();
  //
  //     OrderModel? existingOrder;
  //     if (existingOrdersSnapshot.docs.isNotEmpty) {
  //       existingOrder = OrderModel.fromFire(existingOrdersSnapshot.docs.first);
  //     }
  //
  //     if (existingOrder != null) {
  //       OrderItemModel? existingItem;
  //       for (var item in existingOrder.orderItems) {
  //         if (item.offerId == offer.id) {
  //           existingItem = item;
  //           break;
  //         }
  //       }
  //
  //       if (existingItem != null) {
  //         // Update quantity and total price of the existing item
  //         existingItem.quantity += 1;
  //         existingItem.totalPrice = existingItem.quantity * existingItem.price;
  //
  //         // Update the total price of the order
  //         existingOrder.totalPrice = existingOrder.orderItems
  //             .map((e) => e.totalPrice)
  //             .reduce((value, element) => value + element);
  //
  //         // Update the order in Firestore
  //         await fireOrders.doc(existingOrder.id).update({
  //           'orderItems':
  //               existingOrder.orderItems.map((e) => e.toJson()).toList(),
  //           'totalPrice': existingOrder.totalPrice,
  //           'updatedAt': DateTime.now().toIso8601String(),
  //         });
  //       } else {
  //         // Add the new item to the order
  //         final newItem = OrderItemModel(
  //           orderId: existingOrder.id,
  //           offerId: offer.id,
  //           offerShort: OfferShortModel.fromOffer(offer),
  //           quantity: 1,
  //           price: offer.price,
  //           totalPrice: offer.price,
  //           unit: offer.unit,
  //         );
  //
  //         existingOrder.orderItems.add(newItem);
  //         existingOrder.totalPrice += newItem.totalPrice;
  //
  //         await fireOrders.doc(existingOrder.id).update({
  //           'orderItems':
  //               existingOrder.orderItems.map((e) => e.toJson()).toList(),
  //           'totalPrice': existingOrder.totalPrice,
  //           'updatedAt': DateTime.now().toIso8601String(),
  //         });
  //       }
  //     } else {
  //       // Create a new order for the farmer
  //       final newOrder = OrderModel(
  //         id: '', // Will be replaced with Firestore document ID
  //         orderNumber: DateTime.now().millisecondsSinceEpoch.toString(),
  //         farmerShort: farmerShort,
  //         customer: currentCustomer,
  //         orderItems: [
  //           OrderItemModel(
  //             orderId: '', // Will be replaced with Firestore document ID
  //             offerId: offer.id,
  //             offerShort: OfferShortModel.fromOffer(offer),
  //             quantity: 1,
  //             price: offer.price,
  //             totalPrice: offer.price,
  //             unit: offer.unit,
  //           ),
  //         ],
  //         deliveryMethod: null,
  //         orderStatus: 'order_created',
  //         totalPrice: offer.price,
  //         currency: 'EUR',
  //         status: 'active',
  //         createdAt: DateTime.now(),
  //         updatedAt: DateTime.now(),
  //         completedAt: null,
  //       );
  //
  //       final newOrderRef = await fireOrders.add(newOrder.toJson());
  //       newOrder.id = newOrderRef.id;
  //
  //       // Update the first item's order ID
  //       newOrder.orderItems.first.orderId = newOrder.id;
  //
  //       await newOrderRef.update({
  //         'orderItems': newOrder.orderItems.map((e) => e.toJson()).toList()
  //       });
  //     }
  //   } catch (e) {
  //     debugPrint('Error adding item to order: $e');
  //     rethrow;
  //   }
  // }
}
