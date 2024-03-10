import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';

final StreamProvider<ConnectivityResult> internetConnectionProvider =
    StreamProvider<ConnectivityResult>(
  (_) {
    final Connectivity connectivity = Connectivity();
    return connectivity.onConnectivityChanged;
  },
);

final FutureProvider<PackageInfo> packageInfoProvider =
    FutureProvider<PackageInfo>(
  (_) => PackageInfo.fromPlatform(),
);

final FutureProvider<bool> debugAndAppNameProvider = FutureProvider<bool>(
  (ref) async {
    final PackageInfo package = await ref.watch(packageInfoProvider.future);
    return package.appName.contains("Dev") || kDebugMode;
  },
);

final Provider<bool> isEmulatorProvider = Provider<bool>((_) => false);

final AutoDisposeFutureProvider<AppUpdateInfo> inAppUpdateProvider =
    FutureProvider.autoDispose<AppUpdateInfo>(
  (_) async => InAppUpdate.checkForUpdate(),
);

final Provider<GenerativeModel> geminiModelProvider =
    Provider<GenerativeModel>((_) => throw UnimplementedError());

class NetConnectedNotifier extends StateNotifier<int> {
  NetConnectedNotifier() : super(-1);

  @override
  set state(int value) => super.state = value;
}

final StateNotifierProvider<NetConnectedNotifier, int>
    netConnectedNotifierProvider =
    StateNotifierProvider<NetConnectedNotifier, int>(
  (_) => NetConnectedNotifier(),
);

final Provider<bool?> androidWebProvider = Provider<bool?>((_) => null);

/*
final StreamProvider<ConnectivityResult> internetConnectionProvider =
    StreamProvider(
  (_) {
    BehaviorSubject<ConnectivityResult>? subject;
    subject = BehaviorSubject(
      onListen: () => Connectivity().onConnectivityChanged.listen(
        (event) {
          if (subject == null) {
            subject!.add(event);
          } else {
            if (subject.hasValue) {
              if (subject.value != event) {
                subject.add(event);
              }
            } else {
              subject.add(event);
            }
          }
        },
      ),
    );
    return subject.stream;
  },
);

final debugAndAppNameProvider = FutureProvider<bool>(
  (ref) async {
    final package = await ref.read(packageInfoProvider.future);

    return package.appName.contains("Dev") || kDebugMode;
  },
);

final deviceInfoProvider = Provider<DeviceInfoPlugin>(
  (_) => DeviceInfoPlugin(),
);

/*final FutureProvider<bool> isPhysicalDeviceProvider = FutureProvider<bool>(
  (ref) async {
    final deviceInfo = ref.read(deviceInfoProvider);
    if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      return iosInfo.isPhysicalDevice;
    } else if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      debugPrint("89--${androidInfo.isPhysicalDevice}");
      return androidInfo.isPhysicalDevice;
    }
    return false;
  },
);*/

final Provider<bool> isEmulatorProvider = Provider<bool>((_) => false);

final Provider<bool> isAndroidWebProvider = Provider<bool>((_) => true);

final AutoDisposeFutureProvider<PackageInfo> packageInfoProvider =
    FutureProvider.autoDispose<PackageInfo>(
  (_) => PackageInfo.fromPlatform(),
);

final AutoDisposeFutureProvider<AppUpdateInfo> inAppUpdateProvider =
    FutureProvider.autoDispose<AppUpdateInfo>(
  (_) async => InAppUpdate.checkForUpdate(),
);

final FutureProvider<ConnectivityResult> checkNetProvider = FutureProvider(
  (_) => Connectivity().checkConnectivity(),
);
*/
