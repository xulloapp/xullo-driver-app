import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/auth/presentation/controller/auth/auth_provider.dart';
final logoutTriggerProvider = StateProvider<bool>((ref) => false);


final dioProvider = Provider<Dio>((ref) {
  final storage = const FlutterSecureStorage();
  bool hasTriggeredLogout = false;
  int _toastPosition = 0;


  final dio = Dio(BaseOptions(
    baseUrl: kReleaseMode
        ? 'https://api.xullo.co.nz' // Release
        : 'http://192.168.29.214:3333', // Debug
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {'Content-Type': 'application/json'},
  ));

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final token = await storage.read(key: 'jwt');
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      print('➡️ [REQUEST] ${options.method} ${options.uri}');
      if (options.data != null) print('📦 [BODY] ${options.data}');
      handler.next(options);
    },
    onResponse: (response, handler) {
      final data = response.data;
      print('✅ [RESPONSE] ${response.statusCode} ${response.data}');
      if (data is Map<String, dynamic> && data['message'] is String && data['message'].isNotEmpty) {
        BotToast.showText(
          text: data['message'],
          textStyle: const TextStyle(color: Colors.white),
          contentColor: Colors.green,
          align: Alignment(0, 0.85 - (_toastPosition * 0.1)),
          duration: const Duration(seconds: 1),
          onlyOne: false
        );
        _toastPosition++;
        Future.delayed(const Duration(seconds: 1), () {
          _toastPosition = (_toastPosition > 0) ? _toastPosition - 1 : 0;
        });
      }
      if(response.statusCode == 200 || response.statusCode == 201){
        hasTriggeredLogout = false;
      }
      handler.next(response);
    },
    onError: (e, handler) async {
      print('❌ [ERROR] ${e.response?.statusCode} ${e.message}');
      print('Data: ${e.response?.data}');

      if (e.response?.statusCode == 401 && !hasTriggeredLogout) {
        hasTriggeredLogout = true;

        await storage.delete(key: 'jwt');
        await FlutterSecureStorage().write(key: 'isLoggedIn', value: 'false');

        // defer logout to avoid triggering Dio again in the same tick
          ref.watch(authNotifierProvider.notifier).signOut();
      }

      handler.next(e);
    },
  ));

  return dio;
});
