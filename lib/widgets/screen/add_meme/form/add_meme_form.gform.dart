// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'add_meme_form.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveAddMemeFormFormConsumer extends StatelessWidget {
  const ReactiveAddMemeFormFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, AddMemeFormForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveAddMemeFormForm.of(context);

    if (formModel is! AddMemeFormForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class AddMemeFormFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const AddMemeFormFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final AddMemeFormForm form;
}

class ReactiveAddMemeFormForm extends StatelessWidget {
  const ReactiveAddMemeFormForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final AddMemeFormForm form;

  final WillPopCallback? onWillPop;

  static AddMemeFormForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              AddMemeFormFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        AddMemeFormFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as AddMemeFormFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return AddMemeFormFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

extension ReactiveReactiveAddMemeFormFormExt on BuildContext {
  AddMemeFormForm? addMemeFormFormWatch() => ReactiveAddMemeFormForm.of(this);

  AddMemeFormForm? addMemeFormFormRead() =>
      ReactiveAddMemeFormForm.of(this, listen: false);
}

class AddMemeFormFormBuilder extends StatefulWidget {
  const AddMemeFormFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final AddMemeForm? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, AddMemeFormForm formModel, Widget? child) builder;

  final void Function(BuildContext context, AddMemeFormForm formModel)?
      initState;

  @override
  _AddMemeFormFormBuilderState createState() => _AddMemeFormFormBuilderState();
}

class _AddMemeFormFormBuilderState extends State<AddMemeFormFormBuilder> {
  late AddMemeFormForm _formModel;

  @override
  void initState() {
    _formModel =
        AddMemeFormForm(AddMemeFormForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant AddMemeFormFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel.updateValue(widget.model);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveAddMemeFormForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class AddMemeFormForm implements FormModel<AddMemeForm> {
  AddMemeFormForm(
    this.form,
    this.path,
  );

  static const String imageControlName = "image";

  static const String titleControlName = "title";

  static const String descriptionControlName = "description";

  static const String galleryIdControlName = "galleryId";

  final FormGroup form;

  final String? path;

  String imageControlPath() => pathBuilder(imageControlName);

  String titleControlPath() => pathBuilder(titleControlName);

  String descriptionControlPath() => pathBuilder(descriptionControlName);

  String galleryIdControlPath() => pathBuilder(galleryIdControlName);

  MultiFile<Uint8List> get _imageValue =>
      imageControl.value as MultiFile<Uint8List>;

  String get _titleValue => titleControl.value ?? "";

  String get _descriptionValue => descriptionControl.value ?? "";

  int get _galleryIdValue => galleryIdControl.value as int;

  bool get containsImage {
    try {
      form.control(imageControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsTitle {
    try {
      form.control(titleControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsDescription {
    try {
      form.control(descriptionControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsGalleryId {
    try {
      form.control(galleryIdControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get imageErrors => imageControl.errors;

  Object? get titleErrors => titleControl.errors;

  Object? get descriptionErrors => descriptionControl.errors;

  Object? get galleryIdErrors => galleryIdControl.errors;

  void get imageFocus => form.focus(imageControlPath());

  void get titleFocus => form.focus(titleControlPath());

  void get descriptionFocus => form.focus(descriptionControlPath());

  void get galleryIdFocus => form.focus(galleryIdControlPath());

  void imageValueUpdate(
    MultiFile<Uint8List> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    imageControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void titleValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    titleControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void descriptionValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    descriptionControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void galleryIdValueUpdate(
    int value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    galleryIdControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void imageValuePatch(
    MultiFile<Uint8List> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    imageControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void titleValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    titleControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void descriptionValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    descriptionControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void galleryIdValuePatch(
    int value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    galleryIdControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void imageValueReset(
    MultiFile<Uint8List> value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      imageControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void titleValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      titleControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void descriptionValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      descriptionControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void galleryIdValueReset(
    int value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      galleryIdControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  FormControl<MultiFile<Uint8List>> get imageControl =>
      form.control(imageControlPath()) as FormControl<MultiFile<Uint8List>>;

  FormControl<String> get titleControl =>
      form.control(titleControlPath()) as FormControl<String>;

  FormControl<String> get descriptionControl =>
      form.control(descriptionControlPath()) as FormControl<String>;

  FormControl<int> get galleryIdControl =>
      form.control(galleryIdControlPath()) as FormControl<int>;

  void imageSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      imageControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      imageControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void titleSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      titleControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      titleControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void descriptionSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      descriptionControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      descriptionControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void galleryIdSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      galleryIdControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      galleryIdControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  AddMemeForm get model {
    if (!currentForm.valid) {
      debugPrintStack(
          label:
              '[${path ?? 'AddMemeFormForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return AddMemeForm(
        image: _imageValue,
        title: _titleValue,
        description: _descriptionValue,
        galleryId: _galleryIdValue);
  }

  @override
  void submit({
    required void Function(AddMemeForm model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  AbstractControl<dynamic> get currentForm {
    return path == null ? form : form.control(path!);
  }

  @override
  void updateValue(
    AddMemeForm? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(AddMemeFormForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    AddMemeForm? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(AddMemeForm? addMemeForm) => FormGroup({
        imageControlName: FormControl<MultiFile<Uint8List>>(
            value: addMemeForm?.image,
            validators: [RequiredMultiFileValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        titleControlName: FormControl<String>(
            value: addMemeForm?.title,
            validators: [RequiredStringValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        descriptionControlName: FormControl<String>(
            value: addMemeForm?.description,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        galleryIdControlName: FormControl<int>(
            value: addMemeForm?.galleryId,
            validators: [RequiredPositiveValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveAddMemeFormFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveAddMemeFormFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(AddMemeFormForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      AddMemeFormForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, AddMemeFormForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveAddMemeFormForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final values = formArray.controls.map((e) => e.value).toList();
        final itemList = values
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveAddMemeFormFormFormGroupArrayBuilder<T> extends StatelessWidget {
  const ReactiveAddMemeFormFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<T>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<T>> Function(
      AddMemeFormForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      AddMemeFormForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, AddMemeFormForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveAddMemeFormForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <T>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
