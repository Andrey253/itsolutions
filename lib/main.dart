import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:notifications/widgets/main_body.dart';
import 'package:notifications/widgets/menu_button.dart';

/// Entrypoint of the application.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

/// Application itself.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'IT Solutions Management International Pte. Ltd.', home: const HomePage());
  }
}

/// [Widget] displaying the home page consisting of an image the the buttons.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// If installed FullScreen [isFullScreen] is true
  bool isFullScreen = false;

  /// Url image
  String imageUrl = '';
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBody(
          onDoubleTap: onDoubleTapOnImage,
          imageUrl: imageUrl,
          setUrlImage: setUrlImage,
          textController: textController),

      /// Mode selection menu button.
      floatingActionButton: MenuButton(
        setFullScreenFunction: setFullScreen,
        exitFullscreenFunction: exitFullscreen,
      ),
    );
  }

  /// Mode change Fullscreen/exitFullscreen
  void onDoubleTapOnImage() async {
    if (kIsWeb) {
      isFullScreen ? exitFullscreen() : setFullScreen();
    }
  }

  void setUrlImage() {
    setState(() => imageUrl = textController.text);
  }

  void setFullScreen() {
    if (!kIsWeb) return;
    isFullScreen = true;
    document.documentElement?.requestFullscreen();
  }

  exitFullscreen() {
    if (!kIsWeb) return;
    isFullScreen = false;
    document.exitFullscreen();
  }
}
