import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'config/graphql_config.dart';
import 'controllers/character_controller.dart';
import 'screens/home_screen.dart';

void main() async {
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CharacterController());
    return GraphQLProvider(
      client: GraphQLConfig.clientToQuery(),
      child: GetMaterialApp(
        title: 'Star Wars GraphQL',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
