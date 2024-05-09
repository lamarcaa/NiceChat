import 'package:flutter/material.dart';
import 'package:niceechat/components/cores.dart';

class MsgRecebida extends StatefulWidget {
  const MsgRecebida({super.key});

  @override
  State<MsgRecebida> createState() => _MsgRecebidaState();
}

class _MsgRecebidaState extends State<MsgRecebida> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: const BoxDecoration(
          color: backgroundEscuro1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(2),
            bottomRight: Radius.circular(15),
          ),
        ),
        height: 40,
        width: 70,
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
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '10:00',
                    style: TextStyle(color: font2, fontSize: 10),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
