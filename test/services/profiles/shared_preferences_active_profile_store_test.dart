import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pokedex_app/services/profiles/active_profile_store.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('reads nothing before a profile has been chosen', () async {
    final store = SharedPreferencesActiveProfileStore();

    expect(await store.read(), isNull);
  });

  test('the chosen profile survives a new store instance (a relaunch)', () async {
    await SharedPreferencesActiveProfileStore().write(3);

    final relaunched = SharedPreferencesActiveProfileStore();

    expect(await relaunched.read(), 3);
  });
}
