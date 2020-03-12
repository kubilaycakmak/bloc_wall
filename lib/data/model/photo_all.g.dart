// GENERATED CODE - DO NOT MODIFY BY HAND

part of photo_all;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhotoAll> _$photoAllSerializer = new _$PhotoAllSerializer();

class _$PhotoAllSerializer implements StructuredSerializer<PhotoAll> {
  @override
  final Iterable<Type> types = const [PhotoAll, _$PhotoAll];
  @override
  final String wireName = 'PhotoAll';

  @override
  Iterable<Object> serialize(Serializers serializers, PhotoAll object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
      'totalHits',
      serializers.serialize(object.totalHits,
          specifiedType: const FullType(int)),
      'hits',
      serializers.serialize(object.hits,
          specifiedType:
              const FullType(BuiltList, const [const FullType(PhotoHits)])),
    ];

    return result;
  }

  @override
  PhotoAll deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhotoAllBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'totalHits':
          result.totalHits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'hits':
          result.hits.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PhotoHits)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$PhotoAll extends PhotoAll {
  @override
  final int total;
  @override
  final int totalHits;
  @override
  final BuiltList<PhotoHits> hits;

  factory _$PhotoAll([void Function(PhotoAllBuilder) updates]) =>
      (new PhotoAllBuilder()..update(updates)).build();

  _$PhotoAll._({this.total, this.totalHits, this.hits}) : super._() {
    if (total == null) {
      throw new BuiltValueNullFieldError('PhotoAll', 'total');
    }
    if (totalHits == null) {
      throw new BuiltValueNullFieldError('PhotoAll', 'totalHits');
    }
    if (hits == null) {
      throw new BuiltValueNullFieldError('PhotoAll', 'hits');
    }
  }

  @override
  PhotoAll rebuild(void Function(PhotoAllBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhotoAllBuilder toBuilder() => new PhotoAllBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhotoAll &&
        total == other.total &&
        totalHits == other.totalHits &&
        hits == other.hits;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, total.hashCode), totalHits.hashCode), hits.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhotoAll')
          ..add('total', total)
          ..add('totalHits', totalHits)
          ..add('hits', hits))
        .toString();
  }
}

class PhotoAllBuilder implements Builder<PhotoAll, PhotoAllBuilder> {
  _$PhotoAll _$v;

  int _total;
  int get total => _$this._total;
  set total(int total) => _$this._total = total;

  int _totalHits;
  int get totalHits => _$this._totalHits;
  set totalHits(int totalHits) => _$this._totalHits = totalHits;

  ListBuilder<PhotoHits> _hits;
  ListBuilder<PhotoHits> get hits =>
      _$this._hits ??= new ListBuilder<PhotoHits>();
  set hits(ListBuilder<PhotoHits> hits) => _$this._hits = hits;

  PhotoAllBuilder();

  PhotoAllBuilder get _$this {
    if (_$v != null) {
      _total = _$v.total;
      _totalHits = _$v.totalHits;
      _hits = _$v.hits?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhotoAll other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhotoAll;
  }

  @override
  void update(void Function(PhotoAllBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhotoAll build() {
    _$PhotoAll _$result;
    try {
      _$result = _$v ??
          new _$PhotoAll._(
              total: total, totalHits: totalHits, hits: hits.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'hits';
        hits.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PhotoAll', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
