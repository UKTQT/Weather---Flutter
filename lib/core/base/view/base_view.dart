import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback? onDispose;
  final Widget Function(BuildContext context, T value)? onPageBuilder;

  const BaseView(
      {Key? key,
      required this.viewModel,
      required this.onModelReady,
      this.onDispose,
      this.onPageBuilder})
      : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) widget.onModelReady(widget.viewModel);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder!(context, widget.viewModel);
  }
}
