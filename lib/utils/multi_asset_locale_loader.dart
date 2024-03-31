import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:localize_example/services/network_service.dart';
import 'package:localize_example/utils/constants/locale_constants.dart';

class MultiAssetLocaleLoader extends AssetLoader {
  const MultiAssetLocaleLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    try {
      log('locale: $locale');
      var url = Uri.parse('$path/${locale.toLanguageTag()}.json');
      dynamic response = await NetworkService.dio.get(
          'https://raw.githubusercontent.com/ZvonimirBabic/localize_example/master/assets/locale/$locale.json');
      return json.decode(
        response.data,
      );
    } catch (e) {
      log('MultiAssetLocaleLoader $e');
      try {
        return jsonDecode(
          await rootBundle.loadString('assets/locale/$locale.json'),
        );
      } catch (_) {
        return jsonDecode(
          await rootBundle.loadString(
              'assets/locale/${LocaleConstants.fallbackLocale}.json'),
        );
      }
    }
  }
}
