import 'main.dart';
import 'data.dart';
import 'package:flutter/material.dart';
import 'form.dart';
import 'detailwatchlist.dart';
import 'fetchdata.dart';
import 'model/watch_list.dart';

class MyWatchList extends StatefulWidget {
    MyWatchList({super.key, required this.importJudul, required this.importNominal, required this.importTipe});
    final List<String> importJudul, importNominal, importTipe;

    @override
    State<MyWatchList> createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchList> {
    Future<List<Watchlist>> dataList = fetchWatchlist();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('My Watch List'),
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
            body: FutureBuilder(
              future: dataList,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return Column(
                      children: const [
                        Text(
                          "Tidak ada Watch List",
                          style: TextStyle(
                              color: Color(0xff59A5D8),
                              fontSize: 20),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index)=> Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ClipPath(
                            clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              )
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyDetailPage(
                                    importJudul: widget.importJudul,
                                    importNominal: widget.importNominal,
                                    importTipe: widget.importTipe,
                                    watched: snapshot.data![index].fields.watched,
                                    title: snapshot.data![index].fields.title,
                                    rating: snapshot.data![index].fields.rating,
                                    releaseDate: snapshot.data![index].fields.releaseDate,
                                    review: snapshot.data![index].fields.review,
                                  )),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(18.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: (snapshot.data![index].fields.watched) ? Color.fromARGB(255, 4, 92, 255) : Color.fromARGB(255, 190, 190, 190),
                                      width: 3.0
                                    )
                                  )
                                ),
                                child: ListTile(
                                  title: Text(
                                    "${snapshot.data![index].fields.title}",
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  trailing: Checkbox(
                                    checkColor: Colors.white,
                                    value: snapshot.data![index].fields.watched,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        snapshot.data![index].fields.watched = value!;
                                      });
                                    },
                                  )
                                )
                              )
                            )
                          )
                        )
                      );
                    }
                  }
              }
          )
        );
    }
}