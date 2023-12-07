import 'package:cbt_exam/core/constants/colors.dart';
import 'package:cbt_exam/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "About Us",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: context.deviceWidth,
          height: context.deviceHeight,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Bacalah instruksi dengan cermat sebelum memulai. Pastikan Anda memahami apa yang diharapkan dalam tes ini, termasuk aturan waktu dan cara menjawab soal-soal.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Saat membaca soal, pastikan Anda memahami inti pertanyaan. Baca soal beberapa kali jika diperlukan untuk memastikan pemahaman Anda",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Tes potensi akademik sering memiliki waktu terbatas, jadi penting untuk mengatur waktu dengan baik. Tentukan berapa waktu yang akan Anda alokasikan untuk setiap pertanyaan atau bagian.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Identifikasi kata kunci dalam soal yang memberikan petunjuk tentang apa yang diperlukan. Misalnya, jika ada pertanyaan 'definisikan,' Anda harus memberikan definisi. Jika ada pertanyaan 'bandingkan,' Anda harus membandingkan.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
