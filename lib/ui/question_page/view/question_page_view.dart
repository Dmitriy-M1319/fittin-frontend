import 'package:fittin_frontend/assets.dart';
import 'package:fittin_frontend/domain/models/answer/answer.dart';
import 'package:fittin_frontend/ui/question_page/view_model/question_page_view_model.dart';
import 'package:fittin_frontend/ui/result_page/view/result_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionPageView extends ConsumerWidget {
  const QuestionPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(questionPageProvider);

    if (vm.isTestCompleted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ResultPageView()),
        );
      });
    }

    return Scaffold(
      body: Container(
        color: LightUiTheme.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: vm.currentQuestionNumber / vm.totalQuestions,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              minHeight: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _showConfirmAllDialog(context, true, ref),
                    child: Text('Все верно'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[100],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _showConfirmAllDialog(context, false, ref),
                    child: Text('Все неверно'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[100],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Вопрос ${vm.currentQuestion.number + 1}',
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
                vm.currentQuestion.text,
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

  void _showConfirmAllDialog(
    BuildContext context,
    bool allTrue,
    WidgetRef ref,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Подтверждение'),
            content: Text(
              'Вы уверены, что хотите отметить ${allTrue ? 'все ответы как "Верно"' : 'все ответы как "Неверно"'}?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Отмена'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ref.read(questionPageProvider.notifier).answerAll(allTrue);
                },
                child: Text('Подтвердить'),
              ),
            ],
          ),
    );
  }
}
