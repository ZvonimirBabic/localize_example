part of 'main.dart';

class _Initializer {
  static Future<void> load() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}
