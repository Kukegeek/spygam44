import 'package:flutter/material.dart';
import 'dart:math' as math;

class FortuneWheel extends StatefulWidget {
  final VoidCallback onUse;

  const FortuneWheel({
    super.key,
    required this.onUse,
  });

  @override
  State<FortuneWheel> createState() => _FortuneWheelState();
}

class _FortuneWheelState extends State<FortuneWheel>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<String> _wheelOptions = [
    'Hint',
    'Skip',
    '2x Points',
    'Extra Life',
    'Reveal Letter',
    'No Effect',
  ];

  final List<Color> _wheelColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Fortune Wheel',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Wheel
            SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Wheel
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _animation.value * 2 * math.pi * 3,
                        child: CustomPaint(
                          size: const Size(200, 200),
                          painter: WheelPainter(
                            options: _wheelOptions,
                            colors: _wheelColors,
                          ),
                        ),
                      );
                    },
                  ),

                  // Pointer
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.colorScheme.onPrimary,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Spin Button
            ElevatedButton.icon(
              onPressed: _isSpinning ? null : _spinWheel,
              icon: _isSpinning
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.casino),
              label: Text(_isSpinning ? 'Spinning...' : 'Spin Fortune Wheel'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get _isSpinning => _animationController.isAnimating;

  void _spinWheel() {
    _animationController.reset();
    _animationController.forward().then((_) {
      // Calculate result based on final rotation
      final result = _getSpinResult();
      _showResult(result);
      widget.onUse();
    });
  }

  String _getSpinResult() {
    final segments = _wheelOptions.length;
    final segmentAngle = 2 * math.pi / segments;
    final finalRotation = _animation.value * 2 * math.pi * 3;
    final normalizedRotation = finalRotation % (2 * math.pi);
    final selectedSegment =
        ((2 * math.pi - normalizedRotation) / segmentAngle).floor();

    return _wheelOptions[selectedSegment % segments];
  }

  void _showResult(String result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Fortune Wheel Result'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getResultIcon(result),
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              result,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              _getResultDescription(result),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  IconData _getResultIcon(String result) {
    switch (result) {
      case 'Hint':
        return Icons.lightbulb;
      case 'Skip':
        return Icons.skip_next;
      case '2x Points':
        return Icons.star;
      case 'Extra Life':
        return Icons.favorite;
      case 'Reveal Letter':
        return Icons.visibility;
      default:
        return Icons.sentiment_neutral;
    }
  }

  String _getResultDescription(String result) {
    switch (result) {
      case 'Hint':
        return 'Get a helpful hint for the current word!';
      case 'Skip':
        return 'Skip the current word without penalty!';
      case '2x Points':
        return 'Double points for your next correct answer!';
      case 'Extra Life':
        return 'Gain an additional life in Quick Rounds!';
      case 'Reveal Letter':
        return 'Reveal the first letter of the word!';
      default:
        return 'Better luck next time!';
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class WheelPainter extends CustomPainter {
  final List<String> options;
  final List<Color> colors;

  WheelPainter({
    required this.options,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final segmentAngle = 2 * math.pi / options.length;

    for (int i = 0; i < options.length; i++) {
      final startAngle = i * segmentAngle;
      final paint = Paint()
        ..color = colors[i % colors.length]
        ..style = PaintingStyle.fill;

      // Draw segment
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        segmentAngle,
        true,
        paint,
      );

      // Draw text
      final textAngle = startAngle + segmentAngle / 2;
      final textX = center.dx + math.cos(textAngle) * radius * 0.7;
      final textY = center.dy + math.sin(textAngle) * radius * 0.7;

      final textPainter = TextPainter(
        text: TextSpan(
          text: options[i],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      canvas.save();
      canvas.translate(textX, textY);
      canvas.rotate(textAngle + math.pi / 2);
      textPainter.paint(
          canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
      canvas.restore();

      // Draw border
      final borderPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      canvas.drawLine(
        center,
        Offset(
          center.dx + math.cos(startAngle) * radius,
          center.dy + math.sin(startAngle) * radius,
        ),
        borderPaint,
      );
    }

    // Draw outer circle border
    final outerBorderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawCircle(center, radius, outerBorderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
