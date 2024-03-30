import 'package:file_picker/file_picker.dart';

class MultiFile<T> {
  const MultiFile({
    this.files = const [],
    this.platformFiles = const [],
  });

  final List<T> files;
  final List<PlatformFile> platformFiles;
}
