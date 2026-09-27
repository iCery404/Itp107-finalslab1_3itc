import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../demo_profiles.dart';
import '../widgets/common_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Same name always gives the same ID, so it looks stable while testing.
  String _memberId(int seed) {
    final number = 1000 + (seed * 37) % 9000;
    return 'ITP-$number';
  }

  String _joinDate(int seed) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    final daysAgo = seed % 600; // stays within the last ~1.5 years
    final date = DateTime.now().subtract(Duration(days: daysAgo));
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    // Receive the name sent from the previous screen (route arguments).
    final name =
        (ModalRoute.of(context)!.settings.arguments as String?) ?? 'User';

    // This lab has no real backend, so there is no actual account data to
    // show here. These fields are generated from the entered name just to
    // demonstrate what a filled-out profile section would look like.
    final seed = seedFromName(name);
    final profile = pickProfile(seed);

    return ScreenLayout(
      icon: Icons.home_outlined,
      title: 'Welcome, $name!',
      subtitle: 'Glad to have you here',
      child: Column(
        children: [
          InitialsAvatar(text: name, color: profile.accentColor, radius: 34),
          const SizedBox(height: 14),
          Text(
            name,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Logged in',
            style: TextStyle(fontSize: 13, color: AppColors.textGrey),
          ),
          const SizedBox(height: 18),
          const Divider(height: 1, color: AppColors.line),
          const SizedBox(height: 8),

          InfoRow(
            icon: Icons.badge_outlined,
            label: 'Member ID',
            value: _memberId(seed),
          ),
          InfoRow(
            icon: Icons.calendar_today_outlined,
            label: 'Joined',
            value: _joinDate(seed),
          ),
          InfoRow(
            icon: Icons.live_tv_outlined,
            label: 'Favorite anime',
            value: profile.favoriteShow,
          ),
          InfoRow(
            icon: Icons.favorite_border,
            label: 'Favorite character',
            value: profile.favoriteCharacter,
          ),

          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: profile.accentColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: profile.accentColor.withOpacity(0.25)),
            ),
            child: Text(
              '"${profile.tagline}"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: profile.accentColor,
              ),
            ),
          ),

          const SizedBox(height: 26),
          PrimaryButton(
            text: 'Log out',
            onPressed: () {
              // Clears all screens and goes back to Login
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
