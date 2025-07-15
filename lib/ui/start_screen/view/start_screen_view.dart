import 'package:fittin_frontend/assets.dart';
import 'package:fittin_frontend/ui/question_page/view/question_page_view.dart';
import 'package:fittin_frontend/ui/result_page/view/result_page_view.dart';
import 'package:fittin_frontend/ui/start_screen/view_model/start_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreenView extends StatelessWidget {
  const IntroScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: LightUiTheme.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Центральный текст
            Center(
              child: Text(
                'Fittin MMPI Test',
                style: GoogleFonts.getFont(
                  "Montserrat",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Гибкий спейсер, который занимает всё доступное пространство
            const Spacer(),

            // Кнопка внизу экрана
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity, // Растягиваем на всю ширину
                height: 50, // Фиксированная высота
                child: ElevatedButton(
                  onPressed: () {
                    // Действие при нажатии
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text('Кнопка нажата!')),
                    // );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const StartTestScreenView(),
                      ),
                    );
                  },
                  child: Text(
                    'Далее',
                    style: GoogleFonts.getFont(
                      "Montserrat",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StartTestScreenView extends ConsumerWidget {
  const StartTestScreenView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(startScreenProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightUiTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Инструкция',
          style: GoogleFonts.getFont(
            "Montserrat",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: LightUiTheme.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    Text(
                      testInstruction,
                      style: GoogleFonts.getFont(
                        "Montserrat",
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    vm.startTest();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => QuestionPageView()),
                      //MaterialPageRoute(builder: (_) => ResultPageView()),
                    );
                  },
                  child: Text(
                    'Начать тест',
                    style: GoogleFonts.getFont(
                      "Montserrat",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
