import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as Img;
import 'package:image/image.dart';

class _ImageProviderKey {
  final Object providerCacheKey;

  const _ImageProviderKey(this.providerCacheKey);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is _ImageProviderKey &&
        other.providerCacheKey == providerCacheKey;
  }

  @override
  int get hashCode => providerCacheKey.hashCode;
}

class CustImageProvider extends ImageProvider<_ImageProviderKey> {
  final ImageProvider imageProvider;

  CustImageProvider(this.imageProvider);
  @override
  ImageStreamCompleter load(_ImageProviderKey key, decode) {
    final ourDecoder = (Uint8List bytes,
        {bool allowUpscaling, int cacheWidth, int cacheHeight}) async {
      return decode(await whiteToAlpha(bytes),
          cacheHeight: cacheHeight, cacheWidth: cacheWidth);
    };

    return imageProvider.load(key.providerCacheKey, ourDecoder);
  }

  @override
  Future<_ImageProviderKey> obtainKey(ImageConfiguration configuration) {
    Completer<_ImageProviderKey> completer;
    SynchronousFuture<_ImageProviderKey> result;

    imageProvider.obtainKey(configuration).then((object) {
      if (completer == null) {
        result = SynchronousFuture(_ImageProviderKey(object));
      } else {
        completer.complete(_ImageProviderKey(object));
      }
    });

    if (result != null) {
      return result;
    }
    completer = Completer<_ImageProviderKey>();
    return completer.future;
  }
}

Future<Uint8List> whiteToAlpha(Uint8List bytes) async {
  var image = decodeImage(bytes);
  var transparentImage = await colorTransparent(
    image,
    255,
    255,
    255,
  );
  var newPng = encodePng(transparentImage);
  return newPng;
}

Future<Img.Image> colorTransparent(
    Img.Image src, int red, int green, int blue) async {
  var pixels = src.getBytes();
  for (int i = 0, len = pixels.length; i < len; i += 4) {
    if (pixels[i] == red && pixels[i + 1] == green && pixels[i + 2] == blue) {
      pixels[i + 3] = 0;
    }
  }
  return src;
}
