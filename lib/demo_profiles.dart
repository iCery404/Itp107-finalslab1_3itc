import 'package:flutter/material.dart';

// This lab has no real database, so there is no actual "personal info" to
// show on the Home screen after logging in. This file provides a small set
// of fun, anime-inspired flavor data so the profile section isn't empty.
//
// Note: only names and original one-line taglines are used here — no
// character artwork or exact quotes from the shows, to keep this
// copyright-safe for submission.
class DemoProfile {
  final String favoriteCharacter;
  final String favoriteShow;
  final String tagline;
  final Color accentColor;

  const DemoProfile({
    required this.favoriteCharacter,
    required this.favoriteShow,
    required this.tagline,
    required this.accentColor,
  });
}

final List<DemoProfile> demoProfiles = [
  const DemoProfile(
    favoriteCharacter: 'Gojo Satoru',
    favoriteShow: 'Jujutsu Kaisen',
    tagline: 'Confident, powerful, never worried about the outcome.',
    accentColor: Color(0xFF2563EB),
  ),
  const DemoProfile(
    favoriteCharacter: 'Kaoruko Waguri',
    favoriteShow: 'The Fragrant Flower Blooms with Dignity',
    tagline: 'Gentle on the surface, quietly determined underneath.',
    accentColor: Color(0xFFDB2777),
  ),
  const DemoProfile(
    favoriteCharacter: 'Tanjiro Kamado',
    favoriteShow: 'Demon Slayer',
    tagline: 'Kind to everyone, gives up on no one.',
    accentColor: Color(0xFFDC2626),
  ),
  const DemoProfile(
    favoriteCharacter: 'Monkey D. Luffy',
    favoriteShow: 'One Piece',
    tagline: 'Chases the dream, worries about the details later.',
    accentColor: Color(0xFFEA580C),
  ),
];

// Turns the name typed on Login/Sign-Up into a number, so the same name
// always lands on the same demo profile, member ID, and join date.
int seedFromName(String name) {
  var total = 0;
  for (final unit in name.codeUnits) {
    total += unit;
  }
  return total == 0 ? 1 : total;
}

DemoProfile pickProfile(int seed) {
  return demoProfiles[seed % demoProfiles.length];
}
