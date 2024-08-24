// ignore_for_file: avoid_relative_lib_imports

import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:platform_maps_flutter_platform_interface/platform_maps_flutter_platform_interface.dart';

import '../lib/platform_maps_flutter_google_web.dart';
import '../lib/src/google_maps_bitmap_descriptor.dart';
import '../lib/src/google_maps_camera_update.dart';
import '../lib/src/google_maps_widget.dart';

void main() {
  test('Verify widget generation', () {
    PlatformMapsGoogleWeb.registerWith(null);

    final widget = PlatformMapsPlatformWidget(
      const PlatformMapsPlatformWidgetCreationParams(
        initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
      ),
    );
    expect(widget, isA<GoogleMapsWidget>());
  });

  test('Verify bitmap descriptor generation', () {
    PlatformMapsGoogleWeb.registerWith(null);

    final platformBitmapDescriptor = PlatformBitmapDescriptor();
    expect(platformBitmapDescriptor, isA<GoogleMapsPlatformBitmapDescriptor>());

    final bitmapDescriptor = platformBitmapDescriptor.fromBytes(Uint8List.fromList([1, 2]));
    expect(bitmapDescriptor, isA<GoogleMapsBitmapDescriptor>());
  });

  test('Verify camera update generation', () {
    PlatformMapsGoogleWeb.registerWith(null);

    final platformCameraUpdate = PlatformCameraUpdate();
    expect(platformCameraUpdate, isA<GoogleMapsPlatformCameraUpdate>());

    final cameraUpdate = platformCameraUpdate.zoomIn();
    expect(cameraUpdate, isA<GoogleMapsCameraUpdate>());
  });
}
