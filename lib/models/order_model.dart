import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_roots_2/models/customer_model.dart';
import 'package:local_roots_2/models/farmer_short_model.dart';
import 'package:local_roots_2/models/offer_short_model.dart';

class OrderModel {
  String id;
  String orderNumber;
  FarmerShortModel farmerShort;
  CustomerModel customer;
  List<OrderItemModel> orderItems;
  String? deliveryMethod;
  String? orderStatus;
  double totalPrice;
  String currency;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? completedAt;

  OrderModel({
    required this.id,
    required this.orderNumber,
    required this.farmerShort,
    required this.customer,
    required this.orderItems,
    this.deliveryMethod,
    this.orderStatus,
    required this.totalPrice,
    required this.currency,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.completedAt,
  });

  factory OrderModel.fromFire(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return OrderModel(
      id: document.id,
      orderNumber: data['orderNumber'],
      farmerShort: FarmerShortModel.fromFire(data['farmerShort']),
      customer: CustomerModel.fromFire(data['customer']),
      orderItems: (data['orderItems'] as List<dynamic>)
          .map((e) => OrderItemModel.fromFire(e))
          .toList(),
      deliveryMethod:
          data['deliveryMethod'] == null ? null : data['deliveryMethod'],
      orderStatus: data['orderStatus'] == null ? null : data['orderStatus'],
      totalPrice: double.tryParse(data['totalPrice'].toString()) ?? 0,
      currency: data['currency'],
      status: data['status'],
      createdAt: DateTime.parse(data['createdAt']),
      updatedAt: DateTime.parse(data['updatedAt']),
      completedAt: data['completedAt'] != null
          ? DateTime.parse(data['completedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderNumber': orderNumber,
      'farmerShort': farmerShort.toJson(),
      'customer': customer.toJson(),
      'orderItems': orderItems.map((e) => e.toJson()).toList(),
      'deliveryMethod': deliveryMethod,
      'orderStatus': orderStatus,
      'totalPrice': totalPrice,
      'currency': currency,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'completedAt': completedAt,
    };
  }
}

class OrderItemModel {
  String orderId;
  String offerId;
  OfferShortModel? offerShort;
  int quantity;
  String unit;
  double price;
  double totalPrice;

  OrderItemModel({
    required this.orderId,
    required this.offerId,
    this.offerShort,
    required this.quantity,
    required this.unit,
    required this.price,
    required this.totalPrice,
  });

  factory OrderItemModel.fromFire(Map<String, dynamic> fireOrderItem) {
    return OrderItemModel(
      orderId: fireOrderItem['orderId'],
      offerId: fireOrderItem['offerId'],
      offerShort: fireOrderItem['offerShort'] != null
          ? OfferShortModel.fromFire(fireOrderItem['offerShort'])
          : null,
      quantity: fireOrderItem['quantity'],
      unit: fireOrderItem['unit'],
      price: double.tryParse(fireOrderItem['price'].toString()) ?? 0,
      totalPrice: double.tryParse(fireOrderItem['totalPrice'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'offerId': offerId,
      'offerShort': offerShort != null ? offerShort!.toJson() : null,
      'quantity': quantity,
      'unit': unit,
      'price': price,
      'totalPrice': totalPrice,
    };
  }
}
