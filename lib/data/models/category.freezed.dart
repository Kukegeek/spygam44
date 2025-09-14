// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryTranslations _$CategoryTranslationsFromJson(Map<String, dynamic> json) {
  return _CategoryTranslations.fromJson(json);
}

/// @nodoc
mixin _$CategoryTranslations {
  @HiveField(0)
  String get es => throw _privateConstructorUsedError;
  @HiveField(1)
  String get en => throw _privateConstructorUsedError;
  @HiveField(2)
  String get it => throw _privateConstructorUsedError;
  @HiveField(3)
  String get fr => throw _privateConstructorUsedError;
  @HiveField(4)
  String get de => throw _privateConstructorUsedError;
  @HiveField(5)
  String get pt => throw _privateConstructorUsedError;

  /// Serializes this CategoryTranslations to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryTranslations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryTranslationsCopyWith<CategoryTranslations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryTranslationsCopyWith<$Res> {
  factory $CategoryTranslationsCopyWith(CategoryTranslations value,
          $Res Function(CategoryTranslations) then) =
      _$CategoryTranslationsCopyWithImpl<$Res, CategoryTranslations>;
  @useResult
  $Res call(
      {@HiveField(0) String es,
      @HiveField(1) String en,
      @HiveField(2) String it,
      @HiveField(3) String fr,
      @HiveField(4) String de,
      @HiveField(5) String pt});
}

/// @nodoc
class _$CategoryTranslationsCopyWithImpl<$Res,
        $Val extends CategoryTranslations>
    implements $CategoryTranslationsCopyWith<$Res> {
  _$CategoryTranslationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryTranslations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? es = null,
    Object? en = null,
    Object? it = null,
    Object? fr = null,
    Object? de = null,
    Object? pt = null,
  }) {
    return _then(_value.copyWith(
      es: null == es
          ? _value.es
          : es // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
      it: null == it
          ? _value.it
          : it // ignore: cast_nullable_to_non_nullable
              as String,
      fr: null == fr
          ? _value.fr
          : fr // ignore: cast_nullable_to_non_nullable
              as String,
      de: null == de
          ? _value.de
          : de // ignore: cast_nullable_to_non_nullable
              as String,
      pt: null == pt
          ? _value.pt
          : pt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryTranslationsImplCopyWith<$Res>
    implements $CategoryTranslationsCopyWith<$Res> {
  factory _$$CategoryTranslationsImplCopyWith(_$CategoryTranslationsImpl value,
          $Res Function(_$CategoryTranslationsImpl) then) =
      __$$CategoryTranslationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String es,
      @HiveField(1) String en,
      @HiveField(2) String it,
      @HiveField(3) String fr,
      @HiveField(4) String de,
      @HiveField(5) String pt});
}

/// @nodoc
class __$$CategoryTranslationsImplCopyWithImpl<$Res>
    extends _$CategoryTranslationsCopyWithImpl<$Res, _$CategoryTranslationsImpl>
    implements _$$CategoryTranslationsImplCopyWith<$Res> {
  __$$CategoryTranslationsImplCopyWithImpl(_$CategoryTranslationsImpl _value,
      $Res Function(_$CategoryTranslationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryTranslations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? es = null,
    Object? en = null,
    Object? it = null,
    Object? fr = null,
    Object? de = null,
    Object? pt = null,
  }) {
    return _then(_$CategoryTranslationsImpl(
      es: null == es
          ? _value.es
          : es // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
      it: null == it
          ? _value.it
          : it // ignore: cast_nullable_to_non_nullable
              as String,
      fr: null == fr
          ? _value.fr
          : fr // ignore: cast_nullable_to_non_nullable
              as String,
      de: null == de
          ? _value.de
          : de // ignore: cast_nullable_to_non_nullable
              as String,
      pt: null == pt
          ? _value.pt
          : pt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryTranslationsImpl implements _CategoryTranslations {
  const _$CategoryTranslationsImpl(
      {@HiveField(0) required this.es,
      @HiveField(1) required this.en,
      @HiveField(2) required this.it,
      @HiveField(3) required this.fr,
      @HiveField(4) required this.de,
      @HiveField(5) required this.pt});

  factory _$CategoryTranslationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryTranslationsImplFromJson(json);

  @override
  @HiveField(0)
  final String es;
  @override
  @HiveField(1)
  final String en;
  @override
  @HiveField(2)
  final String it;
  @override
  @HiveField(3)
  final String fr;
  @override
  @HiveField(4)
  final String de;
  @override
  @HiveField(5)
  final String pt;

  @override
  String toString() {
    return 'CategoryTranslations(es: $es, en: $en, it: $it, fr: $fr, de: $de, pt: $pt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryTranslationsImpl &&
            (identical(other.es, es) || other.es == es) &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.it, it) || other.it == it) &&
            (identical(other.fr, fr) || other.fr == fr) &&
            (identical(other.de, de) || other.de == de) &&
            (identical(other.pt, pt) || other.pt == pt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, es, en, it, fr, de, pt);

  /// Create a copy of CategoryTranslations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryTranslationsImplCopyWith<_$CategoryTranslationsImpl>
      get copyWith =>
          __$$CategoryTranslationsImplCopyWithImpl<_$CategoryTranslationsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryTranslationsImplToJson(
      this,
    );
  }
}

abstract class _CategoryTranslations implements CategoryTranslations {
  const factory _CategoryTranslations(
      {@HiveField(0) required final String es,
      @HiveField(1) required final String en,
      @HiveField(2) required final String it,
      @HiveField(3) required final String fr,
      @HiveField(4) required final String de,
      @HiveField(5) required final String pt}) = _$CategoryTranslationsImpl;

  factory _CategoryTranslations.fromJson(Map<String, dynamic> json) =
      _$CategoryTranslationsImpl.fromJson;

  @override
  @HiveField(0)
  String get es;
  @override
  @HiveField(1)
  String get en;
  @override
  @HiveField(2)
  String get it;
  @override
  @HiveField(3)
  String get fr;
  @override
  @HiveField(4)
  String get de;
  @override
  @HiveField(5)
  String get pt;

  /// Create a copy of CategoryTranslations
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryTranslationsImplCopyWith<_$CategoryTranslationsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CategoryMeanings _$CategoryMeaningsFromJson(Map<String, dynamic> json) {
  return _CategoryMeanings.fromJson(json);
}

/// @nodoc
mixin _$CategoryMeanings {
  @HiveField(0)
  String get es => throw _privateConstructorUsedError;
  @HiveField(1)
  String get en => throw _privateConstructorUsedError;
  @HiveField(2)
  String get it => throw _privateConstructorUsedError;
  @HiveField(3)
  String get fr => throw _privateConstructorUsedError;
  @HiveField(4)
  String get de => throw _privateConstructorUsedError;
  @HiveField(5)
  String get pt => throw _privateConstructorUsedError;

  /// Serializes this CategoryMeanings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryMeanings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryMeaningsCopyWith<CategoryMeanings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryMeaningsCopyWith<$Res> {
  factory $CategoryMeaningsCopyWith(
          CategoryMeanings value, $Res Function(CategoryMeanings) then) =
      _$CategoryMeaningsCopyWithImpl<$Res, CategoryMeanings>;
  @useResult
  $Res call(
      {@HiveField(0) String es,
      @HiveField(1) String en,
      @HiveField(2) String it,
      @HiveField(3) String fr,
      @HiveField(4) String de,
      @HiveField(5) String pt});
}

/// @nodoc
class _$CategoryMeaningsCopyWithImpl<$Res, $Val extends CategoryMeanings>
    implements $CategoryMeaningsCopyWith<$Res> {
  _$CategoryMeaningsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryMeanings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? es = null,
    Object? en = null,
    Object? it = null,
    Object? fr = null,
    Object? de = null,
    Object? pt = null,
  }) {
    return _then(_value.copyWith(
      es: null == es
          ? _value.es
          : es // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
      it: null == it
          ? _value.it
          : it // ignore: cast_nullable_to_non_nullable
              as String,
      fr: null == fr
          ? _value.fr
          : fr // ignore: cast_nullable_to_non_nullable
              as String,
      de: null == de
          ? _value.de
          : de // ignore: cast_nullable_to_non_nullable
              as String,
      pt: null == pt
          ? _value.pt
          : pt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryMeaningsImplCopyWith<$Res>
    implements $CategoryMeaningsCopyWith<$Res> {
  factory _$$CategoryMeaningsImplCopyWith(_$CategoryMeaningsImpl value,
          $Res Function(_$CategoryMeaningsImpl) then) =
      __$$CategoryMeaningsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String es,
      @HiveField(1) String en,
      @HiveField(2) String it,
      @HiveField(3) String fr,
      @HiveField(4) String de,
      @HiveField(5) String pt});
}

/// @nodoc
class __$$CategoryMeaningsImplCopyWithImpl<$Res>
    extends _$CategoryMeaningsCopyWithImpl<$Res, _$CategoryMeaningsImpl>
    implements _$$CategoryMeaningsImplCopyWith<$Res> {
  __$$CategoryMeaningsImplCopyWithImpl(_$CategoryMeaningsImpl _value,
      $Res Function(_$CategoryMeaningsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryMeanings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? es = null,
    Object? en = null,
    Object? it = null,
    Object? fr = null,
    Object? de = null,
    Object? pt = null,
  }) {
    return _then(_$CategoryMeaningsImpl(
      es: null == es
          ? _value.es
          : es // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
      it: null == it
          ? _value.it
          : it // ignore: cast_nullable_to_non_nullable
              as String,
      fr: null == fr
          ? _value.fr
          : fr // ignore: cast_nullable_to_non_nullable
              as String,
      de: null == de
          ? _value.de
          : de // ignore: cast_nullable_to_non_nullable
              as String,
      pt: null == pt
          ? _value.pt
          : pt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryMeaningsImpl implements _CategoryMeanings {
  const _$CategoryMeaningsImpl(
      {@HiveField(0) required this.es,
      @HiveField(1) required this.en,
      @HiveField(2) required this.it,
      @HiveField(3) required this.fr,
      @HiveField(4) required this.de,
      @HiveField(5) required this.pt});

  factory _$CategoryMeaningsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryMeaningsImplFromJson(json);

  @override
  @HiveField(0)
  final String es;
  @override
  @HiveField(1)
  final String en;
  @override
  @HiveField(2)
  final String it;
  @override
  @HiveField(3)
  final String fr;
  @override
  @HiveField(4)
  final String de;
  @override
  @HiveField(5)
  final String pt;

  @override
  String toString() {
    return 'CategoryMeanings(es: $es, en: $en, it: $it, fr: $fr, de: $de, pt: $pt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryMeaningsImpl &&
            (identical(other.es, es) || other.es == es) &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.it, it) || other.it == it) &&
            (identical(other.fr, fr) || other.fr == fr) &&
            (identical(other.de, de) || other.de == de) &&
            (identical(other.pt, pt) || other.pt == pt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, es, en, it, fr, de, pt);

  /// Create a copy of CategoryMeanings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryMeaningsImplCopyWith<_$CategoryMeaningsImpl> get copyWith =>
      __$$CategoryMeaningsImplCopyWithImpl<_$CategoryMeaningsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryMeaningsImplToJson(
      this,
    );
  }
}

abstract class _CategoryMeanings implements CategoryMeanings {
  const factory _CategoryMeanings(
      {@HiveField(0) required final String es,
      @HiveField(1) required final String en,
      @HiveField(2) required final String it,
      @HiveField(3) required final String fr,
      @HiveField(4) required final String de,
      @HiveField(5) required final String pt}) = _$CategoryMeaningsImpl;

  factory _CategoryMeanings.fromJson(Map<String, dynamic> json) =
      _$CategoryMeaningsImpl.fromJson;

  @override
  @HiveField(0)
  String get es;
  @override
  @HiveField(1)
  String get en;
  @override
  @HiveField(2)
  String get it;
  @override
  @HiveField(3)
  String get fr;
  @override
  @HiveField(4)
  String get de;
  @override
  @HiveField(5)
  String get pt;

  /// Create a copy of CategoryMeanings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryMeaningsImplCopyWith<_$CategoryMeaningsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  @HiveField(0)
  int get idGroup => throw _privateConstructorUsedError;
  @HiveField(1)
  CategoryTranslations get categories => throw _privateConstructorUsedError;
  @HiveField(2)
  CategoryMeanings get meanings => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {@HiveField(0) int idGroup,
      @HiveField(1) CategoryTranslations categories,
      @HiveField(2) CategoryMeanings meanings});

  $CategoryTranslationsCopyWith<$Res> get categories;
  $CategoryMeaningsCopyWith<$Res> get meanings;
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idGroup = null,
    Object? categories = null,
    Object? meanings = null,
  }) {
    return _then(_value.copyWith(
      idGroup: null == idGroup
          ? _value.idGroup
          : idGroup // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as CategoryTranslations,
      meanings: null == meanings
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as CategoryMeanings,
    ) as $Val);
  }

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryTranslationsCopyWith<$Res> get categories {
    return $CategoryTranslationsCopyWith<$Res>(_value.categories, (value) {
      return _then(_value.copyWith(categories: value) as $Val);
    });
  }

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryMeaningsCopyWith<$Res> get meanings {
    return $CategoryMeaningsCopyWith<$Res>(_value.meanings, (value) {
      return _then(_value.copyWith(meanings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int idGroup,
      @HiveField(1) CategoryTranslations categories,
      @HiveField(2) CategoryMeanings meanings});

  @override
  $CategoryTranslationsCopyWith<$Res> get categories;
  @override
  $CategoryMeaningsCopyWith<$Res> get meanings;
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idGroup = null,
    Object? categories = null,
    Object? meanings = null,
  }) {
    return _then(_$CategoryImpl(
      idGroup: null == idGroup
          ? _value.idGroup
          : idGroup // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as CategoryTranslations,
      meanings: null == meanings
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as CategoryMeanings,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl extends _Category {
  const _$CategoryImpl(
      {@HiveField(0) required this.idGroup,
      @HiveField(1) required this.categories,
      @HiveField(2) required this.meanings})
      : super._();

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  @HiveField(0)
  final int idGroup;
  @override
  @HiveField(1)
  final CategoryTranslations categories;
  @override
  @HiveField(2)
  final CategoryMeanings meanings;

  @override
  String toString() {
    return 'Category(idGroup: $idGroup, categories: $categories, meanings: $meanings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.idGroup, idGroup) || other.idGroup == idGroup) &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.meanings, meanings) ||
                other.meanings == meanings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idGroup, categories, meanings);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category extends Category {
  const factory _Category(
      {@HiveField(0) required final int idGroup,
      @HiveField(1) required final CategoryTranslations categories,
      @HiveField(2) required final CategoryMeanings meanings}) = _$CategoryImpl;
  const _Category._() : super._();

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  @HiveField(0)
  int get idGroup;
  @override
  @HiveField(1)
  CategoryTranslations get categories;
  @override
  @HiveField(2)
  CategoryMeanings get meanings;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
