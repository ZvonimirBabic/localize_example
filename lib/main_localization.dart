part of 'main.dart';

class AppLocalization extends StatelessWidget {
  const AppLocalization({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: LocaleConstants.supportedLocales,
      fallbackLocale: LocaleConstants.fallbackLocale,
      path: 'locale',
      assetLoader: const MultiAssetLocaleLoader(),
      saveLocale: false,
      child: child,
    );
  }
}
