import 'package:eng_project/category_screens/plants/plants_view_model/plants_cubit.dart';
import 'package:eng_project/category_screens/plants/plants_view_model/plants_state.dart';
import 'package:eng_project/category_screens/plants/questions.dart';
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

class PlantsScreen extends StatefulWidget {
  const PlantsScreen({super.key});

  @override
  State<PlantsScreen> createState() => _PlantsScreenState();
}

class _PlantsScreenState extends State<PlantsScreen> with ScreenProperties {
  @override
  void initState() {
    plantsCubit = context.read<PlantsCubit>();
    super.initState();
  }

  void nextQuestion(String result) {
    if (PlantsQuestions.questions[currentQuestionIndex]["Result"] == result) {
      correctPiece++;

      isTrueResult = true;
      plantsCubit.refreshState();

      infoFlushbar(context, "TEBRİKLER!!",
          "Doğru Cevap, bir sonraki soruya geçebilirsiniz..");
    } else if (rightToTry == 1) {
      errorFlushbar(context, "UYARI!!",
              "Deneme hakkınız bitti. Ana menüye yönlendiriliyorsunuz..")
          .then(
        (value) => Navigator.pop(context),
      );
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
      floatingActionButton: Row(
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
                      plantsCubit.refreshState();
                      Navigator.pop(context);
                    });
              },
              text: 'Başa Dön'),
          Padding(
            padding: EdgeInsets.only(left: AppConstant.padding10),
            child: FloatingActionButton(
                child: Icon(Icons.arrow_forward_ios_rounded,
                    color: AppConstant.white),
                onPressed: () {
                  if (PlantsQuestions.questions[currentQuestionIndex]
                          ["Index"] ==
                      PlantsQuestions.questions.length) {
                    errorFlushbar(
                        context, "UYARI!!", "Listenin sonuna geldiniz..");

                    appAlertDialog(
                        context: context,
                        alertBody: [
                          Text('Doğru Sayısı: $correctPiece'),
                          Text('Yanlış Sayısı: $wrongPiece'),
                          Text('Deneme Sayısı: ${wrongPiece + correctPiece}'),
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
                          PlantsQuestions.questions.length;
                      isTrueResult = false;
                      plantsCubit.refreshState();
                    } else {
                      errorFlushbar(context, "UYARI!!",
                          "Bu soruyu cevaplamadan yeni soruya geçemezsiniz");
                    }
                  }
                }),
          )
        ],
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
        title: const Text("Bitkiler"),
      ),
      body: BlocBuilder<PlantsCubit, PlantsState>(
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
                      PlantsQuestions.questions[currentQuestionIndex]["Index"]
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
                      PlantsQuestions.questions[currentQuestionIndex]["Image"]
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
                            PlantsQuestions.questions[currentQuestionIndex]
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
                          text: PlantsQuestions.questions[currentQuestionIndex]
                              ["Options"][0],
                        ),
                        appButton(
                          context: context,
                          ontap: () {
                            nextQuestion(OptionsEnum.B.name);
                          },
                          text: PlantsQuestions.questions[currentQuestionIndex]
                              ["Options"][1],
                        ),
                        appButton(
                          context: context,
                          ontap: () {
                            nextQuestion(OptionsEnum.C.name);
                          },
                          text: PlantsQuestions.questions[currentQuestionIndex]
                              ["Options"][2],
                        ),
                        appButton(
                          context: context,
                          ontap: () {
                            nextQuestion(OptionsEnum.D.name);
                          },
                          text: PlantsQuestions.questions[currentQuestionIndex]
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
  late PlantsCubit plantsCubit;
  int currentQuestionIndex = 0;
  int rightToTry = 5;
  bool isTrueResult = false;
  int correctPiece = 0;
  int wrongPiece = 0;
}

enum OptionsEnum { A, B, C, D }
