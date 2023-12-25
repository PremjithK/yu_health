import 'package:flutter/material.dart';

enum PageTransitionType {
  slideLeft,
  slideRight,
  circularReveal,
  other,
}

class TransitionedRoute extends PageRouteBuilder {
  final PageTransitionType? transitionType;
  final Duration? duration;
  final Curve curve;
  final Widget page;

  TransitionedRoute({
    this.transitionType,
    this.duration,
    this.curve = Curves.ease,
    required this.page,
  }) : super(
          transitionDuration: duration ?? Durations.long3,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            switch (transitionType) {
              case PageTransitionType.slideLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: child,
                );
              case PageTransitionType.slideRight:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: child,
                );

              default:
                // Default to a simple fadeIn transition
                return FadeTransition(
                  opacity: Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: child,
                );
            }
          },
        );
}
