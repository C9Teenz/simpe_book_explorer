import 'package:flutter/material.dart';
import 'core/di/injection_container.dart' as di;
import 'features/book/presentation/ui/book_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initInjectionContainer();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookListPage(),
    );
  }
}
