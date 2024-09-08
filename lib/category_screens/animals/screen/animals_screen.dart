import 'dart:async';
import 'package:eng_project/category_screens/animals/questions.dart';
import 'package:eng_project/category_screens/animals/screen/animals_view_model/animals_cubit.dart';
import 'package:eng_project/category_screens/animals/screen/animals_view_model/animals_state.dart';
import 'package:eng_project/constant/app_constant.dart';
import 'package:eng_project/constant/extensions.dart';
import 'package:eng_project/widgets/alert_dialog.dart';
import 'package:eng_project/widgets/app_button.dart';
import 'package:eng_project/widgets/error_flushbar.dart';
import 'package:eng_project/widgets/info_flushbar.dart';
import 'package:eng_project/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class AnimalsScreen extends StatefulWidget {
  const AnimalsScreen({super.key});

  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> with ScreenProperties {
  @override
  void initState() {
    animalsCubit = context.read<AnimalsCubit>();
    super.initState();
  }

  void nextQuestion(String result) {
    if (AnimalQuestions.questions[currentQuestionIndex]["Result"] == result) {
      correctPiece++;

      isTrueResult = true;

      infoFlushbar(context, "TEBRİKLER!!",
          "Doğru Cevap, bir sonraki soruya geçebilirsiniz..");
      animalsCubit.refreshState();
    } else if (rightToTry == 1) {
      errorFlushbar(context, "UYARI!!",
          "Deneme hakkınız bitti. Ana menüye yönlendiriliyorsunuz..");
      Timer.periodic(const Duration(seconds: 5), (timer) {
        animalsCubit.refreshState();
        Navigator.pop(context);
      });
    } else {
      rightToTry--;
      wrongPiece++;
      errorFlushbar(context, "Tekrar Deneyin!!",
          "Yanlış Cevap. Kalan hakkınız, $rightToTry");
      if (rightToTry == 1) {
        errorFlushbar(context, "UYARI!!",
            "Kalan hakkınız 1, bir sonraki yanlış cevapta ana menüye yönlendirileceksiniz");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(225, 246, 242, 237),
      floatingActionButton: BlocBuilder<AnimalsCubit, AnimalsState>(
        builder: (context, state) {
          if (state is AnimalsDisplay) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                appTextButton(
                    ontap: () {
                      appAlertDialog(
                          context: context,
                          title: "UYARI",
                          alertBody: [
                            const Text(
                                "İlk sorudan tekrar başlamak istediğinize emin misiniz? ")
                          ],
                          buttonText: "Evet",
                          buttonOntap: () {
                            currentQuestionIndex = 0;
                            isTrueResult = false;
                            wrongPiece = 0;
                            correctPiece = 0;

                            Navigator.pop(context);
                            animalsCubit.refreshState();
                          });
                    },
                    text: 'Başa Dön'),
                Padding(
                  padding: EdgeInsets.only(left: AppConstant.padding10),
                  child: FloatingActionButton(
                      child: Icon(Icons.arrow_forward_ios_rounded,
                          color: AppConstant.white),
                      onPressed: () {
                        if (AnimalQuestions.questions[currentQuestionIndex]
                                ["Index"] ==
                            AnimalQuestions.questions.length) {
                          errorFlushbar(
                              context, "UYARI!!", "Listenin sonuna geldiniz..");

                          appAlertDialog(
                              context: context,
                              alertBody: [
                                Text('Doğru Sayısı: $correctPiece'),
                                Text('Yanlış Sayısı: $wrongPiece'),
                                Text(
                                    'Deneme Sayısı: ${wrongPiece + correctPiece}'),
                              ],
                              buttonOntap: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              buttonText: 'Ana Sayfaya Dön',
                              title: 'SONUCUNUZ');
                        } else {
                          if (isTrueResult == true) {
                            currentQuestionIndex = (currentQuestionIndex + 1) %
                                AnimalQuestions.questions.length;
                            isTrueResult = false;
                            animalsCubit.refreshState();
                          } else {
                            errorFlushbar(context, "UYARI!!",
                                "Bu soruyu cevaplamadan yeni soruya geçemezsiniz");
                          }
                        }
                      }),
                )
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            appAlertDialog(
                context: context,
                title: "UYARI!!",
                alertBody: [
                  const Text("Testi sonlandırmak istediğinize emin misiniz?")
                ],
                buttonText: "Evet",
                buttonOntap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                });
          },
          icon: const Icon(Icons.chevron_left),
          color: AppConstant.white,
        ),
        title: const Text("Hayvanlar"),
      ),
      body: BlocBuilder<AnimalsCubit, AnimalsState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(AppConstant.padding8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundColor: AppConstant.darkBlue,
                    child: Text(
                      AnimalQuestions.questions[currentQuestionIndex]["Index"]
                          .toString(),
                      style: TextStyle(color: AppConstant.white),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      fit: BoxFit.contain,
                      height: context.screenWidth15(),
                      width: context.screenWidth15(),
                      AnimalQuestions.questions[currentQuestionIndex]["Image"]
                          .toString(),
                    ),
                    SizedBox(
                      height: context.screenWidth4(),
                      width: context.screenWidth15(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AnimalQuestions.questions[currentQuestionIndex]
                                    ["Name"]
                                .toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppConstant.red),
                          )
                        ],
                      ),
                    ),
                    Wrap(
                      children: [
                        appButton(
                          context: context,
                          ontap: () {
                            nextQuestion(OptionsEnum.A.name);
                          },
                          text: AnimalQuestions.questions[currentQuestionIndex]
                              ["Options"][0],
                        ),
                        appButton(
                          context: context,
                          ontap: () {
                            nextQuestion(OptionsEnum.B.name);
                          },
                          text: AnimalQuestions.questions[currentQuestionIndex]
                              ["Options"][1],
                        ),
                        appButton(
                          context: context,
                          ontap: () {
                            nextQuestion(OptionsEnum.C.name);
                          },
                          text: AnimalQuestions.questions[currentQuestionIndex]
                              ["Options"][2],
                        ),
                        appButton(
                          context: context,
                          ontap: () {
                            nextQuestion(OptionsEnum.D.name);
                          },
                          text: AnimalQuestions.questions[currentQuestionIndex]
                              ["Options"][3],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              isTrueResult
                  ? Lottie.asset(repeat: false, "images/lottie/check.json")
                  : const Center()
            ],
          );
        },
      ),
    );
  }
}

mixin ScreenProperties {
  late AnimalsCubit animalsCubit;
  int currentQuestionIndex = 0;
  int rightToTry = 5;
  bool isTrueResult = false;
  int correctPiece = 0;
  int wrongPiece = 0;
}

enum OptionsEnum { A, B, C, D }
