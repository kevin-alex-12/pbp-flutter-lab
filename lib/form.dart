import 'package:counter_7/main.dart';
import 'package:counter_7/data.dart';
import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  MyFormPage({super.key, required this.importJudul, required this.importNominal, required this.importTipe});
  List<String> importJudul, importNominal, importTipe;

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String judulKegiatan = "";
  int nominal = 0;
  String tipeBudget = "Pemasukan";
  List<String> listtipeBudget = ['Pemasukan', 'Pengeluaran'];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            title: Text('Form Budget'),
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Membeli Makan",
                        labelText: "Judul",                        
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik 
                      onChanged: (String? value) {
                        setState(() {
                            judulKegiatan = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                            judulKegiatan = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return 'Judul tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "15000",
                        labelText: "Nominal",
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik 
                      onChanged: (String? value) {
                        setState(() {
                            nominal = int.parse(value!);
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                            nominal = int.parse(value!);
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return 'Nominal tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  DropdownButton(
                    value: tipeBudget,
                    items: listtipeBudget.map((String items) {
                    return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                    );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                          tipeBudget = newValue!;
                      });
                    },
                  ),
                  TextButton(
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.importJudul.add(judulKegiatan);
                        widget.importNominal.add(nominal.toString());
                        widget.importTipe.add(tipeBudget);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: Container(
                                child: ListView(
                                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Center(child: const Text('Berhasil Menambahkan Data')),
                                    SizedBox(height: 20),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Kembali'),
                                    ), 
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}