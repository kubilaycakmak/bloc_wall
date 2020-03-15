// GENERATED CODE - DO NOT MODIFY BY HAND

part of photo_hits;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhotoHits> _$photoHitsSerializer = new _$PhotoHitsSerializer();

class _$PhotoHitsSerializer implements StructuredSerializer<PhotoHits> {
  @override
  final Iterable<Type> types = const [PhotoHits, _$PhotoHits];
  @override
  final String wireName = 'PhotoHits';

  @override
  Iterable<Object> serialize(Serializers serializers, PhotoHits object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'pageURL',
      serializers.serialize(object.pageURL,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'tags',
      serializers.serialize(object.tags, specifiedType: const FullType(String)),
      'previewURL',
      serializers.serialize(object.previewURL,
          specifiedType: const FullType(String)),
      'previewWidth',
      serializers.serialize(object.previewWidth,
          specifiedType: const FullType(int)),
      'previewHeight',
      serializers.serialize(object.previewHeight,
          specifiedType: const FullType(int)),
      'webformatURL',
      serializers.serialize(object.webformatURL,
          specifiedType: const FullType(String)),
      'webformatWidth',
      serializers.serialize(object.webformatWidth,
          specifiedType: const FullType(int)),
      'webformatHeight',
      serializers.serialize(object.webformatHeight,
          specifiedType: const FullType(int)),
      'largeImageURL',
      serializers.serialize(object.largeImageURL,
          specifiedType: const FullType(String)),
      'imageWidth',
      serializers.serialize(object.imageWidth,
          specifiedType: const FullType(int)),
      'imageHeight',
      serializers.serialize(object.imageHeight,
          specifiedType: const FullType(int)),
      'views',
      serializers.serialize(object.views, specifiedType: const FullType(int)),
      'downloads',
      serializers.serialize(object.downloads,
          specifiedType: const FullType(int)),
      'favorites',
      serializers.serialize(object.favorites,
          specifiedType: const FullType(int)),
      'likes',
      serializers.serialize(object.likes, specifiedType: const FullType(int)),
      'comments',
      serializers.serialize(object.comments,
          specifiedType: const FullType(int)),
      'user_id',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(String)),
      'userImageURL',
      serializers.serialize(object.userImageURL,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PhotoHits deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhotoHitsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pageURL':
          result.pageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tags':
          result.tags = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'previewURL':
          result.previewURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'previewWidth':
          result.previewWidth = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'previewHeight':
          result.previewHeight = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'webformatURL':
          result.webformatURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'webformatWidth':
          result.webformatWidth = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'webformatHeight':
          result.webformatHeight = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'largeImageURL':
          result.largeImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imageWidth':
          result.imageWidth = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'imageHeight':
          result.imageHeight = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'views':
          result.views = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'downloads':
          result.downloads = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'favorites':
          result.favorites = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'likes':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'comments':
          result.comments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userImageURL':
          result.userImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PhotoHits extends PhotoHits {
  @override
  final int id;
  @override
  final String pageURL;
  @override
  final String type;
  @override
  final String tags;
  @override
  final String previewURL;
  @override
  final int previewWidth;
  @override
  final int previewHeight;
  @override
  final String webformatURL;
  @override
  final int webformatWidth;
  @override
  final int webformatHeight;
  @override
  final String largeImageURL;
  @override
  final int imageWidth;
  @override
  final int imageHeight;
  @override
  final int views;
  @override
  final int downloads;
  @override
  final int favorites;
  @override
  final int likes;
  @override
  final int comments;
  @override
  final int userId;
  @override
  final String user;
  @override
  final String userImageURL;

  factory _$PhotoHits([void Function(PhotoHitsBuilder) updates]) =>
      (new PhotoHitsBuilder()..update(updates)).build();

  _$PhotoHits._(
      {this.id,
      this.pageURL,
      this.type,
      this.tags,
      this.previewURL,
      this.previewWidth,
      this.previewHeight,
      this.webformatURL,
      this.webformatWidth,
      this.webformatHeight,
      this.largeImageURL,
      this.imageWidth,
      this.imageHeight,
      this.views,
      this.downloads,
      this.favorites,
      this.likes,
      this.comments,
      this.userId,
      this.user,
      this.userImageURL})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'id');
    }
    if (pageURL == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'pageURL');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'type');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'tags');
    }
    if (previewURL == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'previewURL');
    }
    if (previewWidth == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'previewWidth');
    }
    if (previewHeight == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'previewHeight');
    }
    if (webformatURL == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'webformatURL');
    }
    if (webformatWidth == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'webformatWidth');
    }
    if (webformatHeight == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'webformatHeight');
    }
    if (largeImageURL == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'largeImageURL');
    }
    if (imageWidth == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'imageWidth');
    }
    if (imageHeight == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'imageHeight');
    }
    if (views == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'views');
    }
    if (downloads == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'downloads');
    }
    if (favorites == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'favorites');
    }
    if (likes == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'likes');
    }
    if (comments == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'comments');
    }
    if (userId == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'userId');
    }
    if (user == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'user');
    }
    if (userImageURL == null) {
      throw new BuiltValueNullFieldError('PhotoHits', 'userImageURL');
    }
  }

  @override
  PhotoHits rebuild(void Function(PhotoHitsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhotoHitsBuilder toBuilder() => new PhotoHitsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhotoHits &&
        id == other.id &&
        pageURL == other.pageURL &&
        type == other.type &&
        tags == other.tags &&
        previewURL == other.previewURL &&
        previewWidth == other.previewWidth &&
        previewHeight == other.previewHeight &&
        webformatURL == other.webformatURL &&
        webformatWidth == other.webformatWidth &&
        webformatHeight == other.webformatHeight &&
        largeImageURL == other.largeImageURL &&
        imageWidth == other.imageWidth &&
        imageHeight == other.imageHeight &&
        views == other.views &&
        downloads == other.downloads &&
        favorites == other.favorites &&
        likes == other.likes &&
        comments == other.comments &&
        userId == other.userId &&
        user == other.user &&
        userImageURL == other.userImageURL;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc(0, id.hashCode), pageURL.hashCode),
                                                                                type.hashCode),
                                                                            tags.hashCode),
                                                                        previewURL.hashCode),
                                                                    previewWidth.hashCode),
                                                                previewHeight.hashCode),
                                                            webformatURL.hashCode),
                                                        webformatWidth.hashCode),
                                                    webformatHeight.hashCode),
                                                largeImageURL.hashCode),
                                            imageWidth.hashCode),
                                        imageHeight.hashCode),
                                    views.hashCode),
                                downloads.hashCode),
                            favorites.hashCode),
                        likes.hashCode),
                    comments.hashCode),
                userId.hashCode),
            user.hashCode),
        userImageURL.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhotoHits')
          ..add('id', id)
          ..add('pageURL', pageURL)
          ..add('type', type)
          ..add('tags', tags)
          ..add('previewURL', previewURL)
          ..add('previewWidth', previewWidth)
          ..add('previewHeight', previewHeight)
          ..add('webformatURL', webformatURL)
          ..add('webformatWidth', webformatWidth)
          ..add('webformatHeight', webformatHeight)
          ..add('largeImageURL', largeImageURL)
          ..add('imageWidth', imageWidth)
          ..add('imageHeight', imageHeight)
          ..add('views', views)
          ..add('downloads', downloads)
          ..add('favorites', favorites)
          ..add('likes', likes)
          ..add('comments', comments)
          ..add('userId', userId)
          ..add('user', user)
          ..add('userImageURL', userImageURL))
        .toString();
  }
}

class PhotoHitsBuilder implements Builder<PhotoHits, PhotoHitsBuilder> {
  _$PhotoHits _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _pageURL;
  String get pageURL => _$this._pageURL;
  set pageURL(String pageURL) => _$this._pageURL = pageURL;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _tags;
  String get tags => _$this._tags;
  set tags(String tags) => _$this._tags = tags;

  String _previewURL;
  String get previewURL => _$this._previewURL;
  set previewURL(String previewURL) => _$this._previewURL = previewURL;

  int _previewWidth;
  int get previewWidth => _$this._previewWidth;
  set previewWidth(int previewWidth) => _$this._previewWidth = previewWidth;

  int _previewHeight;
  int get previewHeight => _$this._previewHeight;
  set previewHeight(int previewHeight) => _$this._previewHeight = previewHeight;

  String _webformatURL;
  String get webformatURL => _$this._webformatURL;
  set webformatURL(String webformatURL) => _$this._webformatURL = webformatURL;

  int _webformatWidth;
  int get webformatWidth => _$this._webformatWidth;
  set webformatWidth(int webformatWidth) =>
      _$this._webformatWidth = webformatWidth;

  int _webformatHeight;
  int get webformatHeight => _$this._webformatHeight;
  set webformatHeight(int webformatHeight) =>
      _$this._webformatHeight = webformatHeight;

  String _largeImageURL;
  String get largeImageURL => _$this._largeImageURL;
  set largeImageURL(String largeImageURL) =>
      _$this._largeImageURL = largeImageURL;

  int _imageWidth;
  int get imageWidth => _$this._imageWidth;
  set imageWidth(int imageWidth) => _$this._imageWidth = imageWidth;

  int _imageHeight;
  int get imageHeight => _$this._imageHeight;
  set imageHeight(int imageHeight) => _$this._imageHeight = imageHeight;

  int _views;
  int get views => _$this._views;
  set views(int views) => _$this._views = views;

  int _downloads;
  int get downloads => _$this._downloads;
  set downloads(int downloads) => _$this._downloads = downloads;

  int _favorites;
  int get favorites => _$this._favorites;
  set favorites(int favorites) => _$this._favorites = favorites;

  int _likes;
  int get likes => _$this._likes;
  set likes(int likes) => _$this._likes = likes;

  int _comments;
  int get comments => _$this._comments;
  set comments(int comments) => _$this._comments = comments;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  String _user;
  String get user => _$this._user;
  set user(String user) => _$this._user = user;

  String _userImageURL;
  String get userImageURL => _$this._userImageURL;
  set userImageURL(String userImageURL) => _$this._userImageURL = userImageURL;

  PhotoHitsBuilder();

  PhotoHitsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _pageURL = _$v.pageURL;
      _type = _$v.type;
      _tags = _$v.tags;
      _previewURL = _$v.previewURL;
      _previewWidth = _$v.previewWidth;
      _previewHeight = _$v.previewHeight;
      _webformatURL = _$v.webformatURL;
      _webformatWidth = _$v.webformatWidth;
      _webformatHeight = _$v.webformatHeight;
      _largeImageURL = _$v.largeImageURL;
      _imageWidth = _$v.imageWidth;
      _imageHeight = _$v.imageHeight;
      _views = _$v.views;
      _downloads = _$v.downloads;
      _favorites = _$v.favorites;
      _likes = _$v.likes;
      _comments = _$v.comments;
      _userId = _$v.userId;
      _user = _$v.user;
      _userImageURL = _$v.userImageURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhotoHits other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhotoHits;
  }

  @override
  void update(void Function(PhotoHitsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhotoHits build() {
    final _$result = _$v ??
        new _$PhotoHits._(
            id: id,
            pageURL: pageURL,
            type: type,
            tags: tags,
            previewURL: previewURL,
            previewWidth: previewWidth,
            previewHeight: previewHeight,
            webformatURL: webformatURL,
            webformatWidth: webformatWidth,
            webformatHeight: webformatHeight,
            largeImageURL: largeImageURL,
            imageWidth: imageWidth,
            imageHeight: imageHeight,
            views: views,
            downloads: downloads,
            favorites: favorites,
            likes: likes,
            comments: comments,
            userId: userId,
            user: user,
            userImageURL: userImageURL);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
