import 'dart:typed_data';

import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import 'multi_file.dart';
import 'required_multi_file_validator.dart';
import 'required_positive_validator.dart';
import 'required_string_validator.dart';

part 'add_meme_form.gform.dart';


@Rf()
class AddMemeForm {
  const AddMemeForm({
    @RfControl<MultiFile<Uint8List>>(
      validators: [
        RequiredMultiFileValidator(),
      ],
    ) this.image = const MultiFile(),
    @RfControl<String>(
      validators: [
        RequiredStringValidator(),
      ],
    ) this.title = '',
    @RfControl<String>() this.description = '',
    @RfControl<int>(
      validators: [
        RequiredPositiveValidator(),
      ],
    ) this.galleryId = 0,
  });

  final MultiFile<Uint8List> image;
  final String title;
  final String description;
  final int galleryId;
}
