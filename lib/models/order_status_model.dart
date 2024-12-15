class OrderStatusModel {
  int index;
  String deliveryMethod;
  String id;
  String nameTranslated;
  DateTime? completedDate;

  OrderStatusModel({
    required this.index,
    required this.deliveryMethod,
    required this.id,
    required this.nameTranslated,
    this.completedDate,
  });
}
