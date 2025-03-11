import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerService {
  /// Picks a file from storage with optional allowed extensions.
  static Future<PickerOutput?> pick({List<String>? allowExtensions}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: allowExtensions == null || allowExtensions.isEmpty
          ? FileType.any
          : FileType.custom,
      allowedExtensions: allowExtensions,
    );

    if (result != null && result.files.isNotEmpty) {
      return _mapFileToPickerOutput(result.files.single);
    } else {
      print("User canceled file picker");
      return null;
    }
  }

  /// Captures an image using the device camera.
  static Future<PickerOutput?> captureFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      File file = File(image.path);
      return PickerOutput(
        file: file,
        path: file.path,
        extension: _getFileExtension(file.path),
        fileName: _getFileName(file.path),
        fileNameWithExtension: file.path.split('/').last,
      );
    } else {
      print("User canceled camera capture");
      return null;
    }
  }

  /// Helper function to map a picked file to a PickerOutput object.
  static PickerOutput _mapFileToPickerOutput(PlatformFile file) {
    final filePath = file.path!;
    return PickerOutput(
      file: File(filePath),
      path: filePath,
      extension: file.extension ?? "",
      fileName: _getFileName(filePath),
      fileNameWithExtension: file.name,
    );
  }

  /// Extracts the file name without extension.
  static String _getFileName(String filePath) {
    String fileNameWithExtension = filePath.split('/').last;
    String fileExtension = _getFileExtension(filePath);
    return fileNameWithExtension.replaceAll(".$fileExtension", "");
  }

  /// Extracts the file extension.
  static String _getFileExtension(String filePath) {
    return filePath.split('.').last;
  }
}

/// Data class for file picker output
class PickerOutput {
  final File? file;
  final String ?path;
  final String? extension;
  final String ?fileName;
  final String? fileNameWithExtension;

  PickerOutput({
     this.file,
     this.path,
     this.extension,
     this.fileName,
     this.fileNameWithExtension,
  });

  @override
  String toString() {
    return 'PickerOutput(file: $file, path: $path, extension: $extension, fileName: $fileName, fileNameWithExtension: $fileNameWithExtension)';
  }
}
