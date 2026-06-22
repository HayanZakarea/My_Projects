import 'package:flutter/material.dart';
import 'package:elevator_management_app/core/data_state/data_state.dart';

class StateComponent<T> extends StatelessWidget {
  const StateComponent(
      {super.key,
      required this.state,
      required this.onSuccess,
      this.onFail,
      this.onLoading,
      this.onInit});

  final DataState<T> state;
  final Widget Function(BuildContext, T) onSuccess;
  final Widget Function(BuildContext, String)? onFail;
  final WidgetBuilder? onLoading;
  final WidgetBuilder? onInit;

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case DataStatus.success:
        return onSuccess(context, state.data!);
      case DataStatus.fail:
        return onFail?.call(context, state.message) ??
            Center(
              child: Text(state.message),
            );
      case DataStatus.loading:
        return onLoading?.call(context) ??
            const Center(
              child: CircularProgressIndicator(),
            );
      case DataStatus.init:
        return onInit?.call(context) ??
            const Center(
              child: CircularProgressIndicator(),
            );
    }
  }

  static Widget sliver<T>(
      {Key? key,
      required DataState<T> state,
      required Widget Function(BuildContext, T) onSuccess,
      Widget Function(BuildContext, String)? onFail,
      WidgetBuilder? onLoading,
      WidgetBuilder? onInit}) {
    return Builder(builder: (context) {
      switch (state.status) {
        case DataStatus.success:
          return onSuccess(context, state.data!);
        case DataStatus.fail:
          return SliverToBoxAdapter(
            child: onFail?.call(context, state.message) ??
                Center(
                  child: Text(state.message),
                ),
          );
        case DataStatus.loading:
          return SliverToBoxAdapter(
            child: onLoading?.call(context) ??
                const Center(
                  child: CircularProgressIndicator(),
                ),
          );
        case DataStatus.init:
          return SliverToBoxAdapter(
            child: onInit?.call(context) ??
                const Center(
                  child: CircularProgressIndicator(),
                ),
          );
      }
    });
  }
}
