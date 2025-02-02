// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

import 'dart:io';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

Future<String> scannerAction(BuildContext context) async {
  List<String> _pictures = [];
  List<String> pictures = [];
  String resultMessage = '';

  try {
    pictures = await CunningDocumentScanner.getPictures(
            isGalleryImportAllowed: true) ??
        [];
    _pictures = pictures;
  } catch (exception) {
    // Handle exception here
    return resultMessage;
  }

  final time = DateTime.now()
      .toIso8601String()
      .replaceAll('.', '-')
      .replaceAll(':', '-');
  String name = 'cropimage_$time';

  int count = -1;
  for (String picture in pictures) {
    count += 1;
    name = 'scanned_image' + count.toString();
    await ImageGallerySaver.saveFile(picture, name: name);
  }

  return resultMessage;
}
