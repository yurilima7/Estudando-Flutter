import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:tests/models/draw_line.dart';
import 'package:tests/models/signature.dart';
import 'package:tests/widgets/horizontal_line.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  late List<DrawLine> _lines;
  late GlobalKey _renderObjectKey;

  void _createLine(List<Offset> point) {
    _lines.add(DrawLine(points: point));
  }

  void _updateLine(Offset point) {
    _lines.last.points.add(point);
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      _createLine([details.localPosition]);
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _updateLine(details.localPosition);
    });
  }

  Future<void> _saveSignature() async {
    final nav = Navigator.of(context);
    final boundary = _renderObjectKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;

    if (boundary != null) {
      final image = await boundary.toImage(
        pixelRatio: 3,
      );

      final byteData = await image.toByteData(format: ImageByteFormat.png);

      if (byteData != null) {
        final pngBytes = byteData.buffer.asUint8List();
        final bs64 = base64Encode(pngBytes);
        debugPrint(bs64.length.toString());
        nav.pop(pngBytes);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _lines = [];
    _renderObjectKey = GlobalKey();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste Assinatura'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _lines.clear();
              });
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _saveSignature,
        child: const Icon(
          Icons.save,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),

        child: Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            alignment: Alignment.center,
              
            children: [
              GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
                
                child: RepaintBoundary(
                  key: _renderObjectKey,
              
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    
                    child: CustomPaint(
                      painter: SignatureClass(lines: _lines),
                    ),
                  ),
                ),
              ),
              
              const HorizontalLine(),
            ],
          ),
        ),
      ),
    );
  }
}
