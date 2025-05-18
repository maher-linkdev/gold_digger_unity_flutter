
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  UnityWidgetController? _unityWidgetController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            UnityWidget(
              onUnityCreated: onUnityCreated,
              onUnitySceneLoaded: onUnitySceneLoaded,
              onUnityMessage: onUnityMessage,
            ),

          ],
        ),
      ),
    );
  }


  void onUnityMessage(message) {
    debugPrint('Received message from unity: ${message.toString()}');
  }

  void onUnitySceneLoaded(SceneLoaded? scene) {
    if (scene != null) {
      debugPrint('Received scene loaded from unity: ${scene.name}');
      debugPrint('Received scene loaded from unity buildIndex: ${scene.buildIndex}');
    } else {
      debugPrint('Received scene loaded from unity: null');
    }
  }

  void onUnityCreated(controller) {
    controller.resume();
    _unityWidgetController = controller;
  }

}