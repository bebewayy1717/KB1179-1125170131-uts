class Mahasiswa {
  // Properties (atribut)
  String nama;
  String nim;
  String jurusan;
  int angkatan;

  // Constructor
  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.angkatan,
  });

  // Method
  void tampilkanData() {
    print("Nama : $nama");
    print("NIM : $nim");
    print("Jurusan : $jurusan");
    print("Angkatan : $angkatan");
  }
}

class AsistenDosen extends Mahasiswa {
  String mataKuliah;

  AsistenDosen({
    required String nama,
    required String nim,
    required String jurusan,
    required int angkatan,
    required this.mataKuliah,
  }) : super(
          nama: nama,
          nim: nim,
          jurusan: jurusan,
          angkatan: angkatan,
        );

  // Override method
  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Asisten MK : $mataKuliah");
  }
}

// Interface (abstract class)
abstract class Pendaftaran {
  void daftarMatkul(String matkul);
}

class MahasiswaAktif extends Mahasiswa implements Pendaftaran {
  List<String> matkulDiambil = [];

  MahasiswaAktif({
    required String nama,
    required String nim,
    required String jurusan,
    required int angkatan,
  }) : super(
          nama: nama,
          nim: nim,
          jurusan: jurusan,
          angkatan: angkatan,
        );

  @override
  void daftarMatkul(String matkul) {
    matkulDiambil.add(matkul);
    print("$nama berhasil daftar mata kuliah $matkul");
  }

  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Mata kuliah diambil:");
    if (matkulDiambil.isEmpty) {
      print("- Belum ada mata kuliah yang diambil");
    } else {
      for (var mk in matkulDiambil) {
        print("- $mk");
      }
    }
  }
}

void main() {
  print("DATA MAHASISWA");
  var mhs1 = Mahasiswa(
    nama: "Masnur Agoi",
    nim: "101029",
    jurusan: "Informatika",
    angkatan: 2012,
  );
  mhs1.tampilkanData();

  print("DATA ASISTEN DOSEN");
  var asdos = AsistenDosen(
    nama: "Budi Doremi",
    nim: "112256",
    jurusan: "Sistem Informasi",
    angkatan: 2021,
    mataKuliah: "Pemrograman Mobile",
  );
  asdos.tampilkanData();

  print("DATA MAHASISWA AKTIF");
  var mhs2 = MahasiswaAktif(
    nama: "Wahyu Slamet Adi Triyono",
    nim: "181291",
    jurusan: "Teknik Informatika",
    angkatan: 2025,
  );
  mhs2.daftarMatkul("Algoritma");
  mhs2.daftarMatkul("Basis Data");
  mhs2.daftarMatkul("Sistem Pakar");
  mhs2.tampilkanData();

  print("Matkul yang diambil: ${mhs2.matkulDiambil}");
}