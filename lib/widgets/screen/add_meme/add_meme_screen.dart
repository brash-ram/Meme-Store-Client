import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '/core/router/router.dart';
import '/data_layer_library.dart';
import '/logging.dart';
import 'form/add_meme_form.dart';
import 'form/multi_file.dart';
import 'form/reactive_file_picker.dart';


class AddMemeFormWidget extends StatefulWidget {
  const AddMemeFormWidget({ super.key, });

  @override
  State<AddMemeFormWidget> createState() => _AddMemeForWidgetState();
}

class _AddMemeForWidgetState extends State<AddMemeFormWidget> {
  Future<void> onSubmit(
    BuildContext context,
    AddMemeFormForm form,
    AddMemeForm data,
  ) async {
    final api = context.read<ApiRepository>();
    final group = form.form
      ..markAsDisabled();
    try {
      final tags = <String>[];
      final description = data.description.replaceAllMapped(RegExp(r'#[\w\-]+'), (match) {
        tags.add(match.input.substring(match.start + 1, match.end));
        return '';
      }).trim();

      final assetTicket = await api.uploadAsset(data.image.files.single, AssetType.image);
      // await Future.delayed(Duration(seconds: 1));
      final newMeme = await api.createMeme(
        assetTicket: assetTicket,
        galleryId: data.galleryId,
        meme: RequestBodyCreateMeme(
          title: data.title,
          description: description,
          tags: tags,
        ),
      );
      group.markAsPristine();
      if (context.mounted) {
        final theme = Theme.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: theme.colorScheme.primary,
            content: Text(
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
              ),
              'Meme uploaded successfully',
            ),
            action: SnackBarAction(
              label: 'Open',
              onPressed: () async => context.navigateTo(
                MemeRoute(
                  galleryId: data.galleryId,
                  memeId: newMeme.id,
                ),
              ),
            ),
          ),
        );
      }
    } catch (error, stackTrace) {
      talker.verbose('Failed to upload meme', error, stackTrace);
      group.setErrors({
        'upload_error': error,
      });
      if (context.mounted) {
        final theme = Theme.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: theme.colorScheme.error,
            content: DefaultTextStyle.merge(
              style: TextStyle(
                color: theme.colorScheme.onError,
              ),
              child: ErrorText(error),
            ),
          ),
        );
      }
    } finally {
      group.markAsEnabled();
    }
  }

  @override
  Widget build(BuildContext context) =>
    SingleChildScrollView(
      child: AddMemeFormFormBuilder(
        model: const AddMemeForm(),
        builder: (context, formModel, child) =>
          Column(
            children: [
              // File picker
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReactiveFilePicker(
                  validationMessages: {
                    ValidationMessage.required: (error) => 'You must select an image',
                  },
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    labelText: 'Image',
                  ),
                  dialogTitle: 'Select image',
                  type: FileType.image,
                  allowMultiple: false,
                  withData: true,
                  // allowedExtensions: const [ 'jpg', 'jpeg', 'png', ],
                  formControl: formModel.imageControl,
                  filePickerBuilder: (pickFile, field, onChange) {
                    final onTap = !field.control.enabled ? null : () async {
                      field.control.markAsDisabled();
                      onChange(const MultiFile());
                      await pickFile().catchError(
                        // ignore: avoid_types_on_closure_parameters
                        (Object? error, [ StackTrace? stackTrace, ]) =>
                          talker.error('Failed to pick file', error, stackTrace),
                      );
                      final platformFile = field.value?.platformFiles.singleOrNull;
                      final file = platformFile?.bytes;
                      if (file == null || platformFile == null) {
                        talker.verbose('Canceled file selection.');
                      } else {
                        onChange(
                          MultiFile(
                            files: [ file ],
                            platformFiles: [ platformFile, ],
                          ),
                        );
                      }
                      field.control.markAsEnabled();
                    };
                    return SizedBox(
                      height: 400,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        child: Stack(
                          children: [
                            if (field.value?.files case final files? when files.isNotEmpty)
                              Positioned.fill(
                                child: material.Image.memory(
                                  files.single,
                                  fit: BoxFit.contain,
                                ),
                              )
                            else
                              const Positioned.fill(
                                child: Center(
                                  child: Text('Select image'),
                                ),
                              ),
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: onTap,
                                  focusNode: field.focusNode,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReactiveTextField(
                  validationMessages: {
                    ValidationMessage.required: (error) => 'You must add title',
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    labelText: 'Title',
                    prefixIcon: Icon(Icons.title),
                  ),
                  formControl: formModel.titleControl,
                ),
              ),
              // Description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReactiveTextField(
                  maxLines: 10,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    labelText: 'Description',
                    prefixIcon: Icon(Icons.text_fields),
                  ),
                  formControl: formModel.descriptionControl,
                ),
              ),
              // Gallery dropdown
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocConsumer<AvailableGalleryNamesBloc, BlocState<List<AvailableGalleryName>>>(
                  listener: (context, state) {
                    switch (state) {
                      case BlocStateLoading():
                        formModel.galleryIdControl.markAsDisabled();
                      case BlocStateData(): {
                        formModel.galleryIdControl
                          ..markAsEnabled()
                          ..removeError('available_galleries');
                      }
                      case BlocStateError(:final error, :final stackTrace): {
                        talker.verbose('Failed to get available galleries.', error, stackTrace);
                        formModel.galleryIdControl
                          ..markAsDisabled()
                          ..setErrors({
                            'available_galleries': error,
                          });
                      }
                    }
                  },
                  builder: (context, state) => ReactiveDropdownField<int>(
                    showErrors: (control) => control.touched || control.disabled,
                    validationMessages: {
                      ValidationMessage.required: (error) => 'You must select the destination gallery',
                      'available_galleries': (error) => 'Failed to get user galleries: $error',
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      labelText: 'Gallery',
                      prefixIcon: Icon(Icons.image),
                    ),
                    formControl: formModel.galleryIdControl,
                    items: switch (state) {
                      BlocStateWithValue(:final value) => [
                        for (final gallery in value)
                          DropdownMenuItem(
                            value: gallery.id,
                            child: Text(gallery.name),
                          ),
                      ],
                      _ => [],
                    },
                  ),
                ),
              ),
              // Submit
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReactiveAddMemeFormFormConsumer(
                    builder: (context, formModel, child) =>
                      ElevatedButton(
                        onPressed: !formModel.form.valid ? null
                          : () => formModel.submit(
                            onValid: (data) async => onSubmit(context, formModel, data),
                          ),
                        child: const Text('Submit'),
                      ),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
}

@RoutePage()
class AddMemeScreen extends StatelessWidget {
  const AddMemeScreen({ super.key, });

  @override
  Widget build(BuildContext context) => 
    BlocProvider(
      create: (context) => AvailableGalleryNamesBloc(context.read()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Add meme'),
          actions: [
            Builder(
              builder: (context) =>
                IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Refresh',
                  onPressed: () async => context.read<AvailableGalleryNamesBloc>().update(),
                ),
            ),
            if (kDebugMode)
              Builder(
                builder: (context) =>
                  IconButton(
                    icon: const Icon(Icons.rotate_right),
                    tooltip: 'Reset',
                    onPressed: () async => context.read<AvailableGalleryNamesBloc>().reset(),
                  ),
              ),
          ],
        ),
        body: const AddMemeFormWidget(),
      ),
    );
}
