// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  String get word => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  String get temperatureClue => throw _privateConstructorUsedError;
  bool get isHintUsed => throw _privateConstructorUsedError;
  String? get hintText => throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call(
      {String word,
      String level,
      double temperature,
      String temperatureClue,
      bool isHintUsed,
      String? hintText});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? level = null,
    Object? temperature = null,
    Object? temperatureClue = null,
    Object? isHintUsed = null,
    Object? hintText = freezed,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      temperatureClue: null == temperatureClue
          ? _value.temperatureClue
          : temperatureClue // ignore: cast_nullable_to_non_nullable
              as String,
      isHintUsed: null == isHintUsed
          ? _value.isHintUsed
          : isHintUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      hintText: freezed == hintText
          ? _value.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String word,
      String level,
      double temperature,
      String temperatureClue,
      bool isHintUsed,
      String? hintText});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? level = null,
    Object? temperature = null,
    Object? temperatureClue = null,
    Object? isHintUsed = null,
    Object? hintText = freezed,
  }) {
    return _then(_$FailureImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      temperatureClue: null == temperatureClue
          ? _value.temperatureClue
          : temperatureClue // ignore: cast_nullable_to_non_nullable
              as String,
      isHintUsed: null == isHintUsed
          ? _value.isHintUsed
          : isHintUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      hintText: freezed == hintText
          ? _value.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(
      {required this.word,
      required this.level,
      required this.temperature,
      required this.temperatureClue,
      required this.isHintUsed,
      this.hintText});

  @override
  final String word;
  @override
  final String level;
  @override
  final double temperature;
  @override
  final String temperatureClue;
  @override
  final bool isHintUsed;
  @override
  final String? hintText;

  @override
  String toString() {
    return 'Failure(word: $word, level: $level, temperature: $temperature, temperatureClue: $temperatureClue, isHintUsed: $isHintUsed, hintText: $hintText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.temperatureClue, temperatureClue) ||
                other.temperatureClue == temperatureClue) &&
            (identical(other.isHintUsed, isHintUsed) ||
                other.isHintUsed == isHintUsed) &&
            (identical(other.hintText, hintText) ||
                other.hintText == hintText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, word, level, temperature,
      temperatureClue, isHintUsed, hintText);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);
}

abstract class _Failure implements Failure {
  const factory _Failure(
      {required final String word,
      required final String level,
      required final double temperature,
      required final String temperatureClue,
      required final bool isHintUsed,
      final String? hintText}) = _$FailureImpl;

  @override
  String get word;
  @override
  String get level;
  @override
  double get temperature;
  @override
  String get temperatureClue;
  @override
  bool get isHintUsed;
  @override
  String? get hintText;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameState {
  GameStatus get status => throw _privateConstructorUsedError;
  GameMode get mode => throw _privateConstructorUsedError;
  Word? get currentWord => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  int get possiblePoints => throw _privateConstructorUsedError;
  int get attemptsLeft => throw _privateConstructorUsedError;
  int get timeLeft => throw _privateConstructorUsedError;
  List<Failure> get failures => throw _privateConstructorUsedError;
  bool get isFortuneWheelAvailable => throw _privateConstructorUsedError;
  bool get hasUsedHint => throw _privateConstructorUsedError;
  String? get currentGuess => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  bool get isTimerActive => throw _privateConstructorUsedError;
  int get streak => throw _privateConstructorUsedError;
  int get fortuneWheelSpins => throw _privateConstructorUsedError;
  int get lives => throw _privateConstructorUsedError;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {GameStatus status,
      GameMode mode,
      Word? currentWord,
      int points,
      int possiblePoints,
      int attemptsLeft,
      int timeLeft,
      List<Failure> failures,
      bool isFortuneWheelAvailable,
      bool hasUsedHint,
      String? currentGuess,
      String? errorMessage,
      String? successMessage,
      bool isTimerActive,
      int streak,
      int fortuneWheelSpins,
      int lives});

  $WordCopyWith<$Res>? get currentWord;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? mode = null,
    Object? currentWord = freezed,
    Object? points = null,
    Object? possiblePoints = null,
    Object? attemptsLeft = null,
    Object? timeLeft = null,
    Object? failures = null,
    Object? isFortuneWheelAvailable = null,
    Object? hasUsedHint = null,
    Object? currentGuess = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? isTimerActive = null,
    Object? streak = null,
    Object? fortuneWheelSpins = null,
    Object? lives = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as GameMode,
      currentWord: freezed == currentWord
          ? _value.currentWord
          : currentWord // ignore: cast_nullable_to_non_nullable
              as Word?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      possiblePoints: null == possiblePoints
          ? _value.possiblePoints
          : possiblePoints // ignore: cast_nullable_to_non_nullable
              as int,
      attemptsLeft: null == attemptsLeft
          ? _value.attemptsLeft
          : attemptsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as int,
      failures: null == failures
          ? _value.failures
          : failures // ignore: cast_nullable_to_non_nullable
              as List<Failure>,
      isFortuneWheelAvailable: null == isFortuneWheelAvailable
          ? _value.isFortuneWheelAvailable
          : isFortuneWheelAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      hasUsedHint: null == hasUsedHint
          ? _value.hasUsedHint
          : hasUsedHint // ignore: cast_nullable_to_non_nullable
              as bool,
      currentGuess: freezed == currentGuess
          ? _value.currentGuess
          : currentGuess // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isTimerActive: null == isTimerActive
          ? _value.isTimerActive
          : isTimerActive // ignore: cast_nullable_to_non_nullable
              as bool,
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      fortuneWheelSpins: null == fortuneWheelSpins
          ? _value.fortuneWheelSpins
          : fortuneWheelSpins // ignore: cast_nullable_to_non_nullable
              as int,
      lives: null == lives
          ? _value.lives
          : lives // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WordCopyWith<$Res>? get currentWord {
    if (_value.currentWord == null) {
      return null;
    }

    return $WordCopyWith<$Res>(_value.currentWord!, (value) {
      return _then(_value.copyWith(currentWord: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
          _$GameStateImpl value, $Res Function(_$GameStateImpl) then) =
      __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GameStatus status,
      GameMode mode,
      Word? currentWord,
      int points,
      int possiblePoints,
      int attemptsLeft,
      int timeLeft,
      List<Failure> failures,
      bool isFortuneWheelAvailable,
      bool hasUsedHint,
      String? currentGuess,
      String? errorMessage,
      String? successMessage,
      bool isTimerActive,
      int streak,
      int fortuneWheelSpins,
      int lives});

  @override
  $WordCopyWith<$Res>? get currentWord;
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? mode = null,
    Object? currentWord = freezed,
    Object? points = null,
    Object? possiblePoints = null,
    Object? attemptsLeft = null,
    Object? timeLeft = null,
    Object? failures = null,
    Object? isFortuneWheelAvailable = null,
    Object? hasUsedHint = null,
    Object? currentGuess = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? isTimerActive = null,
    Object? streak = null,
    Object? fortuneWheelSpins = null,
    Object? lives = null,
  }) {
    return _then(_$GameStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as GameMode,
      currentWord: freezed == currentWord
          ? _value.currentWord
          : currentWord // ignore: cast_nullable_to_non_nullable
              as Word?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      possiblePoints: null == possiblePoints
          ? _value.possiblePoints
          : possiblePoints // ignore: cast_nullable_to_non_nullable
              as int,
      attemptsLeft: null == attemptsLeft
          ? _value.attemptsLeft
          : attemptsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as int,
      failures: null == failures
          ? _value._failures
          : failures // ignore: cast_nullable_to_non_nullable
              as List<Failure>,
      isFortuneWheelAvailable: null == isFortuneWheelAvailable
          ? _value.isFortuneWheelAvailable
          : isFortuneWheelAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      hasUsedHint: null == hasUsedHint
          ? _value.hasUsedHint
          : hasUsedHint // ignore: cast_nullable_to_non_nullable
              as bool,
      currentGuess: freezed == currentGuess
          ? _value.currentGuess
          : currentGuess // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isTimerActive: null == isTimerActive
          ? _value.isTimerActive
          : isTimerActive // ignore: cast_nullable_to_non_nullable
              as bool,
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      fortuneWheelSpins: null == fortuneWheelSpins
          ? _value.fortuneWheelSpins
          : fortuneWheelSpins // ignore: cast_nullable_to_non_nullable
              as int,
      lives: null == lives
          ? _value.lives
          : lives // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GameStateImpl implements _GameState {
  const _$GameStateImpl(
      {this.status = GameStatus.initial,
      this.mode = GameMode.apprentice,
      this.currentWord,
      this.points = 0,
      this.possiblePoints = 0,
      this.attemptsLeft = 10,
      this.timeLeft = 30,
      final List<Failure> failures = const [],
      this.isFortuneWheelAvailable = false,
      this.hasUsedHint = false,
      this.currentGuess,
      this.errorMessage,
      this.successMessage,
      this.isTimerActive = false,
      this.streak = 0,
      this.fortuneWheelSpins = 0,
      this.lives = 3})
      : _failures = failures;

  @override
  @JsonKey()
  final GameStatus status;
  @override
  @JsonKey()
  final GameMode mode;
  @override
  final Word? currentWord;
  @override
  @JsonKey()
  final int points;
  @override
  @JsonKey()
  final int possiblePoints;
  @override
  @JsonKey()
  final int attemptsLeft;
  @override
  @JsonKey()
  final int timeLeft;
  final List<Failure> _failures;
  @override
  @JsonKey()
  List<Failure> get failures {
    if (_failures is EqualUnmodifiableListView) return _failures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_failures);
  }

  @override
  @JsonKey()
  final bool isFortuneWheelAvailable;
  @override
  @JsonKey()
  final bool hasUsedHint;
  @override
  final String? currentGuess;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;
  @override
  @JsonKey()
  final bool isTimerActive;
  @override
  @JsonKey()
  final int streak;
  @override
  @JsonKey()
  final int fortuneWheelSpins;
  @override
  @JsonKey()
  final int lives;

  @override
  String toString() {
    return 'GameState(status: $status, mode: $mode, currentWord: $currentWord, points: $points, possiblePoints: $possiblePoints, attemptsLeft: $attemptsLeft, timeLeft: $timeLeft, failures: $failures, isFortuneWheelAvailable: $isFortuneWheelAvailable, hasUsedHint: $hasUsedHint, currentGuess: $currentGuess, errorMessage: $errorMessage, successMessage: $successMessage, isTimerActive: $isTimerActive, streak: $streak, fortuneWheelSpins: $fortuneWheelSpins, lives: $lives)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.currentWord, currentWord) ||
                other.currentWord == currentWord) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.possiblePoints, possiblePoints) ||
                other.possiblePoints == possiblePoints) &&
            (identical(other.attemptsLeft, attemptsLeft) ||
                other.attemptsLeft == attemptsLeft) &&
            (identical(other.timeLeft, timeLeft) ||
                other.timeLeft == timeLeft) &&
            const DeepCollectionEquality().equals(other._failures, _failures) &&
            (identical(
                    other.isFortuneWheelAvailable, isFortuneWheelAvailable) ||
                other.isFortuneWheelAvailable == isFortuneWheelAvailable) &&
            (identical(other.hasUsedHint, hasUsedHint) ||
                other.hasUsedHint == hasUsedHint) &&
            (identical(other.currentGuess, currentGuess) ||
                other.currentGuess == currentGuess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.isTimerActive, isTimerActive) ||
                other.isTimerActive == isTimerActive) &&
            (identical(other.streak, streak) || other.streak == streak) &&
            (identical(other.fortuneWheelSpins, fortuneWheelSpins) ||
                other.fortuneWheelSpins == fortuneWheelSpins) &&
            (identical(other.lives, lives) || other.lives == lives));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      mode,
      currentWord,
      points,
      possiblePoints,
      attemptsLeft,
      timeLeft,
      const DeepCollectionEquality().hash(_failures),
      isFortuneWheelAvailable,
      hasUsedHint,
      currentGuess,
      errorMessage,
      successMessage,
      isTimerActive,
      streak,
      fortuneWheelSpins,
      lives);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {final GameStatus status,
      final GameMode mode,
      final Word? currentWord,
      final int points,
      final int possiblePoints,
      final int attemptsLeft,
      final int timeLeft,
      final List<Failure> failures,
      final bool isFortuneWheelAvailable,
      final bool hasUsedHint,
      final String? currentGuess,
      final String? errorMessage,
      final String? successMessage,
      final bool isTimerActive,
      final int streak,
      final int fortuneWheelSpins,
      final int lives}) = _$GameStateImpl;

  @override
  GameStatus get status;
  @override
  GameMode get mode;
  @override
  Word? get currentWord;
  @override
  int get points;
  @override
  int get possiblePoints;
  @override
  int get attemptsLeft;
  @override
  int get timeLeft;
  @override
  List<Failure> get failures;
  @override
  bool get isFortuneWheelAvailable;
  @override
  bool get hasUsedHint;
  @override
  String? get currentGuess;
  @override
  String? get errorMessage;
  @override
  String? get successMessage;
  @override
  bool get isTimerActive;
  @override
  int get streak;
  @override
  int get fortuneWheelSpins;
  @override
  int get lives;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HangmanState {
  String get word => throw _privateConstructorUsedError;
  List<String> get guessedLetters => throw _privateConstructorUsedError;
  List<String> get correctLetters => throw _privateConstructorUsedError;
  List<String> get incorrectLetters => throw _privateConstructorUsedError;
  int get incorrectGuesses => throw _privateConstructorUsedError;
  int get maxIncorrectGuesses => throw _privateConstructorUsedError;
  bool get isGameWon => throw _privateConstructorUsedError;
  bool get isGameLost => throw _privateConstructorUsedError;

  /// Create a copy of HangmanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HangmanStateCopyWith<HangmanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HangmanStateCopyWith<$Res> {
  factory $HangmanStateCopyWith(
          HangmanState value, $Res Function(HangmanState) then) =
      _$HangmanStateCopyWithImpl<$Res, HangmanState>;
  @useResult
  $Res call(
      {String word,
      List<String> guessedLetters,
      List<String> correctLetters,
      List<String> incorrectLetters,
      int incorrectGuesses,
      int maxIncorrectGuesses,
      bool isGameWon,
      bool isGameLost});
}

/// @nodoc
class _$HangmanStateCopyWithImpl<$Res, $Val extends HangmanState>
    implements $HangmanStateCopyWith<$Res> {
  _$HangmanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HangmanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? guessedLetters = null,
    Object? correctLetters = null,
    Object? incorrectLetters = null,
    Object? incorrectGuesses = null,
    Object? maxIncorrectGuesses = null,
    Object? isGameWon = null,
    Object? isGameLost = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      guessedLetters: null == guessedLetters
          ? _value.guessedLetters
          : guessedLetters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctLetters: null == correctLetters
          ? _value.correctLetters
          : correctLetters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      incorrectLetters: null == incorrectLetters
          ? _value.incorrectLetters
          : incorrectLetters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      incorrectGuesses: null == incorrectGuesses
          ? _value.incorrectGuesses
          : incorrectGuesses // ignore: cast_nullable_to_non_nullable
              as int,
      maxIncorrectGuesses: null == maxIncorrectGuesses
          ? _value.maxIncorrectGuesses
          : maxIncorrectGuesses // ignore: cast_nullable_to_non_nullable
              as int,
      isGameWon: null == isGameWon
          ? _value.isGameWon
          : isGameWon // ignore: cast_nullable_to_non_nullable
              as bool,
      isGameLost: null == isGameLost
          ? _value.isGameLost
          : isGameLost // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HangmanStateImplCopyWith<$Res>
    implements $HangmanStateCopyWith<$Res> {
  factory _$$HangmanStateImplCopyWith(
          _$HangmanStateImpl value, $Res Function(_$HangmanStateImpl) then) =
      __$$HangmanStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String word,
      List<String> guessedLetters,
      List<String> correctLetters,
      List<String> incorrectLetters,
      int incorrectGuesses,
      int maxIncorrectGuesses,
      bool isGameWon,
      bool isGameLost});
}

/// @nodoc
class __$$HangmanStateImplCopyWithImpl<$Res>
    extends _$HangmanStateCopyWithImpl<$Res, _$HangmanStateImpl>
    implements _$$HangmanStateImplCopyWith<$Res> {
  __$$HangmanStateImplCopyWithImpl(
      _$HangmanStateImpl _value, $Res Function(_$HangmanStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HangmanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? guessedLetters = null,
    Object? correctLetters = null,
    Object? incorrectLetters = null,
    Object? incorrectGuesses = null,
    Object? maxIncorrectGuesses = null,
    Object? isGameWon = null,
    Object? isGameLost = null,
  }) {
    return _then(_$HangmanStateImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      guessedLetters: null == guessedLetters
          ? _value._guessedLetters
          : guessedLetters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctLetters: null == correctLetters
          ? _value._correctLetters
          : correctLetters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      incorrectLetters: null == incorrectLetters
          ? _value._incorrectLetters
          : incorrectLetters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      incorrectGuesses: null == incorrectGuesses
          ? _value.incorrectGuesses
          : incorrectGuesses // ignore: cast_nullable_to_non_nullable
              as int,
      maxIncorrectGuesses: null == maxIncorrectGuesses
          ? _value.maxIncorrectGuesses
          : maxIncorrectGuesses // ignore: cast_nullable_to_non_nullable
              as int,
      isGameWon: null == isGameWon
          ? _value.isGameWon
          : isGameWon // ignore: cast_nullable_to_non_nullable
              as bool,
      isGameLost: null == isGameLost
          ? _value.isGameLost
          : isGameLost // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HangmanStateImpl extends _HangmanState {
  const _$HangmanStateImpl(
      {required this.word,
      final List<String> guessedLetters = const [],
      final List<String> correctLetters = const [],
      final List<String> incorrectLetters = const [],
      this.incorrectGuesses = 0,
      this.maxIncorrectGuesses = 6,
      this.isGameWon = false,
      this.isGameLost = false})
      : _guessedLetters = guessedLetters,
        _correctLetters = correctLetters,
        _incorrectLetters = incorrectLetters,
        super._();

  @override
  final String word;
  final List<String> _guessedLetters;
  @override
  @JsonKey()
  List<String> get guessedLetters {
    if (_guessedLetters is EqualUnmodifiableListView) return _guessedLetters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guessedLetters);
  }

  final List<String> _correctLetters;
  @override
  @JsonKey()
  List<String> get correctLetters {
    if (_correctLetters is EqualUnmodifiableListView) return _correctLetters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_correctLetters);
  }

  final List<String> _incorrectLetters;
  @override
  @JsonKey()
  List<String> get incorrectLetters {
    if (_incorrectLetters is EqualUnmodifiableListView)
      return _incorrectLetters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incorrectLetters);
  }

  @override
  @JsonKey()
  final int incorrectGuesses;
  @override
  @JsonKey()
  final int maxIncorrectGuesses;
  @override
  @JsonKey()
  final bool isGameWon;
  @override
  @JsonKey()
  final bool isGameLost;

  @override
  String toString() {
    return 'HangmanState(word: $word, guessedLetters: $guessedLetters, correctLetters: $correctLetters, incorrectLetters: $incorrectLetters, incorrectGuesses: $incorrectGuesses, maxIncorrectGuesses: $maxIncorrectGuesses, isGameWon: $isGameWon, isGameLost: $isGameLost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HangmanStateImpl &&
            (identical(other.word, word) || other.word == word) &&
            const DeepCollectionEquality()
                .equals(other._guessedLetters, _guessedLetters) &&
            const DeepCollectionEquality()
                .equals(other._correctLetters, _correctLetters) &&
            const DeepCollectionEquality()
                .equals(other._incorrectLetters, _incorrectLetters) &&
            (identical(other.incorrectGuesses, incorrectGuesses) ||
                other.incorrectGuesses == incorrectGuesses) &&
            (identical(other.maxIncorrectGuesses, maxIncorrectGuesses) ||
                other.maxIncorrectGuesses == maxIncorrectGuesses) &&
            (identical(other.isGameWon, isGameWon) ||
                other.isGameWon == isGameWon) &&
            (identical(other.isGameLost, isGameLost) ||
                other.isGameLost == isGameLost));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      word,
      const DeepCollectionEquality().hash(_guessedLetters),
      const DeepCollectionEquality().hash(_correctLetters),
      const DeepCollectionEquality().hash(_incorrectLetters),
      incorrectGuesses,
      maxIncorrectGuesses,
      isGameWon,
      isGameLost);

  /// Create a copy of HangmanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HangmanStateImplCopyWith<_$HangmanStateImpl> get copyWith =>
      __$$HangmanStateImplCopyWithImpl<_$HangmanStateImpl>(this, _$identity);
}

abstract class _HangmanState extends HangmanState {
  const factory _HangmanState(
      {required final String word,
      final List<String> guessedLetters,
      final List<String> correctLetters,
      final List<String> incorrectLetters,
      final int incorrectGuesses,
      final int maxIncorrectGuesses,
      final bool isGameWon,
      final bool isGameLost}) = _$HangmanStateImpl;
  const _HangmanState._() : super._();

  @override
  String get word;
  @override
  List<String> get guessedLetters;
  @override
  List<String> get correctLetters;
  @override
  List<String> get incorrectLetters;
  @override
  int get incorrectGuesses;
  @override
  int get maxIncorrectGuesses;
  @override
  bool get isGameWon;
  @override
  bool get isGameLost;

  /// Create a copy of HangmanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HangmanStateImplCopyWith<_$HangmanStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
