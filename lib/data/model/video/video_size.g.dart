// GENERATED CODE - DO NOT MODIFY BY HAND

part of video_size;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoSize> _$videoSizeSerializer = new _$VideoSizeSerializer();

class _$VideoSizeSerializer implements StructuredSerializer<VideoSize> {
  @override
  final Iterable<Type> types = const [VideoSize, _$VideoSize];
  @override
  final String wireName = 'VideoSize';

  @override
  Iterable<Object> serialize(Serializers serializers, VideoSize object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'width',
      serializers.serialize(object.width, specifiedType: const FullType(int)),
      'height',
      serializers.serialize(object.height, specifiedType: const FullType(int)),
      'size',
      serializers.serialize(object.size, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  VideoSize deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoSizeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'width':
          result.width = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$VideoSize extends VideoSize {
  @override
  final String url;
  @override
  final int width;
  @override
  final int height;
  @override
  final int size;

  factory _$VideoSize([void Function(VideoSizeBuilder) updates]) =>
      (new VideoSizeBuilder()..update(updates)).build();

  _$VideoSize._({this.url, this.width, this.height, this.size}) : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('VideoSize', 'url');
    }
    if (width == null) {
      throw new BuiltValueNullFieldError('VideoSize', 'width');
    }
    if (height == null) {
      throw new BuiltValueNullFieldError('VideoSize', 'height');
    }
    if (size == null) {
      throw new BuiltValueNullFieldError('VideoSize', 'size');
    }
  }

  @override
  VideoSize rebuild(void Function(VideoSizeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoSizeBuilder toBuilder() => new VideoSizeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoSize &&
        url == other.url &&
        width == other.width &&
        height == other.height &&
        size == other.size;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, url.hashCode), width.hashCode), height.hashCode),
        size.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoSize')
          ..add('url', url)
          ..add('width', width)
          ..add('height', height)
          ..add('size', size))
        .toString();
  }
}

class VideoSizeBuilder implements Builder<VideoSize, VideoSizeBuilder> {
  _$VideoSize _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _width;
  int get width => _$this._width;
  set width(int width) => _$this._width = width;

  int _height;
  int get height => _$this._height;
  set height(int height) => _$this._height = height;

  int _size;
  int get size => _$this._size;
  set size(int size) => _$this._size = size;

  VideoSizeBuilder();

  VideoSizeBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _width = _$v.width;
      _height = _$v.height;
      _size = _$v.size;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoSize other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoSize;
  }

  @override
  void update(void Function(VideoSizeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoSize build() {
    final _$result = _$v ??
        new _$VideoSize._(url: url, width: width, height: height, size: size);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
