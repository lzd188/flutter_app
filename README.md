# flutter_app_demos
参考教程：http://jspang.com/posts/2019/02/22/flutterdemo.html
## demo1

底部导航栏小实例，通过底部导航栏来完成页面之间的跳转。涉及到的知识点：

- Scaffod控件作为脚手架，搭建单个页面的显示框架
- BottomNavigationBar控件填充bottomNavigationBar

## demo2

不规则导航栏的小实例，将FloatingActionButton与底部导航栏进行融合。涉及到的知识点：

- FloatingActionButton的使用，以及其位置的设置
- BottomAppBar通过设置shape来确定底部导航栏的不规则形状

## demo3

四种页面跳转路由效果。涉及到的知识点：

- 自定义路由效果都要继承PageRouteBuilder，重写其中的属性：pageBuilder构建页面和transitionsBuilder构建路由动画等，
- 动画效果用Tween进行数值变化

- 渐变路由：FadeTransition
- 缩放动画效果路由：ScaleTransition
- 旋转缩放路由：RotationTransition和ScaleTransition的叠加
- 滑动动画路由：SlideTransition

## demo4

毛玻璃效果。就是将一层模糊的矩形覆盖在一张图片上面，对背景进行过滤。

- BackdropFilter
- ImageFilter.blur

## demo5

保持选项卡中的页面状态。选项卡切换页面之后，被切换的页面的状态能够保持，不进行页面销毁。

- TabController和Tab实现选项卡的页面效果
- with AutomaticKeepAliveClientMixin就能保持页面的状态

## demo6

搜索框。

- 继承SearchDelegate

## demo7

wrap流式布局

- Wrap

## demo8

可折叠的控件和可折叠的控件列表

- ExpansionTile
- ExpansionPanelList

## demo9

贝塞尔曲线

- Path
- quadraticBezierTo二次贝塞尔曲线，由控制点和结束点两个点决定

## demo10

闪屏动画

- AnimationController
- Animation

## demo11

可拖拽控件

- Draggable包裹下的控件，就是可以拖拽的

  - data:传递的信息，可由DragTarget控件接收

  - feedback：拖拽过程中显示的控件样式

  - 还有一些回调函数

    ```dart
    onDragStarted,
    onDraggableCanceled,
    onDragEnd,
    onDragCompleted,
    ```

- DragTarget

