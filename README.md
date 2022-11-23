# Tugas 7

## Jelaskan apa yang dimaksud dengan <i>stateless widget</i> dan <i>stateful widget</i> dan jelaskan perbedaan dari keduanya.

<i>Stateless widget</i> adalah widget yang nilainya tidak bisa diganti setelah diinisialisasi pada awal pembuatan aplikasi (bersifat statis). <br/><br/>
<i>Stateful widget</i> adalah widget yang nilainya masih dapat diganti setelah sebelumnya diinisialisasi bergantung pada aksi yang pengguna lakukan (bersifat dinamis)

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

* MaterialApp, sebagai pengatur segala jenis route serta theme aplikasi yang digunakan
* ThemeData, sebagai konfigurasi tema dasar untuk widget MaterialApp
* MyHomePage, sebagai halaman utama dalam aplikasi
* Scaffold, sebagai material dasar dalam mengatur layout
* AppBar, sebagai petunjuk aplikasi pada bagian atas Scaffold
* Center, sebagai pengatur layout pada aplikasi (menengahkan widget lain)
* Text, untuk menampilkan teks sesuai yang dibutuhkan
* Column, sebagai pengatur layout pada aplikasi juga (secara horizontal)
* Padding, sebagai pengatur posisi widget
* FloatingActionButton, untuk membuat button (decrement and incerement pada aplikasi ini)
* Visibility, untuk mengatur widget agar dapat dilihat atau tidak terlihat
* Align, sebagai pengatur leyout untuk meletakkan widget di dalamnya
* Icon, sebagai memperbagus visual aplikasi

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Untuk memberitahu <i>framework</i> Flutter bahwa terdapat sesuatu yang berubah pada <i>state</i> saat ini sehingga dapat menjalankan <i>build method</i> dan memperbarui tampilan.

## Jelaskan perbedaan antara const dengan final.

* final, nilainya harus diketahui pada saat <i>run-time</i> dan tidak bisa diubah lagi
* const, nilainya harus diketahui pada saat <i>compile-time</i> dan juga tidak bisa diubah

## Jelaskan bagaimana cara kamu mengimplementasikan <i>checklist</i> di atas.

Jalankan dahulu perintah berikut untuk membuat proyek aplikasi sesuai dengan ketentuan soal dan pindah ke folder proyek tersebut
```
flutter create counter_7
cd counter_7
```

Buka main.dart pada direktori lib dan ubah sesuai dengan ketentuan soal seperti berikut<br/><br/>

Mengubah nama aplikasi menjadi Program Counter
```
Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Program Counter'),
    );
  }
}
```

Mengubah logika counter dan menambahkan tombol decrement dan increment untuk mengubah counter. Terdapat juga pengaturan warna untuk teks "GANJIL" dan "GENAP" sesuai dengan ketentuan soal
```
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _angka = 'GENAP';
  bool check = false;
  bool isZero = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      isZero = true;

      if (_counter % 2 == 0) {
        _angka = 'GENAP';
        check = false;
      } else {
        _angka = 'GANJIL';
        check = true;
      }
    });
  }

  void _decrementCounter() {
    setState(() {

      if (_counter == 1) {
        isZero = false;
        _counter--;
      } else {
        _counter--;
      }

      if (_counter % 2 == 0) {
        _angka = 'GENAP';
        check = false;
      } else {
        _angka = 'GANJIL';
        check = true;
      }
    });
  }
  
  ...
  
  Widget build(BuildContext context) {
    return Scaffold(
      
      ...
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_angka',
              style: check
                ? TextStyle(color: Colors.blue)
                : TextStyle(color: Colors.red),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Visibility(
                visible: isZero,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: null,
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
          ],
        )
      ),
    );
  }
}
```

# Tugas 8

## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.

Navigator.push akan mempertahankan route sebelumnya saat memindahkan route ke tujuan baru sedangkan Navigator.pushReplacement akan menghapus route sebelumnya saat berpindah ke route baru.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

Catatan: selain yang digunakan pada halaman counter_7 karena termasuk tugas sebelumnya
* AppBar, sebagai petunjuk aplikasi pada bagian atas Scaffold
* Scaffold, sebagai material dasar dalam mengatur layout
* Column, sebagai pengatur layout pada aplikasi juga (secara horizontal)
* Padding, sebagai pengatur posisi widget
* Text, untuk menampilkan teks sesuai yang dibutuhkan
* Drawer, sebagai menu navigasi pada sisi kiri aplikasi
* ListTile, membuat suatu listuntuk  widget lain
* Navigator, untuk meletakkan halaman pada stack dan berpindah ke halaman baru
* MaterialPageRoute, untuk membuat route halaman yang dituju
* Form, untuk membuat form pada aplikasi
* SingleChildScrollView, agar widget bisa di-scroll
* Container, sebagai wadah untuk meletakkan widget-widget lain
* TextFormField, sebagai input field
* DropdownButton, untuk menampilkan menu dropdown
* TextButton, salah satu widget button
* ListView, untuk menampilkan widget agar bisa di-scroll

## Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).

* onTap
* onPressed
* onKeyEvent

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

Navigator akan menyimpan halaman-halaman tersebut dalam suatu stack, saat ada pemanggilan push, maka halaman yang ingin dibuka akan dimasukkan ke dalam stack tersebut, sebaliknya jika ada pemanggilan pop, halaman saat ini akan dikeluarkan dari stack dan akan menampilkan halaman teratas dalam stack tersebut.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

Pertama, buat dahulu dua file .dart baru sebagai halaman aplikasi yang baru (dalam hal ini, adalah form.dart dan data.dart) setelah itu tambahkan boilerplate untuk setiap file (sesuaikan tulisan MyFormPage dengan nama yang diinginkan, misalnya MyDataPage).
```
class MyFormPage extends StatefulWidget {
    MyFormPage({super.key, required this.importJudul, required this.importNominal, required this.importTipe});
    List<String> importJudul, importNominal, importTipe;

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Form'),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text('Hello World!'),
                    ],
                ),
            ),
        );
    }
}
```

Setelah itu tambahkan drawer untuk setiap file (main.dart, form.dart, dan data.dart) pada lokasi sesuai dengan pembahasan pada sesi Lab 7.
```
...
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
...
```

Untuk file form.dart, tambahkan widget yang sesuai dengan permintaaan tugas. Untuk tugas kali ini, widget yang ditambahkan bisa langsung menuju [link berikut](/lib/form.dart). <br/><br/>

Untuk file data.dart, tambahkan widget yang sesuai dengan permintaaan tugas. Untuk tugas kali ini, widget yang ditambahkan bisa langsung menuju [link berikut](/lib/data.dart).

# Tugas 9

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Sesuai dengan dokumen pada [halaman resmi flutter](https://docs.flutter.dev/cookbook/networking/fetch-data#3-convert-the-response-into-a-custom-dart-object), dapat disimpulkan bahwa data JSON yang pertama kali didapatkan masih tidak dibungkus dalam model sehingga data JSON tersebut dapat diambil tanpa dibuat ke dalam suatu model, tetapi sulit untuk mengolah data tersebut jika tidak dibungkus dalam suatu model.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

Catatan: selain yang digunakan pada halaman counter_7, Tambah Budget, dan Data Budget karena termasuk tugas sebelumnya (hanya mencakup widget untuk Tugas 9)
* AppBar, sebagai petunjuk aplikasi pada bagian atas Scaffold
* Scaffold, sebagai material dasar dalam mengatur layout
* Column, sebagai pengatur layout pada aplikasi juga (secara horizontal)
* Padding, sebagai pengatur posisi widget
* Text, untuk menampilkan teks sesuai yang dibutuhkan
* Drawer, sebagai menu navigasi pada sisi kiri aplikasi
* ListTile, membuat suatu listuntuk  widget lain
* Navigator, untuk meletakkan halaman pada stack dan berpindah ke halaman baru
* MaterialPageRoute, untuk membuat route halaman yang dituju
* Container, sebagai wadah untuk meletakkan widget-widget lain
* ListView, untuk menampilkan widget agar bisa di-scroll
* FutureBuilder, untuk membuat widget berdasarkan interaksi class Future terakhir
* AsyncSnapshot, untuk merepresentasikan interaksi terbaru pada model asinkronus
* Center, sebagai pengatur layout pada aplikasi (menengahkan widget lain)
* CircularProgressIndicator, untuk menampilkan loading data
* TextStyle, untuk melakukan styling pada widget Text
* SizedBox, membuat kotak pada sekeliling widget di dalamnya
* EdgeInsets, untuk membuat offset pada suatu widget
* ClipPath, untuk membuat widget pada sekeliling widget lain
* ShapeBorderClipper, untuk mengatur tampilan disekeliling ClipPath
* RoundedRectangleBorder, membuat ClipPath menjadi kotak
* BorderRadius, agar kotak pada sekeliling widget tidak tajam
* InkWell, agar suatu widget dapat merespons saat di tekan
* BoxDecoration, untuk memperbaiki tampilan kotak
* Border, mengatur sisi pada widget BoxDecoration
* BorderSide, mengatur tampilan sisi pada widget Border
* Checkbox, untuk menampilkan checkbox widget
* RichText, untuk membuat teks dapat memiliki banyak style
* TextSpan, untuk membuat teks pada widget RichText

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.

1. Tambahkan dahulu package http pada flutter agar dapat melakukan fetch data dari internet
2. Pada bagian file AndroidManifest.xml, tambahkan kode berikut agar mengizinkan aplikasi mengakses internet
```
<!-- Required to fetch data from the internet. -->
<uses-permission android:name="android.permission.INTERNET" />
```
3. Membuat request pada file dart melalui class Future sehingga didapatkan data JSON
4. Bungkus data JSON tersebut ke dalam suatu Custom Class sehingga mempermudah pengolahan data tersebut (menggunakan method jsonDecode)
5. Terakhir lakukan fetch data yang ingin diambil pada internet dan simpan ke dalam suatu variable dengan class Future
6. Tampilkan data tersebut menggunakan widget FutureBuilder (disarankan melalui methid initState agar hanya sekali dilakukan pemanggilannya)

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

Pertama, buat custom class terlebih dahulu untuk membungkus data JSON yang diambil sesuai dengan contoh pada Lab 8, custom class tersebut dapat dilihat pada [file berikut](/lib/model/watch_list.dart).<br/><br/>

Buat fungsi fetch data yang sekaligus akan membungkus data JSON ke custom class yang telah dibuat sebelumnya, kode-nya berupa:
```
import 'package:http/http.dart' as http;
import 'model/watch_list.dart';
import 'dart:convert';

Future<List<Watchlist>> fetchWatchlist() async {
  var url = Uri.parse('https://tugas-pbp22.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Watchlist> listWatch = [];
  for (var d in data) {
    if (d != null) {
        listWatch.add(Watchlist.fromJson(d));
    }
  }

  return listWatch;
}
```

Setelah itu, lakukan pemanggilan fetch data tersebut ke dalam variabel Future di halaman yang ditentukan pada soal melalui widget FutureBuilder. Contoh implementasi widget tersebut dapat dilihat pada [file berikut](/lib/mywatchlist.dart)<br/><br/>

Jangan lupa juga untuk menambahkan drawer sebagai navigasi antar halaman sesuai dengan tugas-tugas sebelumnya.<br/><br/>

Terakhir, buat halaman baru yang akan menampilkan detail setiap watchlist, berikut adalah contoh [file tersebut](/lib/detailwatchlist.dart).