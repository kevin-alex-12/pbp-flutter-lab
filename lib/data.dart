import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:flutter/material.dart';

class MyDataPage extends StatefulWidget {
  MyDataPage({super.key, required this.importJudul, required this.importNominal, required this.importTipe});
  List<String> importJudul, importNominal, importTipe;

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Data Budget'),
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  // Menambahkan clickable menu
                  ListTile(
                    title: const Text('counter_7'),
                    onTap: () {
                      // Route menu ke halaman utama
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage(
                          importJudul: widget.importJudul,
                          importNominal: widget.importNominal,
                          importTipe: widget.importTipe,
                        )),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Tambah Budget'),
                    onTap: () {
                      // Route menu ke halaman form
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyFormPage(
                          importJudul: widget.importJudul,
                          importNominal: widget.importNominal,
                          importTipe: widget.importTipe,
                        )),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Data Budget'),
                    onTap: () {
                      // Route menu ke halaman form
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyDataPage(
                          importJudul: widget.importJudul,
                          importNominal: widget.importNominal,
                          importTipe: widget.importTipe,
                      )),
                      );
                    },
                  ),
                ],
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: widget.importJudul.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 3.0)
                          ),
                        ),
                        child: ListTile(
                          tileColor: Colors.white,
                          title: Text(
                            widget.importJudul[index],
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          subtitle: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.importNominal[index],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.importTipe[index],
                                  textAlign: TextAlign.right,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                    );
                }),
            ),
        );
    }
}