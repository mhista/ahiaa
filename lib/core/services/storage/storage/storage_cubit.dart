import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:ahiaa/core/dependency/init_dependencies.dart';

import '../../../../utils/exceptions/subabase/server_exceptions.dart';

part 'storage_state.dart';

class StorageCubit extends Cubit<StorageState> {
  StorageCubit() : super(StorageInitial());

  Future<String> uploadImageToSupabase({
    required File image,
    required String path,
    required String bucketId,
  }) async {
    emit(StorageLoading());
    final supabaseClient = serviceLocator<SupabaseClient>();

    try {
      await supabaseClient.storage.from(bucketId).upload(path, image);
      return supabaseClient.storage.from(bucketId).getPublicUrl(path);
    } catch (e) {
      throw ServerException('Something went wrong, please try again');
    }
  }

  Future<XFile?> selectImageFromGallery() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxWidth: 512,
      maxHeight: 512,
    );
    return image;
  }

  // UPLOAD LOCAL ASSETS FROM IDE
  // RETURNS A UNIT8LIST CONTAINING IMAGE DATA
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      // debugPrint(path);

      final byteData = await rootBundle.load(path);
      // debugPrint(byteData.toString());

      final imageData = byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      );
      debugPrint(path);

      return imageData;
    } catch (e) {
      throw 'Error loading image data: $e';
    }
  }

  // UPLOAD IMAGE USING IMAGEDATA ON CLOUD FIREBASE STORAGE
  // RETURNS THE DOWNLOAD URL OF THE UPLOADED IMAGE
  Future<String> uploadImageData({
    required Uint8List image,
    required String path,
    required String bucketId,
  }) async {
    final supabaseClient = serviceLocator<SupabaseClient>();

    try {
      debugPrint(bucketId);

      await supabaseClient.storage.from(bucketId).uploadBinary(path, image);

      return supabaseClient.storage.from(bucketId).getPublicUrl(path);
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException('Something went wrong, please try again');
    }
  }
}
