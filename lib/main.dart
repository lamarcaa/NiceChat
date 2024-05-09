import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:niceechat/chat.dart';
import 'package:niceechat/components/container-msg.dart';
import 'package:niceechat/components/cores.dart';

const List<String> generos = <String>[
  'Masculino',
  'Feminino',
  'Ambos os sexos'
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar e FloatingActionButton',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool filtro = false;
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundEscuro2,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: backgroundEscuro1,
        title: const Text(
          'NiceChat',
          style: TextStyle(fontSize: 22, color: font1),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: font1,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: font1),
            onPressed: () {
              setState(() {
                filtro = !filtro;
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: backgroundEscuro2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(16, 60, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Text("pao"),
                    backgroundColor: Colors.white,
                    foregroundColor: font1,
                    radius: 40,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Nome do caboquin",
                    style: TextStyle(
                      color: font1,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person, color: font1),
                    title: Text("Meu Perfil", style: TextStyle(color: font1)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SwitchListTile(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                        if (isDarkMode) {
                          // Defina as cores do tema escuro
                          // Exemplo:
                          // backgroundEscuro1 = Colors.black;
                          // font1 = Colors.white;
                        } else {
                          // Defina as cores do tema claro
                          // Exemplo:
                          // backgroundEscuro1 = Colors.white;
                          // font1 = Colors.black;
                        }
                      });
                    },
                    secondary: Icon(Icons.brightness_6, color: font1),
                    title: Text(
                      "Tema Escuro",
                      style: TextStyle(color: font1),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.block, color: font1),
                    title: Text("Usuários bloqueados",
                        style: TextStyle(color: font1)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: font1),
                    title:
                        Text("Configurações", style: TextStyle(color: font1)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Divider(height: 0),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.exit_to_app, color: font1),
                      SizedBox(width: 10),
                      Text(
                        "Sair",
                        style: TextStyle(color: font1, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Visibility(
                visible: filtro,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    color: backgroundEscuro1,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            style: TextStyle(color: font1),
                            decoration: InputDecoration(
                              hintText: 'Digite o nome...',
                              hintStyle: TextStyle(color: font2),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: const Icon(Icons.search, color: font2),
                      ),
                    ],
                  ),
                ),
              ),
              Container_Mensage(),
              Container_Mensage(),
              Container_Mensage(),
              Container_Mensage(),
              Container_Mensage(),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _filtro(context);
            },
            child: const Icon(Icons.edit, color: backgroundEscuro1),
            backgroundColor: font2,
            mini: true,
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Chat()),
              );
            },
            child: const Icon(Icons.add, color: font1, size: 30),
            backgroundColor: laranja,
          ),
        ],
      ),
    );
  }

  _filtro(BuildContext context) {
    String dropdownValue = generos.first;
    int _idadeMinima = 18;
    int _idadeMaxima = 30;

    showModalBottomSheet(
      backgroundColor: backgroundEscuro2,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Meus filtros',
                          style: TextStyle(
                              fontSize: 18,
                              color: font1,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$_idadeMinima anos até',
                              style:
                                  const TextStyle(fontSize: 16, color: font2),
                            ),
                            Text(
                              '$_idadeMaxima anos',
                              style:
                                  const TextStyle(fontSize: 16, color: font2),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RangeSlider(
                          min: 18,
                          max: 100,
                          divisions: 100,
                          values: RangeValues(
                              _idadeMinima.toDouble(), _idadeMaxima.toDouble()),
                          onChanged: (RangeValues values) {
                            setState(() {
                              _idadeMinima = values.start.toInt();
                              _idadeMaxima = values.end.toInt();
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Gênero',
                        style: TextStyle(
                            fontSize: 16,
                            color: font2,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 15),
                      DropdownMenu<String>(
                        width: MediaQuery.of(context).size.width * 0.9,
                        initialSelection: generos.first,
                        onSelected: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        dropdownMenuEntries: generos
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                        textStyle: TextStyle(color: font2, fontSize: 14),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Palavra-Chave',
                        style: TextStyle(
                            fontSize: 16,
                            color: font2,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10),
                      Container(
                        constraints: BoxConstraints(maxWidth: 400),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Digite sua cidade, um passatempo ou algo que você procura em outra pessoa...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: font2,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Palavra-Chave',
                          hintStyle: TextStyle(
                              color: font2,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
