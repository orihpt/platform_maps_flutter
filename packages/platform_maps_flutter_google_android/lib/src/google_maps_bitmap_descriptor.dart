import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart' as google_maps;
import 'package:platform_maps_flutter_platform_interface/platform_maps_flutter_platform_interface.dart';

class GoogleMapsPlatformBitmapDescriptor extends PlatformBitmapDescriptor {
  GoogleMapsPlatformBitmapDescriptor() : super.implementation();
  @override
  Future<GoogleMapsBitmapDescriptor> fromAssetImage(
    ImageConfiguration configuration,
    String assetName, {
    AssetBundle? bundle,
    String? package,
  }) async {
    final descriptor = await google_maps.BitmapDescriptor.asset(
      configuration,
      assetName,
      bundle: bundle,
      package: package,
    );
    return GoogleMapsBitmapDescriptor(descriptor);
  }

  @override
  GoogleMapsBitmapDescriptor fromBytes(Uint8List byteData) {
    return GoogleMapsBitmapDescriptor(
      google_maps.BitmapDescriptor.bytes(byteData),
    );
  }
}

class GoogleMapsBitmapDescriptor extends BitmapDescriptor {
  GoogleMapsBitmapDescriptor(this.descriptor);
  google_maps.BitmapDescriptor descriptor;
}
