import 'package:flutter/material.dart';

class Roundbtn extends StatefulWidget {
  final String title;
  final VoidCallback ontap;
  const Roundbtn({Key? key,
    required this.title,required this.ontap}) : super(key: key);

  @override
  State<Roundbtn> createState() => _RoundbtnState();
}

class _RoundbtnState extends State<Roundbtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.ontap,
      child: Container(
          height: MediaQuery.of(context).size.height*0.05,
          width: MediaQuery.of(context).size.width*1,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.redAccent,
          ),
          child: Center(child: Text(widget.title,style: TextStyle(color: Colors.white),))
      ),

    );
  }
}
