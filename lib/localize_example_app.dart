import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizeExampleApp extends StatelessWidget {
  const LocalizeExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      title: 'LocalizeExampleApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LocalizationExampleHomePage(
        selectedLocale: context.locale,
      ),
    );
  }
}

class LocalizationExampleHomePage extends StatefulWidget {
  LocalizationExampleHomePage({required this.selectedLocale, super.key});

  Locale selectedLocale;

  @override
  State<LocalizationExampleHomePage> createState() =>
      _LocalizationExampleHomePageState();
}

class _LocalizationExampleHomePageState
    extends State<LocalizationExampleHomePage> {
  @override
  Widget build(BuildContext context) {
    void changeLocale(Locale? locale) {
      if (locale == null) return;
      setState(() {
        context.setLocale(locale);
      });
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'title'.tr(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'username'.tr(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'password'.tr(),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
            child: DropdownButton(
                value: widget.selectedLocale,
                items: const [
                  DropdownMenuItem(
                    value: Locale('hr'),
                    child: Text('hr'),
                  ),
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text('en'),
                  ),
                ],
                onChanged: (Locale? locale) {
                  changeLocale(locale);
                }),
          )
        ],
      ),
    );
  }
}
