import 'package:flutter/material.dart';
import 'package:horology/built_in_case.dart';
import 'package:horology/main_case.dart';
import 'package:horology/material_case.dart';

ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const HorologyPlaygroundApp());
}

class HorologyPlaygroundApp extends StatelessWidget {
  const HorologyPlaygroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeMode,
      builder: (context, themeMode, _) => MaterialApp(
        title: 'Horology Playground',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: themeMode,
        home: const HorologyPlaygroundPage(),
      ),
    );
  }
}

class HorologyPlaygroundPage extends StatefulWidget {
  const HorologyPlaygroundPage({
    super.key,
  });

  @override
  State<HorologyPlaygroundPage> createState() => _HorologyPlaygroundPageState();
}

class _HorologyPlaygroundPageState extends State<HorologyPlaygroundPage> {
  ValueNotifier navigationBarIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horology'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4_sharp),
            onPressed: () {
              themeMode.value = themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
            },
          ),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: navigationBarIndex,
        builder: (context, pageIndex, _) => NavigationBar(
          selectedIndex: pageIndex,
          onDestinationSelected: (index) => navigationBarIndex.value = index,
          destinations: [
            NavigationDestination(
              icon: const Text('😎'),
              label: 'Main',
            ),
            NavigationDestination(
              icon: const Text('🥱'),
              label: 'Built-in',
            ),
            NavigationDestination(
              icon: const Text('🪨'), 
              label: 'Material'
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: ValueListenableBuilder(
          valueListenable: navigationBarIndex,
          builder: (context, pageIndex, _) {
            if (pageIndex == 0) return MainCase();
            if (pageIndex == 1) return BuiltInCase();
            if (pageIndex == 2) return MaterialCase();
            
            throw Exception('Invalid page index');
          }
        ),
      ),
    );
  }
}