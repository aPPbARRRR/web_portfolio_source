import 'package:flutter/material.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton({
    Key? key,
    required this.text,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  final String text;
  final void Function()? onTap;
  final bool isSelected;

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: TextStyle(
          color: widget.isSelected ? Colors.white : Colors.grey,
          overflow: TextOverflow.fade,
        ),
        child: InkWell(
            onTap: widget.onTap,
            child: Text(
              widget.text,
              maxLines: 1,
            )));
  }
}
