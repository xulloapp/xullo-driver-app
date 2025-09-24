// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogState()';
}


}

/// @nodoc
class $LogStateCopyWith<$Res>  {
$LogStateCopyWith(LogState _, $Res Function(LogState) __);
}


/// Adds pattern-matching-related methods to [LogState].
extension LogStatePatterns on LogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _CreateForm1 value)?  createForm1,TResult Function( _LoadingForm1 value)?  loadingForm1,TResult Function( _CreateForm2 value)?  createForm2,TResult Function( _LoadingForm2 value)?  loadingForm2,TResult Function( _CreateForm3 value)?  createForm3,TResult Function( _LoadingForm3 value)?  loadingForm3,TResult Function( _LoadingFullForm value)?  loadingFullForm,TResult Function( _CreateFullForm value)?  createFullForm,TResult Function( _UpdateFullForm value)?  updateFullForm,TResult Function( _ErrorFullForm value)?  errorFullForm,TResult Function( _Error value)?  error,TResult Function( _FinishLog value)?  finishLog,TResult Function( _LoadingLog value)?  loadingLog,TResult Function( _Comment value)?  comment,TResult Function( _LoadingComment value)?  loadingComment,TResult Function( _ErrorComment value)?  errorComment,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _CreateForm1() when createForm1 != null:
return createForm1(_that);case _LoadingForm1() when loadingForm1 != null:
return loadingForm1(_that);case _CreateForm2() when createForm2 != null:
return createForm2(_that);case _LoadingForm2() when loadingForm2 != null:
return loadingForm2(_that);case _CreateForm3() when createForm3 != null:
return createForm3(_that);case _LoadingForm3() when loadingForm3 != null:
return loadingForm3(_that);case _LoadingFullForm() when loadingFullForm != null:
return loadingFullForm(_that);case _CreateFullForm() when createFullForm != null:
return createFullForm(_that);case _UpdateFullForm() when updateFullForm != null:
return updateFullForm(_that);case _ErrorFullForm() when errorFullForm != null:
return errorFullForm(_that);case _Error() when error != null:
return error(_that);case _FinishLog() when finishLog != null:
return finishLog(_that);case _LoadingLog() when loadingLog != null:
return loadingLog(_that);case _Comment() when comment != null:
return comment(_that);case _LoadingComment() when loadingComment != null:
return loadingComment(_that);case _ErrorComment() when errorComment != null:
return errorComment(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _CreateForm1 value)  createForm1,required TResult Function( _LoadingForm1 value)  loadingForm1,required TResult Function( _CreateForm2 value)  createForm2,required TResult Function( _LoadingForm2 value)  loadingForm2,required TResult Function( _CreateForm3 value)  createForm3,required TResult Function( _LoadingForm3 value)  loadingForm3,required TResult Function( _LoadingFullForm value)  loadingFullForm,required TResult Function( _CreateFullForm value)  createFullForm,required TResult Function( _UpdateFullForm value)  updateFullForm,required TResult Function( _ErrorFullForm value)  errorFullForm,required TResult Function( _Error value)  error,required TResult Function( _FinishLog value)  finishLog,required TResult Function( _LoadingLog value)  loadingLog,required TResult Function( _Comment value)  comment,required TResult Function( _LoadingComment value)  loadingComment,required TResult Function( _ErrorComment value)  errorComment,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _CreateForm1():
return createForm1(_that);case _LoadingForm1():
return loadingForm1(_that);case _CreateForm2():
return createForm2(_that);case _LoadingForm2():
return loadingForm2(_that);case _CreateForm3():
return createForm3(_that);case _LoadingForm3():
return loadingForm3(_that);case _LoadingFullForm():
return loadingFullForm(_that);case _CreateFullForm():
return createFullForm(_that);case _UpdateFullForm():
return updateFullForm(_that);case _ErrorFullForm():
return errorFullForm(_that);case _Error():
return error(_that);case _FinishLog():
return finishLog(_that);case _LoadingLog():
return loadingLog(_that);case _Comment():
return comment(_that);case _LoadingComment():
return loadingComment(_that);case _ErrorComment():
return errorComment(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _CreateForm1 value)?  createForm1,TResult? Function( _LoadingForm1 value)?  loadingForm1,TResult? Function( _CreateForm2 value)?  createForm2,TResult? Function( _LoadingForm2 value)?  loadingForm2,TResult? Function( _CreateForm3 value)?  createForm3,TResult? Function( _LoadingForm3 value)?  loadingForm3,TResult? Function( _LoadingFullForm value)?  loadingFullForm,TResult? Function( _CreateFullForm value)?  createFullForm,TResult? Function( _UpdateFullForm value)?  updateFullForm,TResult? Function( _ErrorFullForm value)?  errorFullForm,TResult? Function( _Error value)?  error,TResult? Function( _FinishLog value)?  finishLog,TResult? Function( _LoadingLog value)?  loadingLog,TResult? Function( _Comment value)?  comment,TResult? Function( _LoadingComment value)?  loadingComment,TResult? Function( _ErrorComment value)?  errorComment,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _CreateForm1() when createForm1 != null:
return createForm1(_that);case _LoadingForm1() when loadingForm1 != null:
return loadingForm1(_that);case _CreateForm2() when createForm2 != null:
return createForm2(_that);case _LoadingForm2() when loadingForm2 != null:
return loadingForm2(_that);case _CreateForm3() when createForm3 != null:
return createForm3(_that);case _LoadingForm3() when loadingForm3 != null:
return loadingForm3(_that);case _LoadingFullForm() when loadingFullForm != null:
return loadingFullForm(_that);case _CreateFullForm() when createFullForm != null:
return createFullForm(_that);case _UpdateFullForm() when updateFullForm != null:
return updateFullForm(_that);case _ErrorFullForm() when errorFullForm != null:
return errorFullForm(_that);case _Error() when error != null:
return error(_that);case _FinishLog() when finishLog != null:
return finishLog(_that);case _LoadingLog() when loadingLog != null:
return loadingLog(_that);case _Comment() when comment != null:
return comment(_that);case _LoadingComment() when loadingComment != null:
return loadingComment(_that);case _ErrorComment() when errorComment != null:
return errorComment(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Trip data)?  success,TResult Function( Log data)?  createForm1,TResult Function()?  loadingForm1,TResult Function( Log data)?  createForm2,TResult Function()?  loadingForm2,TResult Function( Log data)?  createForm3,TResult Function()?  loadingForm3,TResult Function()?  loadingFullForm,TResult Function( Log data)?  createFullForm,TResult Function( Log data)?  updateFullForm,TResult Function( CustomError message)?  errorFullForm,TResult Function( CustomError message)?  error,TResult Function( Log data)?  finishLog,TResult Function()?  loadingLog,TResult Function( Trip data)?  comment,TResult Function()?  loadingComment,TResult Function( CustomError message)?  errorComment,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.data);case _CreateForm1() when createForm1 != null:
return createForm1(_that.data);case _LoadingForm1() when loadingForm1 != null:
return loadingForm1();case _CreateForm2() when createForm2 != null:
return createForm2(_that.data);case _LoadingForm2() when loadingForm2 != null:
return loadingForm2();case _CreateForm3() when createForm3 != null:
return createForm3(_that.data);case _LoadingForm3() when loadingForm3 != null:
return loadingForm3();case _LoadingFullForm() when loadingFullForm != null:
return loadingFullForm();case _CreateFullForm() when createFullForm != null:
return createFullForm(_that.data);case _UpdateFullForm() when updateFullForm != null:
return updateFullForm(_that.data);case _ErrorFullForm() when errorFullForm != null:
return errorFullForm(_that.message);case _Error() when error != null:
return error(_that.message);case _FinishLog() when finishLog != null:
return finishLog(_that.data);case _LoadingLog() when loadingLog != null:
return loadingLog();case _Comment() when comment != null:
return comment(_that.data);case _LoadingComment() when loadingComment != null:
return loadingComment();case _ErrorComment() when errorComment != null:
return errorComment(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Trip data)  success,required TResult Function( Log data)  createForm1,required TResult Function()  loadingForm1,required TResult Function( Log data)  createForm2,required TResult Function()  loadingForm2,required TResult Function( Log data)  createForm3,required TResult Function()  loadingForm3,required TResult Function()  loadingFullForm,required TResult Function( Log data)  createFullForm,required TResult Function( Log data)  updateFullForm,required TResult Function( CustomError message)  errorFullForm,required TResult Function( CustomError message)  error,required TResult Function( Log data)  finishLog,required TResult Function()  loadingLog,required TResult Function( Trip data)  comment,required TResult Function()  loadingComment,required TResult Function( CustomError message)  errorComment,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.data);case _CreateForm1():
return createForm1(_that.data);case _LoadingForm1():
return loadingForm1();case _CreateForm2():
return createForm2(_that.data);case _LoadingForm2():
return loadingForm2();case _CreateForm3():
return createForm3(_that.data);case _LoadingForm3():
return loadingForm3();case _LoadingFullForm():
return loadingFullForm();case _CreateFullForm():
return createFullForm(_that.data);case _UpdateFullForm():
return updateFullForm(_that.data);case _ErrorFullForm():
return errorFullForm(_that.message);case _Error():
return error(_that.message);case _FinishLog():
return finishLog(_that.data);case _LoadingLog():
return loadingLog();case _Comment():
return comment(_that.data);case _LoadingComment():
return loadingComment();case _ErrorComment():
return errorComment(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Trip data)?  success,TResult? Function( Log data)?  createForm1,TResult? Function()?  loadingForm1,TResult? Function( Log data)?  createForm2,TResult? Function()?  loadingForm2,TResult? Function( Log data)?  createForm3,TResult? Function()?  loadingForm3,TResult? Function()?  loadingFullForm,TResult? Function( Log data)?  createFullForm,TResult? Function( Log data)?  updateFullForm,TResult? Function( CustomError message)?  errorFullForm,TResult? Function( CustomError message)?  error,TResult? Function( Log data)?  finishLog,TResult? Function()?  loadingLog,TResult? Function( Trip data)?  comment,TResult? Function()?  loadingComment,TResult? Function( CustomError message)?  errorComment,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.data);case _CreateForm1() when createForm1 != null:
return createForm1(_that.data);case _LoadingForm1() when loadingForm1 != null:
return loadingForm1();case _CreateForm2() when createForm2 != null:
return createForm2(_that.data);case _LoadingForm2() when loadingForm2 != null:
return loadingForm2();case _CreateForm3() when createForm3 != null:
return createForm3(_that.data);case _LoadingForm3() when loadingForm3 != null:
return loadingForm3();case _LoadingFullForm() when loadingFullForm != null:
return loadingFullForm();case _CreateFullForm() when createFullForm != null:
return createFullForm(_that.data);case _UpdateFullForm() when updateFullForm != null:
return updateFullForm(_that.data);case _ErrorFullForm() when errorFullForm != null:
return errorFullForm(_that.message);case _Error() when error != null:
return error(_that.message);case _FinishLog() when finishLog != null:
return finishLog(_that.data);case _LoadingLog() when loadingLog != null:
return loadingLog();case _Comment() when comment != null:
return comment(_that.data);case _LoadingComment() when loadingComment != null:
return loadingComment();case _ErrorComment() when errorComment != null:
return errorComment(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LogState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogState.initial()';
}


}




/// @nodoc


class _Loading implements LogState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogState.loading()';
}


}




/// @nodoc


class _Success implements LogState {
  const _Success(this.data);
  

 final  Trip data;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'LogState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $LogStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 Trip data
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Success(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Trip,
  ));
}


}

/// @nodoc


class _CreateForm1 implements LogState {
  const _CreateForm1(this.data);
  

 final  Log data;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateForm1CopyWith<_CreateForm1> get copyWith => __$CreateForm1CopyWithImpl<_CreateForm1>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateForm1&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'LogState.createForm1(data: $data)';
}


}

/// @nodoc
abstract mixin class _$CreateForm1CopyWith<$Res> implements $LogStateCopyWith<$Res> {
  factory _$CreateForm1CopyWith(_CreateForm1 value, $Res Function(_CreateForm1) _then) = __$CreateForm1CopyWithImpl;
@useResult
$Res call({
 Log data
});




}
/// @nodoc
class __$CreateForm1CopyWithImpl<$Res>
    implements _$CreateForm1CopyWith<$Res> {
  __$CreateForm1CopyWithImpl(this._self, this._then);

  final _CreateForm1 _self;
  final $Res Function(_CreateForm1) _then;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_CreateForm1(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Log,
  ));
}


}

/// @nodoc


class _LoadingForm1 implements LogState {
  const _LoadingForm1();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingForm1);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogState.loadingForm1()';
}


}




/// @nodoc


class _CreateForm2 implements LogState {
  const _CreateForm2(this.data);
  

 final  Log data;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateForm2CopyWith<_CreateForm2> get copyWith => __$CreateForm2CopyWithImpl<_CreateForm2>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateForm2&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'LogState.createForm2(data: $data)';
}


}

/// @nodoc
abstract mixin class _$CreateForm2CopyWith<$Res> implements $LogStateCopyWith<$Res> {
  factory _$CreateForm2CopyWith(_CreateForm2 value, $Res Function(_CreateForm2) _then) = __$CreateForm2CopyWithImpl;
@useResult
$Res call({
 Log data
});




}
/// @nodoc
class __$CreateForm2CopyWithImpl<$Res>
    implements _$CreateForm2CopyWith<$Res> {
  __$CreateForm2CopyWithImpl(this._self, this._then);

  final _CreateForm2 _self;
  final $Res Function(_CreateForm2) _then;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_CreateForm2(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Log,
  ));
}


}

/// @nodoc


class _LoadingForm2 implements LogState {
  const _LoadingForm2();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingForm2);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogState.loadingForm2()';
}


}




/// @nodoc


class _CreateForm3 implements LogState {
  const _CreateForm3(this.data);
  

 final  Log data;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateForm3CopyWith<_CreateForm3> get copyWith => __$CreateForm3CopyWithImpl<_CreateForm3>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateForm3&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'LogState.createForm3(data: $data)';
}


}

/// @nodoc
abstract mixin class _$CreateForm3CopyWith<$Res> implements $LogStateCopyWith<$Res> {
  factory _$CreateForm3CopyWith(_CreateForm3 value, $Res Function(_CreateForm3) _then) = __$CreateForm3CopyWithImpl;
@useResult
$Res call({
 Log data
});




}
/// @nodoc
class __$CreateForm3CopyWithImpl<$Res>
    implements _$CreateForm3CopyWith<$Res> {
  __$CreateForm3CopyWithImpl(this._self, this._then);

  final _CreateForm3 _self;
  final $Res Function(_CreateForm3) _then;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_CreateForm3(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Log,
  ));
}


}

/// @nodoc


class _LoadingForm3 implements LogState {
  const _LoadingForm3();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingForm3);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogState.loadingForm3()';
}


}




/// @nodoc


class _LoadingFullForm implements LogState {
  const _LoadingFullForm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingFullForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogState.loadingFullForm()';
}


}




/// @nodoc


class _CreateFullForm implements LogState {
  const _CreateFullForm(this.data);
  

 final  Log data;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateFullFormCopyWith<_CreateFullForm> get copyWith => __$CreateFullFormCopyWithImpl<_CreateFullForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateFullForm&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'LogState.createFullForm(data: $data)';
}


}

/// @nodoc
abstract mixin class _$CreateFullFormCopyWith<$Res> implements $LogStateCopyWith<$Res> {
  factory _$CreateFullFormCopyWith(_CreateFullForm value, $Res Function(_CreateFullForm) _then) = __$CreateFullFormCopyWithImpl;
@useResult
$Res call({
 Log data
});




}
/// @nodoc
class __$CreateFullFormCopyWithImpl<$Res>
    implements _$CreateFullFormCopyWith<$Res> {
  __$CreateFullFormCopyWithImpl(this._self, this._then);

  final _CreateFullForm _self;
  final $Res Function(_CreateFullForm) _then;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_CreateFullForm(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Log,
  ));
}


}

/// @nodoc


class _UpdateFullForm implements LogState {
  const _UpdateFullForm(this.data);
  

 final  Log data;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateFullFormCopyWith<_UpdateFullForm> get copyWith => __$UpdateFullFormCopyWithImpl<_UpdateFullForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateFullForm&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'LogState.updateFullForm(data: $data)';
}


}

/// @nodoc
abstract mixin class _$UpdateFullFormCopyWith<$Res> implements $LogStateCopyWith<$Res> {
  factory _$UpdateFullFormCopyWith(_UpdateFullForm value, $Res Function(_UpdateFullForm) _then) = __$UpdateFullFormCopyWithImpl;
@useResult
$Res call({
 Log data
});




}
/// @nodoc
class __$UpdateFullFormCopyWithImpl<$Res>
    implements _$UpdateFullFormCopyWith<$Res> {
  __$UpdateFullFormCopyWithImpl(this._self, this._then);

  final _UpdateFullForm _self;
  final $Res Function(_UpdateFullForm) _then;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_UpdateFullForm(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Log,
  ));
}


}

/// @nodoc


class _ErrorFullForm implements LogState {
  const _ErrorFullForm(this.message);
  

 final  CustomError message;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorFullFormCopyWith<_ErrorFullForm> get copyWith => __$ErrorFullFormCopyWithImpl<_ErrorFullForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorFullForm&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LogState.errorFullForm(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorFullFormCopyWith<$Res> implements $LogStateCopyWith<$Res> {
  factory _$ErrorFullFormCopyWith(_ErrorFullForm value, $Res Function(_ErrorFullForm) _then) = __$ErrorFullFormCopyWithImpl;
@useResult
$Res call({
 CustomError message
});




}
/// @nodoc
class __$ErrorFullFormCopyWithImpl<$Res>
    implements _$ErrorFullFormCopyWith<$Res> {
  __$ErrorFullFormCopyWithImpl(this._self, this._then);

  final _ErrorFullForm _self;
  final $Res Function(_ErrorFullForm) _then;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ErrorFullForm(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as CustomError,
  ));
}


}

/// @nodoc


class _Error implements LogState {
  const _Error(this.message);
  

 final  CustomError message;

/// Create a copy of LogState
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
  return 'LogState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $LogStateCopyWith<$Res> {
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

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as CustomError,
  ));
}


}

/// @nodoc


class _FinishLog implements LogState {
  const _FinishLog(this.data);
  

 final  Log data;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinishLogCopyWith<_FinishLog> get copyWith => __$FinishLogCopyWithImpl<_FinishLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinishLog&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'LogState.finishLog(data: $data)';
}


}

/// @nodoc
abstract mixin class _$FinishLogCopyWith<$Res> implements $LogStateCopyWith<$Res> {
  factory _$FinishLogCopyWith(_FinishLog value, $Res Function(_FinishLog) _then) = __$FinishLogCopyWithImpl;
@useResult
$Res call({
 Log data
});




}
/// @nodoc
class __$FinishLogCopyWithImpl<$Res>
    implements _$FinishLogCopyWith<$Res> {
  __$FinishLogCopyWithImpl(this._self, this._then);

  final _FinishLog _self;
  final $Res Function(_FinishLog) _then;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_FinishLog(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Log,
  ));
}


}

/// @nodoc


class _LoadingLog implements LogState {
  const _LoadingLog();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingLog);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogState.loadingLog()';
}


}




/// @nodoc


class _Comment implements LogState {
  const _Comment(this.data);
  

 final  Trip data;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentCopyWith<_Comment> get copyWith => __$CommentCopyWithImpl<_Comment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Comment&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'LogState.comment(data: $data)';
}


}

/// @nodoc
abstract mixin class _$CommentCopyWith<$Res> implements $LogStateCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) _then) = __$CommentCopyWithImpl;
@useResult
$Res call({
 Trip data
});




}
/// @nodoc
class __$CommentCopyWithImpl<$Res>
    implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(this._self, this._then);

  final _Comment _self;
  final $Res Function(_Comment) _then;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Comment(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Trip,
  ));
}


}

/// @nodoc


class _LoadingComment implements LogState {
  const _LoadingComment();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingComment);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogState.loadingComment()';
}


}




/// @nodoc


class _ErrorComment implements LogState {
  const _ErrorComment(this.message);
  

 final  CustomError message;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCommentCopyWith<_ErrorComment> get copyWith => __$ErrorCommentCopyWithImpl<_ErrorComment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorComment&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LogState.errorComment(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCommentCopyWith<$Res> implements $LogStateCopyWith<$Res> {
  factory _$ErrorCommentCopyWith(_ErrorComment value, $Res Function(_ErrorComment) _then) = __$ErrorCommentCopyWithImpl;
@useResult
$Res call({
 CustomError message
});




}
/// @nodoc
class __$ErrorCommentCopyWithImpl<$Res>
    implements _$ErrorCommentCopyWith<$Res> {
  __$ErrorCommentCopyWithImpl(this._self, this._then);

  final _ErrorComment _self;
  final $Res Function(_ErrorComment) _then;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ErrorComment(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as CustomError,
  ));
}


}

// dart format on
