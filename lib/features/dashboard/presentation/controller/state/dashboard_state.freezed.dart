// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState()';
}


}

/// @nodoc
class $DashboardStateCopyWith<$Res>  {
$DashboardStateCopyWith(DashboardState _, $Res Function(DashboardState) __);
}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,TResult Function( _DashboardLoading value)?  dashboardLoading,TResult Function( _DashboardSuccess value)?  dashboardSuccess,TResult Function( _DashboardError value)?  dashboardError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _DashboardLoading() when dashboardLoading != null:
return dashboardLoading(_that);case _DashboardSuccess() when dashboardSuccess != null:
return dashboardSuccess(_that);case _DashboardError() when dashboardError != null:
return dashboardError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,required TResult Function( _DashboardLoading value)  dashboardLoading,required TResult Function( _DashboardSuccess value)  dashboardSuccess,required TResult Function( _DashboardError value)  dashboardError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Error():
return error(_that);case _DashboardLoading():
return dashboardLoading(_that);case _DashboardSuccess():
return dashboardSuccess(_that);case _DashboardError():
return dashboardError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,TResult? Function( _DashboardLoading value)?  dashboardLoading,TResult? Function( _DashboardSuccess value)?  dashboardSuccess,TResult? Function( _DashboardError value)?  dashboardError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _DashboardLoading() when dashboardLoading != null:
return dashboardLoading(_that);case _DashboardSuccess() when dashboardSuccess != null:
return dashboardSuccess(_that);case _DashboardError() when dashboardError != null:
return dashboardError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Trip? trip)?  success,TResult Function( CustomError message)?  error,TResult Function()?  dashboardLoading,TResult Function( Object data)?  dashboardSuccess,TResult Function( CustomError message)?  dashboardError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.trip);case _Error() when error != null:
return error(_that.message);case _DashboardLoading() when dashboardLoading != null:
return dashboardLoading();case _DashboardSuccess() when dashboardSuccess != null:
return dashboardSuccess(_that.data);case _DashboardError() when dashboardError != null:
return dashboardError(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Trip? trip)  success,required TResult Function( CustomError message)  error,required TResult Function()  dashboardLoading,required TResult Function( Object data)  dashboardSuccess,required TResult Function( CustomError message)  dashboardError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.trip);case _Error():
return error(_that.message);case _DashboardLoading():
return dashboardLoading();case _DashboardSuccess():
return dashboardSuccess(_that.data);case _DashboardError():
return dashboardError(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Trip? trip)?  success,TResult? Function( CustomError message)?  error,TResult? Function()?  dashboardLoading,TResult? Function( Object data)?  dashboardSuccess,TResult? Function( CustomError message)?  dashboardError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.trip);case _Error() when error != null:
return error(_that.message);case _DashboardLoading() when dashboardLoading != null:
return dashboardLoading();case _DashboardSuccess() when dashboardSuccess != null:
return dashboardSuccess(_that.data);case _DashboardError() when dashboardError != null:
return dashboardError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DashboardState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState.initial()';
}


}




/// @nodoc


class _Loading implements DashboardState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState.loading()';
}


}




/// @nodoc


class _Success implements DashboardState {
  const _Success(this.trip);
  

 final  Trip? trip;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.trip, trip) || other.trip == trip));
}


@override
int get hashCode => Object.hash(runtimeType,trip);

@override
String toString() {
  return 'DashboardState.success(trip: $trip)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 Trip? trip
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trip = freezed,}) {
  return _then(_Success(
freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as Trip?,
  ));
}


}

/// @nodoc


class _Error implements DashboardState {
  const _Error(this.message);
  

 final  CustomError message;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DashboardState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 CustomError message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as CustomError,
  ));
}


}

/// @nodoc


class _DashboardLoading implements DashboardState {
  const _DashboardLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState.dashboardLoading()';
}


}




/// @nodoc


class _DashboardSuccess implements DashboardState {
  const _DashboardSuccess(this.data);
  

 final  Object data;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardSuccessCopyWith<_DashboardSuccess> get copyWith => __$DashboardSuccessCopyWithImpl<_DashboardSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSuccess&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'DashboardState.dashboardSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class _$DashboardSuccessCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardSuccessCopyWith(_DashboardSuccess value, $Res Function(_DashboardSuccess) _then) = __$DashboardSuccessCopyWithImpl;
@useResult
$Res call({
 Object data
});




}
/// @nodoc
class __$DashboardSuccessCopyWithImpl<$Res>
    implements _$DashboardSuccessCopyWith<$Res> {
  __$DashboardSuccessCopyWithImpl(this._self, this._then);

  final _DashboardSuccess _self;
  final $Res Function(_DashboardSuccess) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_DashboardSuccess(
null == data ? _self.data : data ,
  ));
}


}

/// @nodoc


class _DashboardError implements DashboardState {
  const _DashboardError(this.message);
  

 final  CustomError message;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardErrorCopyWith<_DashboardError> get copyWith => __$DashboardErrorCopyWithImpl<_DashboardError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DashboardState.dashboardError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$DashboardErrorCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardErrorCopyWith(_DashboardError value, $Res Function(_DashboardError) _then) = __$DashboardErrorCopyWithImpl;
@useResult
$Res call({
 CustomError message
});




}
/// @nodoc
class __$DashboardErrorCopyWithImpl<$Res>
    implements _$DashboardErrorCopyWith<$Res> {
  __$DashboardErrorCopyWithImpl(this._self, this._then);

  final _DashboardError _self;
  final $Res Function(_DashboardError) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_DashboardError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as CustomError,
  ));
}


}

// dart format on
