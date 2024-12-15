import 'package:flutter/material.dart';
import 'package:local_roots_2/models/order_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_rect_small.dart';
import 'package:local_roots_2/ui/customer/common/offer_widgets/offer_screen/offer_screen_main.dart';

import '../../../../../constants/lists/units.dart';

class CustomerOrderInSelectionTileItem extends StatelessWidget {
  final OrderItemModel orderItem;

  const CustomerOrderInSelectionTileItem({super.key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    final units = generateUnitsList(context);
    String unitInLocalLanguage = units
        .where((element) => element.id == orderItem.offerShort!.unit)
        .first
        .nameTranslated;

    return ListTile(
      leading: SizedBox(
          height: 50,
          width: 50,
          child:
              PhotoRectSmall(imageUrl: orderItem.offerShort!.mainPhotoSmall)),
      title: Text(orderItem.offerShort!.name),
      subtitle: Text(
          '${orderItem.quantity} $unitInLocalLanguage x ${orderItem.price} €/$unitInLocalLanguage = ${orderItem.totalPrice}€'),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return CustomerOffer(offerId: orderItem.offerShort!.id);
            },
          ),
        );
      },
    );
  }
}
