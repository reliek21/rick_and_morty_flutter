import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_feching/presentation/screens/home_page.dart';
import 'package:flutter_feching/presentation/providers/character_provider.dart';
import 'package:flutter_feching/infrastructure/datasources/character_data_source_impl.dart';
import 'package:flutter_feching/infrastructure/repositories/character_repository_impl.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CharacterProvider(CharacterRepositoryImp(CharacterDataSourceImpl())),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      )
    );
  }
}