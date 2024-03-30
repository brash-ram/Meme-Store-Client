import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';


class RequiredPositiveValidator<T extends num> extends Validator<T> {
  const RequiredPositiveValidator();

  @override
  Map<String, dynamic>? validate(AbstractControl<T> control) =>
    (control.value?.compareTo(0) ?? -1) <= 0
      ? { ValidationMessage.required: true, }
      : null;
}
