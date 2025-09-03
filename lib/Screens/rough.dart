import 'package:flutter/material.dart';

class ReceiptCut extends StatelessWidget {
  const ReceiptCut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: TicketTriangleBorder(cutSize: 20), // 👈 triangular cuts
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Transaction Completed",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // dotted line
              LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      (constraints.maxWidth / 10).floor(),
                          (index) => const SizedBox(
                        width: 5,
                        height: 1,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black54),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
              const Text("Receipt Content Goes Here"),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketTriangleBorder extends ShapeBorder {
  final double cutSize;

  TicketTriangleBorder({this.cutSize = 16});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();

    // Start from top-left
    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.right, rect.top);

    // Right side with triangle cut (>)
    path.lineTo(rect.right, rect.center.dy - cutSize);
    path.lineTo(rect.right - cutSize, rect.center.dy); // inward cut
    path.lineTo(rect.right, rect.center.dy + cutSize);

    path.lineTo(rect.right, rect.bottom);
    path.lineTo(rect.left, rect.bottom);

    // Left side with triangle cut (<)
    path.lineTo(rect.left, rect.center.dy + cutSize);
    path.lineTo(rect.left + cutSize, rect.center.dy); // inward cut
    path.lineTo(rect.left, rect.center.dy - cutSize);

    path.lineTo(rect.left, rect.top);

    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }
}
