import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import 'multi_file.dart';


class RequiredMultiFileValidator<T> extends Validator<MultiFile<T>> {
  const RequiredMultiFileValidator();

  @override
  Map<String, dynamic>? validate(AbstractControl<MultiFile<T>> control) =>
    (control.value?.files.isEmpty ?? true)
      ? { ValidationMessage.required: true, }
      : null;
}
