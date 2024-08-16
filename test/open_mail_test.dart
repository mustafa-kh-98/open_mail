import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_mail/open_mail.dart';
import 'package:platform/platform.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('open_mail');
  final log = <MethodCall>[];

  channel.setMethodCallHandler((MethodCall methodCall) async {
    log.add(methodCall);
    if (methodCall.method == 'openMail') {
      return true;
    }
    return null;
  });

  tearDown(() {
    log.clear();
  });

  test('openMail Android', () async {
    OpenMail.platform = FakePlatform(operatingSystem: Platform.android);
    final result = await OpenMail.openMail();
    expect(result.didOpen, true);
    expect(
      log,
      <Matcher>[
        isMethodCall('openMail', arguments: {'nativePickerTitle': ''}),
      ],
    );
  });
}
