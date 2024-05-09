import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:niceechat/components/cores.dart';
import 'package:niceechat/components/msg-enviada.dart';
import 'package:niceechat/components/msg-recebida.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundEscuro1,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: font1, size: 18),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            GestureDetector(
              child: CircleAvatar(
                radius: 20,
                backgroundColor: font1,
              ),
              onTap: () {
                PerfilBottomSheet(context);
              },
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                PerfilBottomSheet(context);
              },
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome do peão',
                    style: TextStyle(
                        fontSize: 16,
                        color: font1,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(fontSize: 12, color: font2),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.more_vert, color: font1),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: backgroundEscuro2,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    reverse: true,
                    child: const Column(
                      children: [
                        SizedBox(height: 20),
                        MsgRecebida(),
                        const SizedBox(height: 20),
                        MsgEnviada(),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: backgroundEscuro1,
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundEscuro2,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 40,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: TextField(
                            style: TextStyle(color: font1),
                            controller: _textController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              hintText: 'Digite sua mensagem...',
                              hintStyle: TextStyle(color: font2),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.photo,
                                    size: 25, color: font2),
                                onPressed: () {
                                  // Adicione a lógica para anexar um arquivo
                                },
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.mic,
                                        size: 25, color: font2),
                                    onPressed: () {
                                      // Adicione a lógica para gravar áudio
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        // Adicione a lógica para enviar a mensagem
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: backgroundEscuro2,
                        ),
                        child: const Icon(Icons.send, size: 20, color: laranja),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void PerfilBottomSheet(BuildContext context) {
  List<String> images = [
    'https://images.pexels.com/photos/2829579/pexels-photo-2829579.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/1851261/pexels-photo-1851261.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/6801642/pexels-photo-6801642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];

  showModalBottomSheet(
    context: context,
    backgroundColor: backgroundEscuro1,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 400,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: images.map((String url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          url,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Nome do caboco',
                    style: TextStyle(
                        fontSize: 18,
                        color: font1,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              _buildInfoRow(Icons.cake, 'Idade: 25 anos'),
              _buildInfoRow(Icons.accessibility_new, 'Sexo: Masculino'),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildInfoRow(IconData icon, String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: <Widget>[
        Icon(
          icon,
          size: 24,
          color: Colors.grey[600],
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(fontSize: 14, color: font1),
        ),
      ],
    ),
  );
}

void main() {
  runApp(const MaterialApp(
    home: Chat(),
  ));
}
