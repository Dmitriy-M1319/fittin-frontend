import 'package:fittin_frontend/assets.dart';
import 'package:fittin_frontend/domain/models/answer/answer.dart';
import 'package:fittin_frontend/ui/question_page/view_model/question_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionPageView extends ConsumerWidget {
  const QuestionPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(questionPageProvider);

    return Scaffold(
      body: Container(
        color: LightUiTheme.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Вопрос ${vm.currentQuestion.number}',
                  style: GoogleFonts.getFont(
                    "Montserrat",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                vm.currentQuestion.test,
                textAlign: TextAlign.justify,
                style: GoogleFonts.getFont(
                  "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                spacing: 5.0,
                children: [
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        vm.addAnswer(AnswerVariant.right);
                      },
                      child: Text(
                        'Верно',
                        style: GoogleFonts.getFont(
                          "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        vm.addAnswer(AnswerVariant.wrong);
                      },
                      child: Text(
                        'Неверно',
                        style: GoogleFonts.getFont(
                          "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        vm.addAnswer(AnswerVariant.no_answer);
                      },
                      child: Text(
                        'Не знаю',
                        style: GoogleFonts.getFont(
                          "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
