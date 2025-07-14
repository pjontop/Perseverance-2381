import 'dart:io';
import 'package:appwrite/appwrite.dart';
import '../config/appwrite_config.dart';

class StorageService {
  late final Client _client;
  late final Storage _storage;
  
  StorageService() {
    _client = Client()
      ..setEndpoint(AppwriteConfig.endpoint)
      ..setProject(AppwriteConfig.projectId)
      ..setSelfSigned(status: true);
    
    _storage = Storage(_client);
  }

  // Upload file to storage
  Future<String> uploadFile({
    required String bucketId,
    required String filePath,
    String? fileId,
  }) async {
    try {
      final file = await _storage.createFile(
        bucketId: bucketId,
        fileId: fileId ?? ID.unique(),
        file: InputFile.fromPath(path: filePath),
      );
      return file.$id;
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }

  // Upload file from bytes
  Future<String> uploadFileFromBytes({
    required String bucketId,
    required List<int> bytes,
    required String fileName,
    String? fileId,
  }) async {
    try {
      final file = await _storage.createFile(
        bucketId: bucketId,
        fileId: fileId ?? ID.unique(),
        file: InputFile.fromBytes(bytes: bytes, filename: fileName),
      );
      return file.$id;
    } catch (e) {
      throw Exception('Failed to upload file from bytes: $e');
    }
  }

  // Get file download URL
  Future<String> getFileDownloadUrl({
    required String bucketId,
    required String fileId,
  }) async {
    try {
      return _storage.getFileDownload(
        bucketId: bucketId,
        fileId: fileId,
      );
    } catch (e) {
      throw Exception('Failed to get file download URL: $e');
    }
  }

  // Get file preview URL
  Future<String> getFilePreviewUrl({
    required String bucketId,
    required String fileId,
    int? width,
    int? height,
    String? gravity,
    int? quality,
    int? border,
    int? borderRadius,
    double? opacity,
    int? rotation,
    String? background,
    String? output,
  }) async {
    try {
      return _storage.getFilePreview(
        bucketId: bucketId,
        fileId: fileId,
        width: width,
        height: height,
        gravity: gravity,
        quality: quality,
        border: border,
        borderRadius: borderRadius,
        opacity: opacity,
        rotation: rotation,
        background: background,
        output: output,
      );
    } catch (e) {
      throw Exception('Failed to get file preview URL: $e');
    }
  }

  // Delete file
  Future<void> deleteFile({
    required String bucketId,
    required String fileId,
  }) async {
    try {
      await _storage.deleteFile(
        bucketId: bucketId,
        fileId: fileId,
      );
    } catch (e) {
      throw Exception('Failed to delete file: $e');
    }
  }

  // List files in bucket
  Future<FileList> listFiles({
    required String bucketId,
    List<String>? queries,
    String? search,
  }) async {
    try {
      return await _storage.listFiles(
        bucketId: bucketId,
        queries: queries,
        search: search,
      );
    } catch (e) {
      throw Exception('Failed to list files: $e');
    }
  }

  // Get file info
  Future<File> getFile({
    required String bucketId,
    required String fileId,
  }) async {
    try {
      return await _storage.getFile(
        bucketId: bucketId,
        fileId: fileId,
      );
    } catch (e) {
      throw Exception('Failed to get file info: $e');
    }
  }

  // Update file
  Future<File> updateFile({
    required String bucketId,
    required String fileId,
    String? name,
  }) async {
    try {
      return await _storage.updateFile(
        bucketId: bucketId,
        fileId: fileId,
        name: name,
      );
    } catch (e) {
      throw Exception('Failed to update file: $e');
    }
  }

  // Upload profile photo
  Future<String> uploadProfilePhoto(String filePath) async {
    return await uploadFile(
      bucketId: AppwriteConfig.profilePhotosBucket,
      filePath: filePath,
    );
  }

  // Upload build photo
  Future<String> uploadBuildPhoto(String filePath) async {
    return await uploadFile(
      bucketId: AppwriteConfig.buildPhotosBucket,
      filePath: filePath,
    );
  }

  // Upload competition photo
  Future<String> uploadCompetitionPhoto(String filePath) async {
    return await uploadFile(
      bucketId: AppwriteConfig.competitionPhotosBucket,
      filePath: filePath,
    );
  }

  // Upload document
  Future<String> uploadDocument(String filePath) async {
    return await uploadFile(
      bucketId: AppwriteConfig.documentsBucket,
      filePath: filePath,
    );
  }

  // Get profile photo URL
  Future<String> getProfilePhotoUrl(String fileId) async {
    return await getFileDownloadUrl(
      bucketId: AppwriteConfig.profilePhotosBucket,
      fileId: fileId,
    );
  }

  // Get build photo URL
  Future<String> getBuildPhotoUrl(String fileId) async {
    return await getFileDownloadUrl(
      bucketId: AppwriteConfig.buildPhotosBucket,
      fileId: fileId,
    );
  }

  // Get competition photo URL
  Future<String> getCompetitionPhotoUrl(String fileId) async {
    return await getFileDownloadUrl(
      bucketId: AppwriteConfig.competitionPhotosBucket,
      fileId: fileId,
    );
  }

  // Get document URL
  Future<String> getDocumentUrl(String fileId) async {
    return await getFileDownloadUrl(
      bucketId: AppwriteConfig.documentsBucket,
      fileId: fileId,
    );
  }

  // Batch upload files
  Future<List<String>> batchUploadFiles({
    required String bucketId,
    required List<String> filePaths,
  }) async {
    final fileIds = <String>[];
    
    for (final filePath in filePaths) {
      try {
        final fileId = await uploadFile(
          bucketId: bucketId,
          filePath: filePath,
        );
        fileIds.add(fileId);
      } catch (e) {
        print('Failed to upload file in batch: $e');
      }
    }
    
    return fileIds;
  }

  // Batch delete files
  Future<void> batchDeleteFiles({
    required String bucketId,
    required List<String> fileIds,
  }) async {
    for (final fileId in fileIds) {
      try {
        await deleteFile(
          bucketId: bucketId,
          fileId: fileId,
        );
      } catch (e) {
        print('Failed to delete file in batch: $e');
      }
    }
  }
} 