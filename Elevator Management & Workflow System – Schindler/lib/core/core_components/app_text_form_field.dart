import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.hint,
    this.icon,
    this.keyboardType,
    this.controller,
    this.isPass =  false,
    this.validator,
    this.maxLines,
  });

  final String? hint;
  final Widget? icon;
  final bool isPass;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final int? maxLines;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {

  bool _hidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:.5.vmin),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        obscureText: widget.isPass && _hidden,
        controller: widget.controller,
        validator: widget.validator,
        maxLines: widget.maxLines ?? 1,
        decoration: InputDecoration(
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.5.vmin),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.grey.withOpacity(.5),
          filled: true,
          prefixIcon: widget.icon,
          suffixIcon: widget.isPass ? IconButton(
              onPressed: (){
                _hidden = !_hidden;
                setState(() {});
              },
              icon: Visibility(
                visible: _hidden,
                replacement: Icon(Icons.visibility),
                child: Icon(Icons.visibility_off),
              )
          ):null,
        ),
      ),
    );
  }
}
