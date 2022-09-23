// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input(
      {Key key,
      this.iconMotion,
      this.suffixIcon,
      this.labelText,
      this.passwordVisible,
      this.onHandlePass,
      this.onChange})
      : super(key: key);
  final IconData iconMotion;
  final IconData suffixIcon;
  final String labelText;
  final bool passwordVisible;
  final bool onHandlePass;
  final Function(String) onChange;
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible =
        (widget.passwordVisible != null ? widget.passwordVisible : true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: _passwordVisible != null ? !_passwordVisible : false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: (value) {
        widget.onChange(value.replaceAll(" ", ""));
      },
      style: const TextStyle(color: Colors.grey, fontFamily: 'Ubuntu'),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: widget.labelText,
        labelStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Color(0xffFFD60A),
              width: 2,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Color(0xffFFD60A),
            width: 2,
          ),
        ),
        contentPadding:
            const EdgeInsets.only(top: 20), // add padding to adjust text
        isDense: true,
        prefixIcon: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 5, right: 0, bottom: 15),
          child: SizedBox(
            height: 4,
            child: Icon(
              widget.iconMotion,
              color: Colors.grey,
            ),
          ),
        ),
        suffixIcon: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 5, right: 0, bottom: 15),
          child: SizedBox(
              height: 4,
              child: InkWell(
                onTap: () {
                  if (widget.onHandlePass) {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  }
                },
                child: Icon(
                  widget.suffixIcon,
                  color:
                      _passwordVisible ? const Color(0xff003566) : Colors.grey,
                ),
              )),
        ),
      ),
    );
  }
}
