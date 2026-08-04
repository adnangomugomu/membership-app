import 'package:flutter/material.dart';

class AppBarUser extends StatelessWidget
    implements PreferredSizeWidget {
  final String? userName;
  final String? userTier;
  final int? userPoints;
  final String? avatarUrl;
  final String? csIconUrl;
  final int? unreadNotificationCount;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onCsTap;
  final VoidCallback? onProfileTap;
  final bool isAsset;

  const AppBarUser({
    super.key,
    this.userName,
    this.userTier,
    this.userPoints,
    this.avatarUrl,
    this.csIconUrl,
    this.unreadNotificationCount,
    this.onNotificationTap,
    this.onCsTap,
    this.onProfileTap,
    this.isAsset = false,
  });

  // ==============================
  // Dummy Data
  // ==============================

  String get dummyUserName => 'Kobo Kanaeru';

  String get dummyUserTier => 'Silver';

  int get dummyUserPoints => 1250;

  String get dummyAvatarUrl =>
      'https://yt3.googleusercontent.com/XRCP2PC-lvvielp04Eq8KyBzgd3_bFc_DNfptN5s-ftd1v6SadGuMChY6Jm3elaqaK7xwE1B=s900-c-k-c0x00ffffff-no-rj';

  String get dummyCsIconUrl => '';

  int get dummyUnreadNotificationCount => 3;

  // ==============================
  // Data yang digunakan
  // ==============================

  String get displayUserName {
    return userName ?? dummyUserName;
  }

  String get displayUserTier {
    return userTier ?? dummyUserTier;
  }

  int get displayUserPoints {
    return userPoints ?? dummyUserPoints;
  }

  String get displayAvatarUrl {
    return avatarUrl ?? dummyAvatarUrl;
  }

  String get displayCsIconUrl {
    return csIconUrl ?? dummyCsIconUrl;
  }

  int get displayUnreadNotificationCount {
    return unreadNotificationCount ??
        dummyUnreadNotificationCount;
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(70.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 16.0,

      title: InkWell(
        onTap: onProfileTap,
        borderRadius: BorderRadius.circular(30),
        child: Row(
          children: [
            // Avatar Profil
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey[200],
              backgroundImage: isAsset
                  ? AssetImage(displayAvatarUrl)
                  : NetworkImage(displayAvatarUrl),
            ),

            const SizedBox(width: 12),

            // Info User
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  RichText(
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Hi, ',
                          style: TextStyle(
                            fontWeight:
                                FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text:
                              '$displayUserName!',
                          style: const TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    '$displayUserTier • '
                    '$displayUserPoints poin',
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      fontWeight:
                          FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      actions: [
        // Notification
        IconButton(
          onPressed: onNotificationTap,
          icon: Badge(
            isLabelVisible:
                displayUnreadNotificationCount > 0,

            label: Text(
              displayUnreadNotificationCount > 99
                  ? '99+'
                  : displayUnreadNotificationCount
                      .toString(),
              style: const TextStyle(
                fontSize: 10,
                fontWeight:
                    FontWeight.bold,
                color: Colors.white,
              ),
            ),

            backgroundColor: Colors.red,
            offset: const Offset(3, -3),

            child: const Icon(
              Icons.notifications_sharp,
              size: 26,
              color: Colors.black87,
            ),
          ),
        ),

        // Customer Service
        IconButton(
          onPressed: onCsTap,
          icon: displayCsIconUrl.isNotEmpty
              ? (isAsset
                  ? Image.asset(
                      displayCsIconUrl,
                      width: 28,
                      height: 28,
                    )
                  : Image.network(
                      displayCsIconUrl,
                      width: 28,
                      height: 28,
                    ))
              : const Icon(
                  Icons.support_agent_rounded,
                  size: 28,
                  color: Colors.black87,
                ),
        ),

        const SizedBox(width: 8),
      ],
    );
  }
}