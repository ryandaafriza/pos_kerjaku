import 'package:flutter/material.dart';
import 'package:pos_kerjaku/utils/poppins_text.dart';
import '../theme.dart';

class ButtonIcon extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isActive;
  final void Function() onTap;

  const ButtonIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.isActive = false,
  });

  @override
  _ButtonIconState createState() => _ButtonIconState();
}

class _ButtonIconState extends State<ButtonIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 10),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.grey[300],
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        setState(() {
          isPressed = true;
        });
        _controller.forward().then((_) {
          Future.delayed(const Duration(milliseconds: 10), () {
            setState(() {
              isPressed = false;
            });
            _controller.reverse();
          });
        });
      },
      onLongPress: () {
        setState(() {
          isPressed = true;
        });
        _controller.forward();
      },
      onLongPressUp: () {
        setState(() {
          isPressed = false;
        });
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: _colorAnimation.value,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  widget.icon,
                  color:
                      widget.isActive ? gradientGreenStart : Color(0xff828487),
                ),
                const SizedBox(width: 8),
                Poppins.regular(
                  text: widget.text,
                  color:
                      widget.isActive ? gradientGreenStart : Color(0xff828487),
                  fontWeight:
                      widget.isActive ? FontWeight.bold : FontWeight.w400,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ButtonIconCol extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isActive;
  final void Function() onTap;

  const ButtonIconCol({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.isActive = false,
  });

  @override
  _ButtonIconColState createState() => _ButtonIconColState();
}

class _ButtonIconColState extends State<ButtonIconCol>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 10),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: gradientGreenStart,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        setState(() {
          isPressed = true;
        });
        _controller.forward().then((_) {
          Future.delayed(const Duration(milliseconds: 10), () {
            setState(() {
              isPressed = false;
            });
            _controller.reverse();
          });
        });
      },
      onLongPress: () {
        setState(() {
          isPressed = true;
        });
        _controller.forward();
      },
      onLongPressUp: () {
        setState(() {
          isPressed = false;
        });
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            decoration: BoxDecoration(
              color: widget.isActive ? gradientGreenStart : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  widget.icon,
                  color: widget.isActive ? Colors.white : Color(0xff828487),
                  size: 28,
                ),
                const SizedBox(height: 2),
                Poppins.regular(
                  text: widget.text,
                  fontSize: 12,
                  color: widget.isActive ? Colors.white : Color(0xff828487),
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
