library platform_maps_flutter_google_web;

import 'package:platform_maps_flutter_platform_interface/platform_maps_flutter_platform_interface.dart';

import 'src/google_maps_bitmap_descriptor.dart';
import 'src/google_maps_camera_update.dart';
import 'src/google_maps_widget.dart';

class PlatformMapsGoogleWeb extends PlatformMapsPlatform {
  static void registerWith(dynamic iDontFuckingCare) {
    PlatformMapsPlatform.instance = PlatformMapsGoogleWeb();
  }

  /// Create a new [PlatformPlatformMapsWidget].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [PlatformMap] in `platform_maps_flutter` instead.
  @override
  PlatformMapsPlatformWidget createPlatformMapsPlatformWidget(
    PlatformMapsPlatformWidgetCreationParams params,
  ) {
    return GoogleMapsWidget(params);
  }

  /// Create a new [PlatformBitmapDescriptor].
  /// This function should only be called by the app-facing package.
  @override
  GoogleMapsPlatformBitmapDescriptor createBitmapDescriptor() {
    return GoogleMapsPlatformBitmapDescriptor();
  }

  @override
  PlatformCameraUpdate createPlatformCameraUpdate() {
    return GoogleMapsPlatformCameraUpdate();
  }
}
