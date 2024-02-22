import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _loadingMainMapText =
          prefs.getStringList('ff_loadingMainMapText') ?? _loadingMainMapText;
    });
    _safeInit(() {
      _currentQuest = prefs.getString('ff_currentQuest')?.ref ?? _currentQuest;
    });
    _safeInit(() {
      _mapCenter =
          latLngFromString(prefs.getString('ff_mapCenter')) ?? _mapCenter;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _loadingMainMapText = [
    'Полируем метлы',
    'Убираем пыль с зелий',
    'Дарим носок эльфу',
    'Освежаем запах драконьего дыхания',
    'Зажигаем факелы в пещерах гоблинов',
    'Передаем подсказки через сов',
    'Заманиваем кентавров на поляну с фруктами',
    'Учим Левиоса',
    'Следим за движением звезд',
    'Ловим шоколадную лягушку',
    'Поём хором с лягушками',
    'Следим за студентками из Франции',
    'Ищем крестражи',
    'Заходим в Тайную комнату'
  ];
  List<String> get loadingMainMapText => _loadingMainMapText;
  set loadingMainMapText(List<String> value) {
    _loadingMainMapText = value;
    prefs.setStringList('ff_loadingMainMapText', value);
  }

  void addToLoadingMainMapText(String value) {
    _loadingMainMapText.add(value);
    prefs.setStringList('ff_loadingMainMapText', _loadingMainMapText);
  }

  void removeFromLoadingMainMapText(String value) {
    _loadingMainMapText.remove(value);
    prefs.setStringList('ff_loadingMainMapText', _loadingMainMapText);
  }

  void removeAtIndexFromLoadingMainMapText(int index) {
    _loadingMainMapText.removeAt(index);
    prefs.setStringList('ff_loadingMainMapText', _loadingMainMapText);
  }

  void updateLoadingMainMapTextAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _loadingMainMapText[index] = updateFn(_loadingMainMapText[index]);
    prefs.setStringList('ff_loadingMainMapText', _loadingMainMapText);
  }

  void insertAtIndexInLoadingMainMapText(int index, String value) {
    _loadingMainMapText.insert(index, value);
    prefs.setStringList('ff_loadingMainMapText', _loadingMainMapText);
  }

  DocumentReference? _currentQuest;
  DocumentReference? get currentQuest => _currentQuest;
  set currentQuest(DocumentReference? value) {
    _currentQuest = value;
    value != null
        ? prefs.setString('ff_currentQuest', value.path)
        : prefs.remove('ff_currentQuest');
  }

  bool _finalChosen = false;
  bool get finalChosen => _finalChosen;
  set finalChosen(bool value) {
    _finalChosen = value;
  }

  LatLng? _finalCoordinate;
  LatLng? get finalCoordinate => _finalCoordinate;
  set finalCoordinate(LatLng? value) {
    _finalCoordinate = value;
  }

  LatLng? _mapCenter = const LatLng(43.41302899999999, 34.299316);
  LatLng? get mapCenter => _mapCenter;
  set mapCenter(LatLng? value) {
    _mapCenter = value;
    value != null
        ? prefs.setString('ff_mapCenter', value.serialize())
        : prefs.remove('ff_mapCenter');
  }

  final _questsManager = StreamRequestManager<List<UncompleteQuestsRecord>>();
  Stream<List<UncompleteQuestsRecord>> quests({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UncompleteQuestsRecord>> Function() requestFn,
  }) =>
      _questsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQuestsCache() => _questsManager.clear();
  void clearQuestsCacheKey(String? uniqueKey) =>
      _questsManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
