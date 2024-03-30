import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';


class RequiredStringValidator<T extends String> extends Validator<T> {
  const RequiredStringValidator();

  @override
  Map<String, dynamic>? validate(AbstractControl<T> control) =>
    (control.value?.isEmpty ?? true)
      ? { ValidationMessage.required: true, }
      : null;
}
