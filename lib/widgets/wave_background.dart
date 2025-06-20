import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class WaveBackground extends StatelessWidget {
  const WaveBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: WavePainter(),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primaryBlue,
          AppColors.lightBlue,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();

    // بداية المسار من الزاوية اليسرى العلوية
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);

    // إنشاء الموجة في الأسفل
    path.lineTo(size.width, size.height * 0.7);

    // الموجة الأولى
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.85,
      size.width * 0.5,
      size.height * 0.8,
    );

    // الموجة الثانية
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.75,
      0,
      size.height * 0.85,
    );

    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

