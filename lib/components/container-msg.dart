import 'package:flutter/material.dart';
import 'package:niceechat/chat.dart';
import 'package:niceechat/components/cores.dart';

class Container_Mensage extends StatefulWidget {
  const Container_Mensage({super.key});

  @override
  State<Container_Mensage> createState() => _Container_MensageState();
}

class _Container_MensageState extends State<Container_Mensage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Chat()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    decoration: const BoxDecoration(
                      color: font1,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    // color: Colors.pink,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'nome do caboquin',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: font1),
                        ),
                        Text(
                          'mensagem do caboquin',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: font2),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 4),
              Container(
                width: 70,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '00:00',
                      style: TextStyle(color: font2),
                    ),
                    SizedBox(height: 5),
                    CircleAvatar(
                      backgroundColor: laranja,
                      radius: 10,
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: font1,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
