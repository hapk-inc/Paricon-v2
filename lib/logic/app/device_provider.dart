import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';

final FutureProvider<PackageInfo> packageInfoProvider =
    FutureProvider<PackageInfo>((_) => PackageInfo.fromPlatform());

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

final Provider<bool?> androidWebProvider = Provider<bool?>((_) => null);
