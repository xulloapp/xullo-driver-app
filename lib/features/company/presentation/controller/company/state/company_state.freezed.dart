// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompanyState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyState()';
}


}

/// @nodoc
class $CompanyStateCopyWith<$Res>  {
$CompanyStateCopyWith(CompanyState _, $Res Function(CompanyState) __);
}


/// Adds pattern-matching-related methods to [CompanyState].
extension CompanyStatePatterns on CompanyState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  loadingForm,TResult Function( List<Company> companies)?  success,TResult Function( Company company)?  create,TResult Function( Company company)?  update,TResult Function( Company company)?  delete,TResult Function( CustomError message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LoadingForm() when loadingForm != null:
return loadingForm();case _Success() when success != null:
return success(_that.companies);case _Create() when create != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  loadingForm,required TResult Function( List<Company> companies)  success,required TResult Function( Company company)  create,required TResult Function( Company company)  update,required TResult Function( Company company)  delete,required TResult Function( CustomError message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _LoadingForm():
return loadingForm();case _Success():
return success(_that.companies);case _Create():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  loadingForm,TResult? Function( List<Company> companies)?  success,TResult? Function( Company company)?  create,TResult? Function( Company company)?  update,TResult? Function( Company company)?  delete,TResult? Function( CustomError message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LoadingForm() when loadingForm != null:
return loadingForm();case _Success() when success != null:
return success(_that.companies);case _Create() when create != null:
return create(_that.company);case _Update() when update != null:
return update(_that.company);case _Delete() when delete != null:
return delete(_that.company);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CompanyState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyState.initial()';
}


}




/// @nodoc


class _Loading implements CompanyState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyState.loading()';
}


}




/// @nodoc


class _LoadingForm implements CompanyState {
  const _LoadingForm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyState.loadingForm()';
}


}




/// @nodoc


class _Success implements CompanyState {
  const _Success(final  List<Company> companies): _companies = companies;
  

 final  List<Company> _companies;
 List<Company> get companies {
  if (_companies is EqualUnmodifiableListView) return _companies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_companies);
}


/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._companies, _companies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_companies));

@override
String toString() {
  return 'CompanyState.success(companies: $companies)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $CompanyStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<Company> companies
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companies = null,}) {
  return _then(_Success(
null == companies ? _self._companies : companies // ignore: cast_nullable_to_non_nullable
as List<Company>,
  ));
}


}

/// @nodoc


class _Create implements CompanyState {
  const _Create(this.company);
  

 final  Company company;

/// Create a copy of CompanyState
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
  return 'CompanyState.create(Violation: $company)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $CompanyStateCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 Company company
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? company = null,}) {
  return _then(_Create(
null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Company,
  ));
}


}

/// @nodoc


class _Update implements CompanyState {
  const _Update(this.company);
  

 final  Company company;

/// Create a copy of CompanyState
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
  return 'CompanyState.update(Violation: $company)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $CompanyStateCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 Company company
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? company = null,}) {
  return _then(_Update(
null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Company,
  ));
}


}

/// @nodoc


class _Delete implements CompanyState {
  const _Delete(this.company);
  

 final  Company company;

/// Create a copy of CompanyState
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
  return 'CompanyState.delete(Violation: $company)';
}


}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res> implements $CompanyStateCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) = __$DeleteCopyWithImpl;
@useResult
$Res call({
 Company company
});




}
/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? company = null,}) {
  return _then(_Delete(
null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Company,
  ));
}


}

/// @nodoc


class _Error implements CompanyState {
  const _Error(this.message);
  

 final  CustomError message;

/// Create a copy of CompanyState
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
  return 'CompanyState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CompanyStateCopyWith<$Res> {
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

/// Create a copy of CompanyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as CustomError,
  ));
}


}

// dart format on
