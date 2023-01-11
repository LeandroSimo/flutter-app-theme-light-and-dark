import 'package:app_dual_theme/app/utils/Theme/theme_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class WireDraw extends StatefulWidget {
  final Offset initialPosition;
  final Offset toOffset;

  const WireDraw(
      {super.key, required this.initialPosition, required this.toOffset});

  @override
  State<WireDraw> createState() => _WireDrawState();
}

class _WireDrawState extends State<WireDraw> {
  @override
  Widget build(BuildContext context) {
    ThemeAppProvider themeAppProvider = Provider.of<ThemeAppProvider>(context);

    return CustomPaint(
      painter: WirePainter(
        initialPosition: widget.initialPosition,
        toOffset: widget.toOffset,
        themeAppProvider: themeAppProvider,
      ),
    );
  }
}

class WirePainter extends CustomPainter {
  final Offset initialPosition;
  final Offset toOffset;
  final ThemeAppProvider themeAppProvider;

  Paint? _paint;

  WirePainter(
      {required this.initialPosition,
      required this.toOffset,
      required this.themeAppProvider});
  @override
  void paint(Canvas canvas, Size size) {
    _paint = Paint()
      ..color = themeAppProvider.themeMode().switchColor!
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    canvas.drawLine(initialPosition, toOffset, _paint!);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
