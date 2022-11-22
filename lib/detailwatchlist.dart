import 'main.dart';
import 'form.dart';
import 'mywatchlist.dart';
import 'data.dart';
import 'package:flutter/material.dart';

class MyDetailPage extends StatefulWidget {
  MyDetailPage({
    super.key,
    required this.importJudul,
    required this.importNominal,
    required this.importTipe,
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review});
  List<String> importJudul, importNominal, importTipe;
  final bool watched;
  final String title;
  final int rating;
  final DateTime releaseDate;
  final String review;

  @override
  State<MyDetailPage> createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Detail'),
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
                  ListTile(
                    title: const Text('My Watch List'),
                    onTap: () {
                      // Route menu ke halaman form
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyWatchList(
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
            // tinggal edit sxesuai ketentuan soal
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center (
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                    textAlign: TextAlign.center,
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 7.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Release Date: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: (widget.releaseDate).toString().substring(0,10)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 7.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Rating: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: (widget.rating.toDouble().toString()) + "/5"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 7.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Status: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: widget.watched ? "watched" : "not watched"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    "Review:",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    widget.review,
                    style: const TextStyle(fontSize: 15.0)
                  ),
                ),
              ],
            ),
            floatingActionButton: TextButton(
              child: const Text(
                "Back",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                Navigator.pop(context);
              }
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            );
    }
}