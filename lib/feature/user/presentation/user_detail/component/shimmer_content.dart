import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:svitstask/config/constants/colors.dart';
import 'package:svitstask/config/constants/dimens.dart';

/// [ShimmerContent] is a stateless widget that represents a shimmering loading placeholder.
/// It uses the [Shimmer] package to create a shimmer effect for a circle avatar and a rectangle.
class ShimmerContent extends StatelessWidget {
  const ShimmerContent({
    super.key,
    required this.context,
  });

  /// The build context of the widget.
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Shimmer.fromColors(
            baseColor: Theme.of(context).hintColor,
            highlightColor: AppColors.greyHighlight,
            child: CircleAvatar(
              radius: Dimens.borderRadius100,
              backgroundColor: Theme.of(context).hintColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: Dimens.padding20),
          child: Shimmer.fromColors(
            baseColor: Theme.of(context).hintColor,
            highlightColor: AppColors.greyHighlight,
            child: const SizedBox(
              height: Dimens.padding20,
              width: Dimens.width150,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimens.borderRadius20),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
