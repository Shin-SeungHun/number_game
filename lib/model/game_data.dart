import 'dart:math';

class GameData{
  int _randomNumber;
  int _min;
  int _max;
  int _lifeCount;
  String _resultText;
  bool _isGameActive;

  bool get isGameActive => _isGameActive;

  set isGameActive(bool value) {
    _isGameActive = value;
  }

  String get resultText => _resultText;

  set resultText(String value) {
    _resultText = value;
  }

  int get lifeCount => _lifeCount;

  set lifeCount(int value) {
    _lifeCount = value;
  }

  int get max => _max;

  set max(int value) {
    _max = value;
  }

  int get min => _min;

  set min(int value) {
    _min = value;
  }

  int get randomNumber => _randomNumber;

  set randomNumber(int value) {
    _randomNumber = value;
  }

  int generateRandomNumber() {
    return Random().nextInt(100) + 1;
  }

//<editor-fold desc="Data Methods">
  GameData({
    required int randomNumber,
    required int min,
    required int max,
    required int lifeCount,
    required String resultText,
    required bool isGameActive,
  })  : _randomNumber = randomNumber,
        _min = min,
        _max = max,
        _lifeCount = lifeCount,
        _resultText = resultText,
        _isGameActive = isGameActive;

  factory GameData.initial() {
    return GameData(
      randomNumber: 1,
      min: 1,
      max: 100,
      lifeCount: 10,
      resultText: '',
      isGameActive: false,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameData &&
          runtimeType == other.runtimeType &&
          _randomNumber == other._randomNumber &&
          _min == other._min &&
          _max == other._max &&
          _lifeCount == other._lifeCount &&
          _resultText == other._resultText &&
          _isGameActive == other._isGameActive);

  @override
  int get hashCode =>
      _randomNumber.hashCode ^
      _min.hashCode ^
      _max.hashCode ^
      _lifeCount.hashCode ^
      _resultText.hashCode ^
      _isGameActive.hashCode;

  GameData copyWith({
    int? randomNumber,
    int? min,
    int? max,
    int? lifeCount,
    String? resultText,
    bool? isGameActive,
  }) {
    return GameData(
      randomNumber: randomNumber ?? _randomNumber,
      min: min ?? _min,
      max: max ?? _max,
      lifeCount: lifeCount ?? _lifeCount,
      resultText: resultText ?? _resultText,
      isGameActive: isGameActive ?? _isGameActive,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_randomNumber': _randomNumber,
      '_min': _min,
      '_max': _max,
      '_lifeCount': _lifeCount,
      '_resultText': _resultText,
      '_isGameActive': _isGameActive,
    };
  }

  factory GameData.fromJson(Map<String, dynamic> map) {
    return GameData(
      randomNumber: map['_randomNumber'] as int,
      min: map['_min'] as int,
      max: map['_max'] as int,
      lifeCount: map['_lifeCount'] as int,
      resultText: map['_resultText'] as String,
      isGameActive: map['_isGameActive'] as bool,
    );
  }

  @override
  String toString() {
    return 'GameData{_randomNumber: $_randomNumber, _min: $_min, _max: $_max, _lifeCount: $_lifeCount, _resultText: $_resultText, _isGameActive: $_isGameActive}';
  }

//</editor-fold>
}