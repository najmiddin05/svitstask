import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:svitstask/config/constants/dimens.dart';
import 'package:svitstask/config/constants/text_styles.dart';
import 'package:svitstask/feature/user/domain/model/user/user.dart';

/// [UserListItem] is a stateless widget that represents an item in the user list.
/// It displays user information such as avatar, first name, last name, and email.

class UserListItem extends StatelessWidget {
  final User user;
  final void Function()? onTap;

  const UserListItem({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.padding),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(Dimens.borderRadius20)),
          side: BorderSide(color: Theme.of(context).primaryColor),
        ),
        onTap: onTap,
        leading: Stack(
          children: [
            Hero(
              tag: user.firstName,
              child: CachedNetworkImage(
                imageUrl: user.avatar,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: Dimens.borderRadius30,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) => CircleAvatar(
                  backgroundImage: NetworkImage(url),
                  radius: Dimens.borderRadius30,
                  backgroundColor: Colors.white,
                ),
                errorWidget: (context, url, error) => const CircleAvatar(
                  radius: Dimens.borderRadius30,
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ],
        ),
        title: Hero(
          tag: user.lastName,
          child: Text(
            "${user.firstName} ${user.lastName}",
            style: TextStyles.textStyles.plusJakartaSansSemiBold16.copyWith(color: Theme.of(context).cardColor),
          ),
        ),
        subtitle: Text(
          user.email,
          style: TextStyles.textStyles.plusJakartaSansMedium14.copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
