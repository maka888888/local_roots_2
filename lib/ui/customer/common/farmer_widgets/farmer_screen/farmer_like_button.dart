import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/models/farmer_short_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:local_roots_2/providers/customer/farmer_likes/liked_farmers_stream.dart';

import '../../../../../providers/customer/farmer_likes/farmer_likes_services.dart';

class CustomerFarmerLikeButton extends ConsumerWidget {
  final FarmerModel farmer;
  const CustomerFarmerLikeButton({super.key, required this.farmer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likedFarmers =
        ref.watch(refCustomerLikedFarmersShortStreamProvider).valueOrNull;
    final appUser = ref.watch(refAppUserProvider).valueOrNull;

    if (likedFarmers == null || appUser == null) {
      return const SizedBox.shrink();
    } else {
      final isLiked =
          likedFarmers.map((e) => e.appUserId).contains(farmer.appUserId);
      return IconButton(
        icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          if (isLiked) {
            ServiceCustomerFarmerLikes()
                .removeLike(farmer.appUserId, appUser.id);
          } else {
            FarmerShortModel farmerShort = FarmerShortModel(
              appUserId: farmer.appUserId,
              name: farmer.name,
              email: farmer.email,
              phone: farmer.phone,
              city: farmer.city,
              smallPhoto: farmer.smallPhoto,
              street: farmer.street,
              country: farmer.country,
              isApproved: farmer.isApproved,
              isActive: farmer.isActive,
            );

            ServiceCustomerFarmerLikes().setLike(farmerShort, appUser.id);
          }
        },
      );
    }

    return const Placeholder();
  }
}
