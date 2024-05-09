import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:niceechat/components/cores.dart';

class MsgEnviada extends StatefulWidget {
  const MsgEnviada({super.key});

  @override
  State<MsgEnviada> createState() => _MsgEnviadaState();
}

class _MsgEnviadaState extends State<MsgEnviada> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: const BoxDecoration(
          color: laranja,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(2),
          ),
        ),
        height: 40,
        width: 90,
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Oi',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '10:00',
                        style: TextStyle(color: font1, fontSize: 10),
                      )),
                  SizedBox(width: 2),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.send, size: 14, color: font1),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
