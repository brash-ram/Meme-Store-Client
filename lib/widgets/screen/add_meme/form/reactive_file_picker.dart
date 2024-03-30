import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '/logging.dart';
import 'multi_file.dart';


typedef PickFileCallback = Future<void> Function();
typedef FilePickerChangeCallback<T> = void Function(MultiFile<T> files);

typedef FilePickerBuilder<T> = Widget Function(
  PickFileCallback pickFile,
  ReactiveFormFieldState<MultiFile<T>, MultiFile<T>> field,
  FilePickerChangeCallback<T> onChange,
);

/// A [ReactiveFilePicker] that contains a [FilePicker].
///
/// This is a convenience widget that wraps a [FilePicker] widget in a
/// [ReactiveFilePicker].
///
/// A [ReactiveForm] ancestor is required.
///
class ReactiveFilePicker<T> extends ReactiveFocusableFormField<MultiFile<T>, MultiFile<T>> {
  /// Creates a [ReactiveFilePicker] that contains a [FilePicker].
  ///
  /// Can optionally provide a [formControl] to bind this widget to a control.
  ///
  /// Can optionally provide a [formControlName] to bind this ReactiveFormField
  /// to a [FormControl].
  ///
  /// Must provide one of the arguments [formControl] or a [formControlName],
  /// but not both at the same time.
  ///
  /// Can optionally provide a [validationMessages] argument to customize a
  /// message for different kinds of validation errors.
  ///
  /// Can optionally provide a [valueAccessor] to set a custom value accessors.
  /// See [ControlValueAccessor].
  ///
  /// Can optionally provide a [showErrors] function to customize when to show
  /// validation messages. Reactive Widgets make validation messages visible
  /// when the control is INVALID and TOUCHED, this behavior can be customized
  /// in the [showErrors] function.
  ///
  /// For documentation about the various parameters, see the [FilePicker] class
  /// and [FilePicker], the constructor.
  ReactiveFilePicker({
    super.key,
    super.formControlName,
    super.formControl,
    super.validationMessages,
    super.valueAccessor,
    super.showErrors,
    super.focusNode,

    ////////////////////////////////////////////////////////////////////////////
    InputDecoration? decoration,
    FilePickerBuilder<T>? filePickerBuilder,
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    void Function(FilePickerStatus)? onFileLoading,
    bool allowCompression = true,
    int compressionQuality = 30,
    bool allowMultiple = false,
    bool withData = false,
    bool withReadStream = false,
    bool lockParentWindow = false,
    bool readSequential = false,
    double disabledOpacity = 0.5,
  }) : super(
    builder: (field) {
      final effectiveDecoration = (decoration ?? const InputDecoration())
        .applyDefaults(Theme.of(field.context).inputDecorationTheme);

      String? pickerError;
      Future<void> pickFile() async {
        final platformFiles = <PlatformFile>[];
        try {
          final result = await FilePicker.platform.pickFiles(
            dialogTitle: dialogTitle,
            initialDirectory: initialDirectory,
            type: type,
            allowedExtensions: allowedExtensions,
            onFileLoading: onFileLoading,
            allowCompression: allowCompression,
            compressionQuality: compressionQuality,
            allowMultiple: allowMultiple,
            withData: withData,
            withReadStream: withReadStream,
            lockParentWindow: lockParentWindow,
            readSequential: readSequential,
          );
          if (result?.files case final files?)
            platformFiles.addAll(files);
        } on PlatformException catch (e) {
          pickerError = 'Unsupported operation $e';
        } catch (error, stackTrace) {
          talker.error('Failed to pick files', error, stackTrace);
          pickerError = error.toString();
        }

        if (platformFiles.isNotEmpty) {
          final value = field.value ?? MultiFile<T>();
          field.control.markAsTouched();
          field.didChange(
            MultiFile(
              files: value.files,
              platformFiles: [
                ...value.platformFiles,
                ...platformFiles,
              ],
            ),
          );
        }
      }
      return StreamBuilder(
        stream: field.control.focusChanges,
        builder: (context, snapshot) =>
          InputDecorator(
            decoration: effectiveDecoration.copyWith(
              errorText: field.errorText ?? pickerError,
              enabled: field.control.enabled,
            ),
            isEmpty: field.value?.platformFiles.isEmpty ?? true,
            isFocused: snapshot.data ?? false,
            child: IgnorePointer(
              ignoring: !field.control.enabled,
              child: Opacity(
                opacity: field.control.enabled ? 1 : disabledOpacity,
                child: filePickerBuilder?.call(pickFile, field, (files) {
                  field.control.markAsTouched();
                  field.didChange(files);
                }),
              ),
            ),
          ),
      );
    },
  );
}
