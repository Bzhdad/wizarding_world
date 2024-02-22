// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DialogStruct extends FFFirebaseStruct {
  DialogStruct({
    int? screenNumber,
    String? buttonText,
    String? text,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _screenNumber = screenNumber,
        _buttonText = buttonText,
        _text = text,
        _image = image,
        super(firestoreUtilData);

  // "screen_number" field.
  int? _screenNumber;
  int get screenNumber => _screenNumber ?? 0;
  set screenNumber(int? val) => _screenNumber = val;
  void incrementScreenNumber(int amount) =>
      _screenNumber = screenNumber + amount;
  bool hasScreenNumber() => _screenNumber != null;

  // "button_text" field.
  String? _buttonText;
  String get buttonText => _buttonText ?? '';
  set buttonText(String? val) => _buttonText = val;
  bool hasButtonText() => _buttonText != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  static DialogStruct fromMap(Map<String, dynamic> data) => DialogStruct(
        screenNumber: castToType<int>(data['screen_number']),
        buttonText: data['button_text'] as String?,
        text: data['text'] as String?,
        image: data['image'] as String?,
      );

  static DialogStruct? maybeFromMap(dynamic data) =>
      data is Map ? DialogStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'screen_number': _screenNumber,
        'button_text': _buttonText,
        'text': _text,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'screen_number': serializeParam(
          _screenNumber,
          ParamType.int,
        ),
        'button_text': serializeParam(
          _buttonText,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static DialogStruct fromSerializableMap(Map<String, dynamic> data) =>
      DialogStruct(
        screenNumber: deserializeParam(
          data['screen_number'],
          ParamType.int,
          false,
        ),
        buttonText: deserializeParam(
          data['button_text'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DialogStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DialogStruct &&
        screenNumber == other.screenNumber &&
        buttonText == other.buttonText &&
        text == other.text &&
        image == other.image;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([screenNumber, buttonText, text, image]);
}

DialogStruct createDialogStruct({
  int? screenNumber,
  String? buttonText,
  String? text,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DialogStruct(
      screenNumber: screenNumber,
      buttonText: buttonText,
      text: text,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DialogStruct? updateDialogStruct(
  DialogStruct? dialog, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dialog
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDialogStructData(
  Map<String, dynamic> firestoreData,
  DialogStruct? dialog,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dialog == null) {
    return;
  }
  if (dialog.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dialog.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dialogData = getDialogFirestoreData(dialog, forFieldValue);
  final nestedData = dialogData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dialog.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDialogFirestoreData(
  DialogStruct? dialog, [
  bool forFieldValue = false,
]) {
  if (dialog == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dialog.toMap());

  // Add any Firestore field values
  dialog.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDialogListFirestoreData(
  List<DialogStruct>? dialogs,
) =>
    dialogs?.map((e) => getDialogFirestoreData(e, true)).toList() ?? [];
