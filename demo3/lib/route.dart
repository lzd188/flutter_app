import 'package:flutter/material.dart';

/// 一个渐变消失的路由效果
class MyFadeTransitionRoute extends PageRouteBuilder {
  final Widget child;

  MyFadeTransitionRoute(this.child)
      : super(
          //构建页面
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return child;
          },
          // 转移动画构建
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animation, curve: Curves.bounceInOut)),
              child: child,
            );
          },
          //转移时长
          transitionDuration: Duration(seconds: 1),
        );
}

/// 缩放动画效果
class MyScaleRoute extends PageRouteBuilder {
  final Widget child;

  MyScaleRoute(this.child)
      : super(
          //构建页面
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return child;
          },
          // 转移动画构建
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return ScaleTransition(
              scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animation, curve: Curves.fastOutSlowIn)),
              child: child,
            );
          },
          //转移时长
          transitionDuration: Duration(seconds: 1),
        );
}

/// 旋转缩放路由效果
class MyRotateScaleRoute extends PageRouteBuilder {
  final Widget child;

  MyRotateScaleRoute(this.child)
      : super(
          //构建页面
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return child;
          },
          // 转移动画构建
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animation, curve: Curves.fastOutSlowIn)),
              child: ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation, curve: Curves.fastOutSlowIn)),
                child: child,
              ),
            );
          },
          //转移时长
          transitionDuration: Duration(seconds: 1),
        );
}

/// 左右滑动转换效果
class MySlideRoute extends PageRouteBuilder {
  final Widget child;

  MySlideRoute(this.child)
      : super(
          //构建页面
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return child;
          },
          // 转移动画构建
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position:
                  Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                      .animate(CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              )),
              child: child,
            );
          },
          //转移时长
          transitionDuration: Duration(seconds: 1),
        );
}
