# Aplikasi Daftar Ulang Siswa Baru

Akhirnya selesai juga membuat aplikasi pertama saya menggunakan framework RoR (Rub on Rails).

Terima kasih saya ucapkan kepada Mas Agung Setiawan selaku pemilik [IDRails.com](http://www.idrails.com/) atas tutorial-tutorialnya tentang Ruby on Rails serta online course batch, sehingga saya dapat membuat aplikasi ini, ditunggu juga Ebook nya tentang RoR hehehe....

Meskipun masih banyak bug dalam aplikasi yang buat hehehe ...
Mohon maaf jika codingnya masih acak-acakan, maklum masih newbie...

Jika ada yang ingin mengembangkan aplikasi ini lebih lanjut sok silahkan aja.

### Tahap Instalasi

Oke langsung aja cara instalasi aplikasi ini :

* Clone terlebih dahulu aplikasi ini atau download di menu Clone or Download.
```
git clone https://github.com/zaychoer/dfulang.git
```
* Simpan dalam folder project anda.
* Kemudian jalankan bundle.
```
bundle
```
* Jika terjadi error config.key, silahkan uncomment confg.key yang terletak di config/initializers/devise.rb.
* Jangan lupa setting database telebih dahulu, sesuaikan username dan password database anda terlebih dahulu yang terletak di config/database.yml
* Jalankan rake db:create
```
rake db:create
```
* Kemudian rake db:migrate
```
rake db:migrate
```
* Kemudian import database user yang ada dalam projek ini.
```
Email : admin@admin.com
Password : rahasia
```
* Setelah itu lakukan rake db:seed untuk mengenerate dummy data siswa
```
rake db:seed
```
* Selamat anda telah berhasil menjalankan Aplikasi Daftar Ulang Siswa Baru
* Silahkan lakukan customisasi sesuai keinginan anda. *Happy Coding*

### Fitur
* CRUD
* Export dan Import File CSV
* Export ke PDF
* Datatables
* Bootstraps
* Form Validation

## Authors

* **Zayyana Khoir** 

Jika ada pertanyaan silahkan email ke [zaycho_89@yahoo.com] 

## Referensi
* [IDRails.com](http://www.idrails.com/)
* [Stackoverflow](https://stackoverflow.com/)
* [Drifting Ruby: Ruby on Rails Screencasts for Web Developers](https://www.driftingruby.com/)
* [Youtube](https://www.youtube.com/)
* [Belajar Ruby on Rails](http://www.belajarrubyonrails.com)
* Lain-lainnya [Mbah Google](https://www.google.com)

