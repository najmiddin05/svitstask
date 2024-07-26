import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:svitstask/config/constants/colors.dart';
import 'package:svitstask/config/constants/dimens.dart';

/// [ShimmerItem] is a stateless widget that represents a shimmering loading placeholder.
/// It uses the [Shimmer] package to create a shimmer effect on a [ListTile].
class ShimmerItem extends StatelessWidget {
  const ShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.padding),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).hintColor,
        highlightColor: AppColors.greyHighlight,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            side: BorderSide(
              color: Theme.of(context).hintColor,
            ),
          ),
          leading: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: Dimens.borderRadius30,
          ),
          title: Container(
            width: double.infinity,
            height: Dimens.height16,
            color: Colors.white,
          ),
          subtitle: Container(
            width: double.infinity,
            height: Dimens.height14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
