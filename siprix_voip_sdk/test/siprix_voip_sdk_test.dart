import 'package:flutter_test/flutter_test.dart';
import 'package:siprix_voip_sdk/siprix_voip_sdk.dart';
import 'package:siprix_voip_sdk/accounts_model.dart';
import 'package:siprix_voip_sdk_platform_interface/siprix_voip_sdk_platform_interface.dart';

void main() {
  group('AccRegStateArg', () {
    test('accepts nullable response from Android registration callbacks', () {
      final arg = AccRegStateArg();

      final parsed = arg.fromMap(<String, Object?>{
        SiprixVoipSdkPlatform.kArgAccId: 1,
        SiprixVoipSdkPlatform.kRegState: SiprixVoipSdk.kRegStateSuccess,
        SiprixVoipSdkPlatform.kResponse: null,
      });

      expect(parsed, isTrue);
      expect(arg.accId, 1);
      expect(arg.regState, RegState.success);
      expect(arg.response, isEmpty);
    });

    test('accepts registration callbacks without response field', () {
      final arg = AccRegStateArg();

      final parsed = arg.fromMap(<String, Object?>{
        SiprixVoipSdkPlatform.kArgAccId: 1,
        SiprixVoipSdkPlatform.kRegState: SiprixVoipSdk.kRegStateSuccess,
      });

      expect(parsed, isTrue);
      expect(arg.accId, 1);
      expect(arg.regState, RegState.success);
      expect(arg.response, isEmpty);
    });

    test('maps in progress registration state explicitly', () {
      final arg = AccRegStateArg();

      final parsed = arg.fromMap(<String, Object?>{
        SiprixVoipSdkPlatform.kArgAccId: 1,
        SiprixVoipSdkPlatform.kRegState: SiprixVoipSdk.kRegStateInProgress,
        SiprixVoipSdkPlatform.kResponse: 'Registering',
      });

      expect(parsed, isTrue);
      expect(arg.regState, RegState.inProgress);
    });
  });
}
