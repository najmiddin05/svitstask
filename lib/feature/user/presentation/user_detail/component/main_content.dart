import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:svitstask/config/constants/dimens.dart';
import 'package:svitstask/config/constants/text_styles.dart';
import 'package:svitstask/feature/user/domain/model/user/user.dart';

/// [MainContent] is a stateless widget that displays the main content of the user detail page.
/// It shows the user's avatar and email.
class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
    required this.context,
    required this.user,
  });

  /// The build context of the widget.
  final BuildContext context;

  /// The user whose details are to be displayed.
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Hero(
          flightShuttleBuilder: (
              flightContext,
              animation,
              flightDirection,
              fromHeroContext,
              toHeroContext,
              ) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return Material(
                  color: Colors.transparent,
                  child: ScaleTransition(
                    scale: animation.drive(
                      Tween<double>(
                        begin: Dimens.begin,
                        end: Dimens.end,
                      ).chain(CurveTween(curve: Curves.fastOutSlowIn)),
                    ),
                    child: toHeroContext.widget,
                  ),
                );
              case HeroFlightDirection.pop:
                return Material(
                  color: Colors.transparent,
                  child: fromHeroContext.widget,
                );
            }
          },
          tag: user.firstName,
          child: Center(
            child: CachedNetworkImage(
              imageUrl: user.avatar,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: Dimens.borderRadius100,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => CircleAvatar(
                backgroundImage: NetworkImage(url),
                radius: Dimens.borderRadius100,
                backgroundColor: Colors.white,
              ),
              errorWidget: (context, url, error) => const CircleAvatar(
                radius: Dimens.borderRadius100,
                child: Icon(Icons.error),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: Dimens.padding20),
          child: Text(
            user.email,
            style: TextStyles.textStyles.plusJakartaSansMedium16.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
