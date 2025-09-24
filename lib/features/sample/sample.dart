import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xullo/core/configs/router-configs/router_name.dart';

class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){ context.go(RouteNames.dashboard);}, icon: Icon(Icons.arrow_back)),),
      body: Center(
        child: Text('Sample Screen'),
      ),
    );
  }
}
