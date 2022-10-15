import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/authentication/email_password/sign_in_screen.dart' as email;
import '../screens/authentication/google_sign_in/sign_in_screen.dart' as google;
import '../screens/authentication/phone_sign_in/sign_in_screen.dart' as phone;

import 'custom_colors.dart';
import 'fire_assets.dart';

List<Map<String, dynamic>> menu = [
  {
    'name': 'Authentication',
    'icon': FireAssets.fireAuthentication,
    'screens': [
      {
        'name': 'Email Sign In',
        'icon': const Icon(
          Icons.email_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': const email.SignInScreen(),
      },
      {
        'name': 'Phone Sign In',
        'icon': const Icon(
          Icons.phone,
          color: Palette.firebaseNavy,
        ),
        'widget': const phone.SignInScreen(),
      },
      {
        'name': 'Google Sign In',
        'icon': const FaIcon(
          FontAwesomeIcons.google,
          color: Palette.firebaseNavy,
        ),
        'widget': const google.SignInScreen(),
      },
      {
        'name': 'Apple Sign In',
        'icon': const FaIcon(
          FontAwesomeIcons.apple,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Github Sign In',
        'icon': const FaIcon(
          FontAwesomeIcons.github,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Facebook Sign In',
        'icon': const FaIcon(
          FontAwesomeIcons.facebook,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Microsoft Sign In',
        'icon': const FaIcon(
          FontAwesomeIcons.microsoft,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
    ]
  },
  {
    'name': 'Database',
    'icon': FireAssets.fireDatabase,
    'screens': [
      {
        'name': 'CRUD operations',
        'icon': const Icon(
          Icons.task_alt,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Storage',
        'icon': const Icon(
          Icons.storage_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Realtime Database',
        'icon': const Icon(
          Icons.timeline_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
    ]
  },
  {
    'name': 'Backend Actions',
    'icon': FireAssets.fireBackend,
    'screens': [
      {
        'name': 'Cloud Functions',
        'icon': const Icon(
          Icons.image,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'User Presence Tracking',
        'icon': const Icon(
          Icons.image,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Push Notifications (FCM)',
        'icon': const Icon(
          Icons.image,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
    ]
  },
  {
    'name': 'Machine Learning',
    'icon': FireAssets.fireMachineLearning,
    'screens': [
      {
        'name': 'Text recognition',
        'icon': const Icon(
          Icons.text_fields_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Face detection',
        'icon': const Icon(
          Icons.face_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Image recognition',
        'icon': const Icon(
          Icons.image,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
    ]
  },
  {
    'name': 'Other utilities',
    'icon': FireAssets.fireOtherUtilities,
    'screens': [
      {
        'name': 'Crashlytics',
        'icon': const Icon(
          Icons.analytics_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Remote Config',
        'icon': const FaIcon(
          FontAwesomeIcons.gamepad,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'A/B Testing',
        'icon': const Icon(
          Icons.rule_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Dynamic Linking',
        'icon': const Icon(
          Icons.link_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
    ]
  },
];
