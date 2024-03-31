import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:localize_example/utils/constants/locale_constants.dart';
import 'package:localize_example/utils/multi_asset_locale_loader.dart';

import 'localize_example_app.dart';

part 'main_initializer.dart';
part 'main_localization.dart';

void main() async {
  await _Initializer.load();
  runApp(
    const AppLocalization(
      child: LocalizeExampleApp(),
    ),
  );
}
