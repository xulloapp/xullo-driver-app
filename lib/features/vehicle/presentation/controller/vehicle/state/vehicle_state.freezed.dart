// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VehicleState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleState()';
}


}

/// @nodoc
class $VehicleStateCopyWith<$Res>  {
$VehicleStateCopyWith(VehicleState _, $Res Function(VehicleState) __);
}


/// Adds pattern-matching-related methods to [VehicleState].
extension VehicleStatePatterns on VehicleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _LoadingForm value)?  loadingForm,TResult Function( _Success value)?  success,TResult Function( _Create value)?  create,TResult Function( _Update value)?  update,TResult Function( _Delete value)?  delete,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _LoadingForm() when loadingForm != null:
return loadingForm(_that);case _Success() when success != null:
return success(_that);case _Create() when create != null:
return create(_that);case _Update() when update != null:
return update(_that);case _Delete() when delete != null:
return delete(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _LoadingForm value)  loadingForm,required TResult Function( _Success value)  success,required TResult Function( _Create value)  create,required TResult Function( _Update value)  update,required TResult Function( _Delete value)  delete,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _LoadingForm():
return loadingForm(_that);case _Success():
return success(_that);case _Create():
return create(_that);case _Update():
return update(_that);case _Delete():
return delete(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _LoadingForm value)?  loadingForm,TResult? Function( _Success value)?  success,TResult? Function( _Create value)?  create,TResult? Function( _Update value)?  update,TResult? Function( _Delete value)?  delete,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _LoadingForm() when loadingForm != null:
return loadingForm(_that);case _Success() when success != null:
return success(_that);case _Create() when create != null:
return create(_that);case _Update() when update != null:
return update(_that);case _Delete() when delete != null:
return delete(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  loadingForm,TResult Function( List<Vehicle> vehicles)?  success,TResult Function( Vehicle company)?  create,TResult Function( Vehicle company)?  update,TResult Function( Vehicle company)?  delete,TResult Function( CustomError message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LoadingForm() when loadingForm != null:
return loadingForm();case _Success() when success != null:
return success(_that.vehicles);case _Create() when create != null:
return create(_that.company);case _Update() when update != null:
return update(_that.company);case _Delete() when delete != null:
return delete(_that.company);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  loadingForm,required TResult Function( List<Vehicle> vehicles)  success,required TResult Function( Vehicle company)  create,required TResult Function( Vehicle company)  update,required TResult Function( Vehicle company)  delete,required TResult Function( CustomError message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _LoadingForm():
return loadingForm();case _Success():
return success(_that.vehicles);case _Create():
return create(_that.company);case _Update():
return update(_that.company);case _Delete():
return delete(_that.company);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  loadingForm,TResult? Function( List<Vehicle> vehicles)?  success,TResult? Function( Vehicle company)?  create,TResult? Function( Vehicle company)?  update,TResult? Function( Vehicle company)?  delete,TResult? Function( CustomError message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LoadingForm() when loadingForm != null:
return loadingForm();case _Success() when success != null:
return success(_that.vehicles);case _Create() when create != null:
return create(_that.company);case _Update() when update != null:
return update(_that.company);case _Delete() when delete != null:
return delete(_that.company);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements VehicleState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleState.initial()';
}


}




/// @nodoc


class _Loading implements VehicleState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleState.loading()';
}


}




/// @nodoc


class _LoadingForm implements VehicleState {
  const _LoadingForm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleState.loadingForm()';
}


}




/// @nodoc


class _Success implements VehicleState {
  const _Success(final  List<Vehicle> vehicles): _vehicles = vehicles;
  

 final  List<Vehicle> _vehicles;
 List<Vehicle> get vehicles {
  if (_vehicles is EqualUnmodifiableListView) return _vehicles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vehicles);
}


/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._vehicles, _vehicles));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_vehicles));

@override
String toString() {
  return 'VehicleState.success(vehicles: $vehicles)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $VehicleStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<Vehicle> vehicles
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vehicles = null,}) {
  return _then(_Success(
null == vehicles ? _self._vehicles : vehicles // ignore: cast_nullable_to_non_nullable
as List<Vehicle>,
  ));
}


}

/// @nodoc


class _Create implements VehicleState {
  const _Create(this.company);
  

 final  Vehicle company;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.company, company) || other.company == company));
}


@override
int get hashCode => Object.hash(runtimeType,company);

@override
String toString() {
  return 'VehicleState.create(Violation: $company)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $VehicleStateCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 Vehicle company
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? company = null,}) {
  return _then(_Create(
null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Vehicle,
  ));
}


}

/// @nodoc


class _Update implements VehicleState {
  const _Update(this.company);
  

 final  Vehicle company;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.company, company) || other.company == company));
}


@override
int get hashCode => Object.hash(runtimeType,company);

@override
String toString() {
  return 'VehicleState.update(Violation: $company)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $VehicleStateCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 Vehicle company
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? company = null,}) {
  return _then(_Update(
null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Vehicle,
  ));
}


}

/// @nodoc


class _Delete implements VehicleState {
  const _Delete(this.company);
  

 final  Vehicle company;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCopyWith<_Delete> get copyWith => __$DeleteCopyWithImpl<_Delete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delete&&(identical(other.company, company) || other.company == company));
}


@override
int get hashCode => Object.hash(runtimeType,company);

@override
String toString() {
  return 'VehicleState.delete(Violation: $company)';
}


}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res> implements $VehicleStateCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) = __$DeleteCopyWithImpl;
@useResult
$Res call({
 Vehicle company
});




}
/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? company = null,}) {
  return _then(_Delete(
null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Vehicle,
  ));
}


}

/// @nodoc


class _Error implements VehicleState {
  const _Error(this.message);
  

 final  CustomError message;

/// Create a copy of VehicleState
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
  return 'VehicleState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $VehicleStateCopyWith<$Res> {
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

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as CustomError,
  ));
}


}

/// @nodoc
mixin _$VehicleTypeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleTypeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleTypeState()';
}


}

/// @nodoc
class $VehicleTypeStateCopyWith<$Res>  {
$VehicleTypeStateCopyWith(VehicleTypeState _, $Res Function(VehicleTypeState) __);
}


/// Adds pattern-matching-related methods to [VehicleTypeState].
extension VehicleTypeStatePatterns on VehicleTypeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _VehicleTypeInitial value)?  initial,TResult Function( _VehicleTypeLoading value)?  loading,TResult Function( _VehicleTypeSuccess value)?  success,TResult Function( _VehicleTypeError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleTypeInitial() when initial != null:
return initial(_that);case _VehicleTypeLoading() when loading != null:
return loading(_that);case _VehicleTypeSuccess() when success != null:
return success(_that);case _VehicleTypeError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _VehicleTypeInitial value)  initial,required TResult Function( _VehicleTypeLoading value)  loading,required TResult Function( _VehicleTypeSuccess value)  success,required TResult Function( _VehicleTypeError value)  error,}){
final _that = this;
switch (_that) {
case _VehicleTypeInitial():
return initial(_that);case _VehicleTypeLoading():
return loading(_that);case _VehicleTypeSuccess():
return success(_that);case _VehicleTypeError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _VehicleTypeInitial value)?  initial,TResult? Function( _VehicleTypeLoading value)?  loading,TResult? Function( _VehicleTypeSuccess value)?  success,TResult? Function( _VehicleTypeError value)?  error,}){
final _that = this;
switch (_that) {
case _VehicleTypeInitial() when initial != null:
return initial(_that);case _VehicleTypeLoading() when loading != null:
return loading(_that);case _VehicleTypeSuccess() when success != null:
return success(_that);case _VehicleTypeError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<VehicleType> types)?  success,TResult Function( CustomError message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleTypeInitial() when initial != null:
return initial();case _VehicleTypeLoading() when loading != null:
return loading();case _VehicleTypeSuccess() when success != null:
return success(_that.types);case _VehicleTypeError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<VehicleType> types)  success,required TResult Function( CustomError message)  error,}) {final _that = this;
switch (_that) {
case _VehicleTypeInitial():
return initial();case _VehicleTypeLoading():
return loading();case _VehicleTypeSuccess():
return success(_that.types);case _VehicleTypeError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<VehicleType> types)?  success,TResult? Function( CustomError message)?  error,}) {final _that = this;
switch (_that) {
case _VehicleTypeInitial() when initial != null:
return initial();case _VehicleTypeLoading() when loading != null:
return loading();case _VehicleTypeSuccess() when success != null:
return success(_that.types);case _VehicleTypeError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _VehicleTypeInitial implements VehicleTypeState {
  const _VehicleTypeInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleTypeInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleTypeState.initial()';
}


}




/// @nodoc


class _VehicleTypeLoading implements VehicleTypeState {
  const _VehicleTypeLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleTypeLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleTypeState.loading()';
}


}




/// @nodoc


class _VehicleTypeSuccess implements VehicleTypeState {
  const _VehicleTypeSuccess(final  List<VehicleType> types): _types = types;
  

 final  List<VehicleType> _types;
 List<VehicleType> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}


/// Create a copy of VehicleTypeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleTypeSuccessCopyWith<_VehicleTypeSuccess> get copyWith => __$VehicleTypeSuccessCopyWithImpl<_VehicleTypeSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleTypeSuccess&&const DeepCollectionEquality().equals(other._types, _types));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_types));

@override
String toString() {
  return 'VehicleTypeState.success(types: $types)';
}


}

/// @nodoc
abstract mixin class _$VehicleTypeSuccessCopyWith<$Res> implements $VehicleTypeStateCopyWith<$Res> {
  factory _$VehicleTypeSuccessCopyWith(_VehicleTypeSuccess value, $Res Function(_VehicleTypeSuccess) _then) = __$VehicleTypeSuccessCopyWithImpl;
@useResult
$Res call({
 List<VehicleType> types
});




}
/// @nodoc
class __$VehicleTypeSuccessCopyWithImpl<$Res>
    implements _$VehicleTypeSuccessCopyWith<$Res> {
  __$VehicleTypeSuccessCopyWithImpl(this._self, this._then);

  final _VehicleTypeSuccess _self;
  final $Res Function(_VehicleTypeSuccess) _then;

/// Create a copy of VehicleTypeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? types = null,}) {
  return _then(_VehicleTypeSuccess(
null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<VehicleType>,
  ));
}


}

/// @nodoc


class _VehicleTypeError implements VehicleTypeState {
  const _VehicleTypeError(this.message);
  

 final  CustomError message;

/// Create a copy of VehicleTypeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleTypeErrorCopyWith<_VehicleTypeError> get copyWith => __$VehicleTypeErrorCopyWithImpl<_VehicleTypeError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleTypeError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VehicleTypeState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$VehicleTypeErrorCopyWith<$Res> implements $VehicleTypeStateCopyWith<$Res> {
  factory _$VehicleTypeErrorCopyWith(_VehicleTypeError value, $Res Function(_VehicleTypeError) _then) = __$VehicleTypeErrorCopyWithImpl;
@useResult
$Res call({
 CustomError message
});




}
/// @nodoc
class __$VehicleTypeErrorCopyWithImpl<$Res>
    implements _$VehicleTypeErrorCopyWith<$Res> {
  __$VehicleTypeErrorCopyWithImpl(this._self, this._then);

  final _VehicleTypeError _self;
  final $Res Function(_VehicleTypeError) _then;

/// Create a copy of VehicleTypeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_VehicleTypeError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as CustomError,
  ));
}


}

// dart format on
