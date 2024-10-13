import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kiosk/jayne/blocs/application_bloc/application_cubit.dart';
import 'package:kiosk/jayne/jayne_getit_dependencies.dart';
import 'package:kiosk/jayne/secure_storage/secure_storage_service.dart';
import 'package:sprintf/sprintf.dart';
import 'package:easy_localization/easy_localization.dart';

const languageKey = "language-%s";
const storedLanguageCodeKey = "stored-language-code";
const translationLastModifiedDateKey = "language-%s-lastModifiedDate";

abstract class JayneLocalizationConfig {
  final List<Locale> supportedLocales;
  final AssetLoader assetLoader;

  JayneLocalizationConfig({
    required this.supportedLocales,
    required this.assetLoader,
  });

  Future<void> start();
}

Future loadTranslation(Locale locale) async {
  final translationPath = dotenv.get('TRANSLATION_PATH');
  final storage = JayneGetItDependencies.of<SecureStorageLanguageService>();
  final info = jsonDecode(await rootBundle.loadString("$translationPath/metadata.json"));
  final lastModifiedDate = DateTime.parse(info[locale.languageCode]);
  await _loadTranslationFromFile(storage, lastModifiedDate, locale);
}

Future _loadTranslationFromFile(SecureStorageLanguageService storage, DateTime lastModificationDate, Locale locale) async {
  final translationPath = dotenv.get('TRANSLATION_PATH');
  final filePath = '$translationPath/${locale.languageCode}.json';
  await storage.write(
    key: _translationLastModifiedDateKey(locale),
    value: lastModificationDate.toIso8601String(),
  );
  await storage.write(
    key: _languageKey(locale),
    value: await rootBundle.loadString(filePath),
  );
}

Future<bool> initializeLocale(BuildContext context) async {
  if (await _getStoredLanguageCode() == null) {
    final platformLanguageCode = Platform.localeName.split("_").first;
    switch (platformLanguageCode) {
      case "en":
      case "th":
        await setStoredLanguageCode(platformLanguageCode);
        break;
      default:
        await setStoredLanguageCode("en");
    }
  }
  final storedLanguageCode = await readStoredLanguageCode();
  await context.setLocale(Locale(storedLanguageCode));
  Intl.defaultLocale = storedLanguageCode == 'th' ? 'th_TH' : 'en_US';
  JayneGetItDependencies.of<ApplicationCubit>().state.copyWith(currentSelectLocale: storedLanguageCode);
  return true;
}

Future<String> readStoredLanguageCode() async {
  final storedLanguageCode = await _getStoredLanguageCode();
  return storedLanguageCode ?? Platform.localeName.split("_").first;
}

Future<String?> _getStoredLanguageCode() async {
  return await JayneGetItDependencies.of<SecureStorageService>().read(key: storedLanguageCodeKey);
}

Future<void> setStoredLanguageCode(String languageCode) async {
  await JayneGetItDependencies.of<SecureStorageService>().write(
    key: storedLanguageCodeKey,
    value: languageCode,
  );
}

Future<String> readLanguageJson(Locale locale) async {
  return await JayneGetItDependencies.of<SecureStorageService>().read(key: _languageKey(locale)) ?? "{}";
}

String _languageKey(Locale locale) {
  return sprintf(languageKey, [locale.languageCode]);
}

String _translationLastModifiedDateKey(Locale locale) {
  return sprintf(translationLastModifiedDateKey, [locale.languageCode]);
}
