import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

class DraggableItem {
  final IconData iconData;
  final Color colorData;
  Offset position;

  DraggableItem(this.iconData, this.position, this.colorData);
}

class DraggableScreen extends StatefulWidget {
  const DraggableScreen({super.key});

  @override
  State<DraggableScreen> createState() => _DraggableScreenState();
}

class _DraggableScreenState extends State<DraggableScreen> {
  int acceptedData = 0;
  List<DraggableItem> droppedPositions = []; // Store final dropped positions
  final GlobalKey globalKey = GlobalKey();

  Future<Uint8List> img() async {
    final RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    ui.Image? image = await boundary.toImage();
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    return pngBytes;
  }

  Widget containerForm(Color color, IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(icon),
    );
  }

  void alert(Uint8List image) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Image'),
        content: SingleChildScrollView(
          child: Image.memory(image),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable teste'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              DragTarget<int>(
                builder: (context, accepted, rejected) {
                  return RepaintBoundary(
                    key: globalKey,
      
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/Wal.png',
                          width: MediaQuery.of(context).size.width,
                        ),
      
                        ...droppedPositions
                            .map((item) => Positioned(
                                  left: item.position.dx - 20,
                                  top: item.position.dy - 100,
      
                                  child: containerForm(
                                    item.colorData,  
                                    item.iconData,
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  );
                },
                
                onWillAccept: (data) => true,
      
                onAccept: (data) {
                  setState(() {
                    acceptedData += data;
                  });
                },
      
                onLeave: (data) {},
              ),
      
              const SizedBox(height: 10),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
                children: [
                  Draggable<int>(
                    data: 1,

                    feedback: containerForm(
                      Colors.lightGreenAccent,  
                      Icons.directions_run,
                    ),

                    child: containerForm(
                      Colors.lightGreenAccent,  
                      Icons.directions_run,
                    ),

                    onDragEnd: (details) {
                      setState(() {
                        // Add dropped position to the list on drag end
                        // droppedPositions.add(details.offset);
                        droppedPositions.add(
                          DraggableItem(
                            Icons.directions_run,
                            details.offset,
                            Colors.lightGreenAccent
                          ),
                        );
                      });
                    },
                  ),
      
                  Draggable<int>(
                    data: 2,
      
                    feedback: containerForm(
                      Colors.lightBlueAccent,  
                      Icons.dark_mode,
                    ),
  
                    child: containerForm(
                      Colors.lightBlueAccent,  
                      Icons.dark_mode,
                    ),

                    onDragEnd: (details) {
                      setState(() {
                        // Add dropped position to the list on drag end
                        // droppedPositions.add(details.offset);
                        droppedPositions.add(
                          DraggableItem(
                            Icons.dark_mode,
                            details.offset,
                            Colors.lightBlueAccent
                          ),
                        );
                      });
                    },
                  ),
      
                  Draggable<int>(
                    data: 3,

                    feedback: containerForm(
                      Colors.limeAccent,  
                      Icons.add_circle_outline_outlined,
                    ),

                    child: containerForm(
                      Colors.limeAccent,  
                      Icons.add_circle_outline_outlined,
                    ),

                    onDragEnd: (details) {
                      setState(() {
                        // Add dropped position to the list on drag end
                        // droppedPositions.add(details.offset);
                        droppedPositions.add(
                          DraggableItem(
                            Icons.add_circle_outline_outlined,
                            details.offset,
                            Colors.limeAccent
                          ),
                        );
                      });
                    },
                  ),
      
                  Draggable<int>(
                    data: 4,

                    feedback: containerForm(
                      Colors.redAccent,  
                      Icons.star_rounded,
                    ),

                    child: containerForm(
                      Colors.redAccent,  
                      Icons.star_rounded,
                    ),

                    onDragEnd: (details) {
                      setState(() {
                        // Add dropped position to the list on drag end
                        // droppedPositions.add(details.offset);
                        droppedPositions.add(
                          DraggableItem(
                            Icons.star_rounded,
                            details.offset,
                            Colors.redAccent,
                          ),
                        );
                      });
                    },
                  ),
                ],
              ),
      
              const SizedBox(height: 5),
      
              Text('Value is updated to: $acceptedData'),
      
              const SizedBox(height: 5),
      
              ElevatedButton(
                onPressed: () async {
                  final image = await img();
                  alert(image);
                },
                child: const Text('Ver Imagem'),
              ),
      
              const SizedBox(height: 5),
      
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (droppedPositions.isNotEmpty) {
                      droppedPositions.removeLast();
                    }
                  });
                },
                child: const Text('Desfazer última marcação'),
              ),
      
              const SizedBox(height: 5),
      
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (droppedPositions.isNotEmpty) {
                      droppedPositions.clear();
                    }
                  });
                },
                child: const Text('Desfazer todas as marcações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
