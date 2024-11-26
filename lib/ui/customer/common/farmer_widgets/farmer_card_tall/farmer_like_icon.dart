import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:local_roots_2/providers/customer/farmer_likes/liked_farmers_stream.dart';

class CustomerFarmerCardLikeButton extends ConsumerWidget {
  final String farmerAppUserId;
  const CustomerFarmerCardLikeButton(
      {super.key, required this.farmerAppUserId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likedFarmers =
        ref.watch(refCustomerLikedFarmersShortStreamProvider).valueOrNull;
    final appUser = ref.watch(refAppUserProvider).valueOrNull;

    if (likedFarmers == null || appUser == null) {
      return const SizedBox.shrink();
    } else {
      final isLiked =
          likedFarmers.map((e) => e.appUserId).contains(farmerAppUserId);

      if (isLiked) {
        return Icon(Icons.favorite,
            color: Theme.of(context).colorScheme.primary);
      } else {
        return const SizedBox();
      }
    }
  }
}
