##  Jelaskan apa yang dimaksud dengan <i>stateless widget</i> dan <i>stateful widget</i> dan jelaskan perbedaan dari keduanya.

<i>Stateless widget</i> adalah widget yang nilainya tidak bisa diganti setelah diinisialisasi pada awal pembuatan aplikasi (bersifat statis). <br/><br/>
<i>Stateful widget</i> adalah widget yang nilainya masih dapat diganti setelah sebelumnya diinisialisasi bergantung pada aksi yang pengguna lakukan (bersifat dinamis)

##  Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

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

##  Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Untuk memberitahu <i>framework</i> Flutter bahwa terdapat sesuatu yang berubah pada <i>state</i> saat ini sehingga dapat menjalankan <i>build method</i> dan memperbarui tampilan.

##  Jelaskan perbedaan antara const dengan final.

* final, nilainya harus diketahui pada saat <i>run-time</i> dan tidak bisa diubah lagi
* const, nilainya harus diketahui pada saat <i>compile-time</i> dan juga tidak bisa diubah

##  Jelaskan bagaimana cara kamu mengimplementasikan <i>checklist</i> di atas.

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