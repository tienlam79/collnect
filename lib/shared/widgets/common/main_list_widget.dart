import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/flavor_config.dart';
import 'package:omny_business/shared/constants/common.dart';

class MainListWidget extends StatefulWidget {
  final child;
  final String titleText;
  final Widget? title;
  final IconData backIcon;
  final void Function()? callback;
  final bool showBackIcon;
  final List<Widget>? actions;
  final bool centerTitle;
  final TextStyle? titleStyle;
  final Widget? bottomNavigationBar;
  final bool isCustomScrollView;
  final EdgeInsets bodyPadding;
  final bool scrollable;
  final Widget? footer;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final Color? appBarBackgroundColor;
  final double? elevation;
  final double? titleSpacing;
  final bool extendBodyBehindAppBar;
  MainListWidget({
    required this.child,
    this.titleText = '',
    this.backIcon = Icons.arrow_back,
    this.callback,
    this.showBackIcon = true,
    this.actions,
    this.centerTitle = false,
    this.titleStyle,
    this.bottomNavigationBar,
    this.isCustomScrollView = false,
    this.bodyPadding = const EdgeInsets.all(CommonConstants.hPadding),
    this.title,
    this.scrollable = true,
    this.footer,
    this.resizeToAvoidBottomInset,
    this.backgroundColor,
    this.appBarBackgroundColor,
    this.elevation,
    this.titleSpacing,
    this.extendBodyBehindAppBar = false,
  });

  @override
  State<MainListWidget> createState() => _MainListWidgetState();
}

class _MainListWidgetState extends State<MainListWidget> {
  ScrollController _scrollController = ScrollController();
  GlobalKey widgetKey = GlobalKey();
  late Offset widgetOffset;
  late double _currentPosition;
  double opacity = 0;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    _currentPosition = _scrollController.offset;

    if (100 > _currentPosition && _currentPosition > 1) {
      setState(() {
        opacity = _currentPosition / 100;
      });
    } else if (_currentPosition > 100 && opacity != 1) {
      setState(() {
        opacity = 1;
      });
    } else if (_currentPosition <= 0 && opacity != 0) {
      setState(() {
        opacity = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.bottomNavigationBar,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      backgroundColor: widget.backgroundColor,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      appBar: AppBar(
        elevation: widget.elevation,
        centerTitle: widget.centerTitle,
        automaticallyImplyLeading: false,
        titleSpacing: widget.titleSpacing,
        backgroundColor: widget.appBarBackgroundColor,
        leading: widget.showBackIcon
            ? IconButton(
                icon: Icon(
                  widget.backIcon,
                  color: Colors.black,
                ),
                onPressed: () {
                  if (widget.callback != null) {
                    widget.callback!();
                  } else {
                    Get.back(result: 'success');
                  }
                },
              )
            : null,
        actions: widget.actions,
        title: widget.titleText != ''
            ? Text(
                widget.titleText,
                style: widget.titleStyle,
              )
            : widget.title,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Container(
                padding: widget.bodyPadding,
                child: widget.isCustomScrollView
                    ? CustomScrollView(
                        slivers: widget.child,
                        clipBehavior: Clip.none,
                        shrinkWrap: true,
                        controller: _scrollController,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                      )
                    : (widget.scrollable
                        ? SingleChildScrollView(
                            child: widget.child,
                            clipBehavior: Clip.none,
                            controller: _scrollController,
                            // shrinkWrap: true,
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                          )
                        : widget.child),
              ),
            ),
          ),
          if (widget.footer != null)
            Container(
              child: widget.footer,
              padding: const EdgeInsets.fromLTRB(CommonConstants.hPadding, 0,
                  CommonConstants.hPadding, CommonConstants.hPadding),
            ),
        ],
      ),
    );
  }
}
