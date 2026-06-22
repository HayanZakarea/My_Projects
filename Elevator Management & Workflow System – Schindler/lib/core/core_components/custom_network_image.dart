import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/core/data_state/data_state.dart';
import 'package:elevator_management_app/core/data_state/exception_handler.dart';


class CustomNetworkImage extends StatefulWidget {
  final String url;
  final BoxFit fit;
  const CustomNetworkImage({super.key, required this.url, required this.fit});

  @override
  State<CustomNetworkImage> createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> {

  DataState<Uint8List> _imageState = DataState();

  void _load()async{
    _imageState = await handle(()async{
      var data = await Dio().get(
          widget.url,
        options: Options(responseType: ResponseType.bytes),
      );

      return Uint8List.fromList(data.data);
    });
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return StateComponent(
        state: _imageState,
        onSuccess: (_,data)=> Image.memory(data,fit: widget.fit,)
    );
  }
}
