import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:xullo/features/auth/data/data-source/auth_data_source.dart';
import 'package:xullo/features/auth/data/user/user.dart';
import 'package:xullo/features/auth/domain/entities/user.dart';

class AuthDataSourceRestImpl implements AuthDataSource {
  final Dio dio;
  final FlutterSecureStorage storage;
  AuthDataSourceRestImpl({required this.dio, required this.storage});

  @override
  Future<UserModel> getSignedInUser() async{
    try{
      final response = await dio.get('/me');
      return UserModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async{
    try{
      final response = await dio.post('/login', data: {
        'email': email,
        'password': password,
      });
      final token = response.data['data']['token']['token'];
      await storage.write(key: 'jwt', value: token);

    }catch(e){ rethrow;}
  }

  @override
  Future<void> signOut() async{
    try{
       await dio.get('/logout');
    }catch(e){ rethrow;}
  }

  @override
  Future<void> signUp(User user) async{
    try{
      final userModel = UserModel.fromEntity(user);
      final response = await dio.post('/signup', data: userModel.toJson());
      final token = response.data['data']['token']['token'];
      await storage.write(key: 'jwt', value: token);
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to register user');
      }
    }catch(e){ rethrow;}
  }

  @override
  Future<void> verifyPin(String pin) async{
    try{
      final response = await dio.post('/pin', data: {
        'pin': pin,
      });
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to verify pin');
      }
    }catch(e){ rethrow;}
  }

}