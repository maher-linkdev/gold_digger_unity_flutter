
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UnityWidgetController? _unityWidgetController;
  double _jumpForce = 5.0;

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
            if(_unityWidgetController !=null)
            Slider(
              value: _jumpForce,
              min: 1.0,
              max: 20.0,
              divisions: 20,
              label: _jumpForce.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _jumpForce = value;
                });
                updatePlayerSpeed(_jumpForce);
              },
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

  void updatePlayerSpeed(double speed){
      Map<String, dynamic> payload = {
        "speed": 3,
        "name": "player",
        "health": 100,
        "position": {"x": 10, "y": 5, "z": 0},
        "abilities": ["jump", "run", "dash"],
        "isActive": true,
      };
      _unityWidgetController?.postMessage(
        'Cube', //GAME OBJECT IN UNITY
        'SetMoveSpeed', //METHOD DEFINED IN UNITY
        payload,
      );

  }

  void onUnityCreated(controller) {
    controller.resume();
    _unityWidgetController = controller;
  }

}