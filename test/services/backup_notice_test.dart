import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/services/backup_notice.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('nothing is pending until an upgrade marks it', () async {
    expect(await BackupNotice.takePending(), isFalse);
  });

  test('a marked notice is taken once, then cleared', () async {
    await BackupNotice.markPending();

    expect(await BackupNotice.takePending(), isTrue);
    expect(await BackupNotice.takePending(), isFalse,
        reason: 'the notice shows once, not on every launch');
  });
}
