// ignore_for_file: directives_ordering

//PACKAGES
export 'package:easy_localization/easy_localization.dart' hide TextDirection;
export 'package:flutter/material.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:logger/logger.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:device_preview/device_preview.dart'
    hide basicLocaleListResolution;
export 'package:auto_size_text/auto_size_text.dart';
export 'package:faker/faker.dart';
export 'package:shimmer/shimmer.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:form_field_validator/form_field_validator.dart'
    hide FormFieldValidator;
export 'package:dartz/dartz.dart' hide State;
export 'dart:developer' hide Flow;



//CONFIG
export './config/config.dart';

//WIDGETS
export './src/widgets/widgets.dart';

//SCREENS
export './src/onboard/auth.dart';
export './src/home/home.dart';
export './src/chat/chat.dart';

//UTILS
export './src/utils/utils.dart';
