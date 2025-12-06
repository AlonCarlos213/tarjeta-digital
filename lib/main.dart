import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const TarjetaDigital());
}

class TarjetaDigital extends StatelessWidget {
  const TarjetaDigital({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarjeta Digital',
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomeCard(),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  Future<void> abrir(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'No se pudo abrir $url';
    }
  }

  Widget animado(Widget c) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOut,
      builder: (context, double v, _) {
        return Opacity(
          opacity: v,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - v)),
            child: c,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: Container(
          width: w > 550 ? 420 : w * .9,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF020617),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(.3),
                blurRadius: 30,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              animado(
                CircleAvatar(
                  radius: 55,
                 backgroundImage: const AssetImage('assets/foto.png'),
                ),
              ),
              const SizedBox(height: 15),
                animado(
  const Text(
    'Carlos Mamani',
    style: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: [
        Shadow(
          offset: Offset(0, 2),
          blurRadius: 8,
          color: Colors.black87,
        ),
      ],
    ),
  ),
),


              animado(
                const Text(
                  'Desarrollador de Software',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueAccent,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              animado(
                const Text(
                  'Estudiante TECSUP – Ciclo VI\n'
                  '.NET 9 • Flutter • IA\n'
                  'Desarrollador de StudyMate AI',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 18),

              animado(
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [

                    ElevatedButton.icon(
                      onPressed: () =>
                          abrir('https://www.linkedin.com/in/carlos-alonso-mamani-ccollque-65833029a/'),
                      icon: const Icon(Icons.business),
                      label: const Text('LinkedIn'),
                    ),

                    ElevatedButton.icon(
                      onPressed: () =>
                          abrir('https://github.com/AlonCarlos213'),
                      icon: const Icon(Icons.code),
                      label: const Text('GitHub'),
                    ),

                    ElevatedButton.icon(
                      onPressed: () =>
                          abrir('https://drive.google.com/file/d/11xnYrce-VtzND_Ley19Qu6eDdYXgNcX-/view?usp=sharing'),
                      icon: const Icon(Icons.picture_as_pdf),
                      label: const Text('CV'),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
