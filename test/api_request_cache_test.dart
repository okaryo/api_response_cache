import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:api_request_cache/api_request_cache.dart';

void main() {
  const MethodChannel channel = MethodChannel('api_request_cache');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ApiRequestCache.platformVersion, '42');
  });
}
