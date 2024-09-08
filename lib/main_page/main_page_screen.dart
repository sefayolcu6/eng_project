import 'package:eng_project/category_screens/animals/screen/animals_screen.dart';
import 'package:eng_project/category_screens/animals/animals_view_model/animals_cubit.dart';
import 'package:eng_project/category_screens/clothes/clothes_view_model/clothes_cubit_dart';
import 'package:eng_project/category_screens/clothes/screen/clothes_screen.dart';
import 'package:eng_project/category_screens/colors/colors_view_model/colors_cubit.dart';
import 'package:eng_project/category_screens/colors/screen/colors_screen.dart';
import 'package:eng_project/category_screens/fruits/fruits_view_model/fruits_cubit.dart';
import 'package:eng_project/category_screens/fruits/screen/fruits_screen.dart';
import 'package:eng_project/category_screens/furnitures/furnitures_screen.dart';
import 'package:eng_project/category_screens/furnitures/furnitures_view_model/furnitures_cubit.dart';
import 'package:eng_project/category_screens/jobs/jobs_view_model/jobs_cubit.dart';
import 'package:eng_project/category_screens/jobs/screen/jobs_screen.dart';
import 'package:eng_project/category_screens/plants/plants_view_model/plants_cubit.dart';
import 'package:eng_project/category_screens/plants/screen/plants_screen.dart';
import 'package:eng_project/category_screens/vegetables/screen/vegetables_screen.dart';
import 'package:eng_project/constant/app_constant.dart';
import 'package:eng_project/constant/extensions.dart';
import 'package:eng_project/constant/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(225, 246, 242, 237),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   fixedColor:const Color(0xff2398C3),
      //   showSelectedLabels: true,
      //   showUnselectedLabels: false,
      //   currentIndex: 1,
      //   onTap: (value) {},
      //   items:const [
      //     BottomNavigationBarItem(
      //       label: 'Search',
      //       icon: Icon(Icons.search),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Search',
      //       icon: Icon(Icons.view_list),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Search',
      //       icon: Icon(Icons.view_list),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Search',
      //       icon: Icon(Icons.bookmark),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Search',
      //       icon: Icon(Icons.settings),
      //     ),
      //   ],
      // ),
      appBar: AppBar(
        title: Text(Localization.appBarTitle),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                navigateIndex(index, context);
              },
              child: Card(
                color: cardColorList[index],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      height: context.screenWidth4(),
                      cardImagesList[index].toString(),
                    ),
                    Text(
                      cardTextList[index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppConstant.black,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void navigateIndex(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => AnimalsCubit(),
              child: AnimalsScreen(),
            ),
          ),
        );
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => FurnituresCubit(),
                      child: FurnituresScreen(),
                    )));
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => FruitsCubit(),
                      child: FruitsScreen(),
                    )));
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const VegetablesScreen()));
      case 4:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => PlantsCubit(),
                      child: PlantsScreen(),
                    )));
      case 5:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => ColorsCubit(),
                      child: ColorsScreen(),
                    )));
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => ClothesCubit(),
                    child: ClothesScreen(),
                  )),
        );
      case 7:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => JobsCubit(),
                      child: JobsScreen(),
                    )));

        break;
      default:
    }
  }

  final List<Color> cardColorList = [
    Colors.red.withOpacity(0.7),
    Colors.grey.withOpacity(0.7),
    Colors.pink.withOpacity(0.7),
    Colors.yellow.withOpacity(0.7),
    Colors.grey.withOpacity(0.7),
    Colors.green.withOpacity(0.7),
    Colors.purple.withOpacity(0.7),
    Colors.orange.withOpacity(0.7),
  ];

  final List<String> cardTextList = [
    "Hayvanlar",
    "Eşyalar",
    "Meyveler",
    "Sebzeler",
    "Bitkiler",
    "Renkler",
    "Giysiler",
    "Meslekler",
  ];

  final List<String> cardImagesList = [
    ImageConstant.animals,
    ImageConstant.furniture,
    ImageConstant.fruits,
    ImageConstant.vegetables,
    ImageConstant.plants,
    ImageConstant.colors,
    ImageConstant.clothes,
    ImageConstant.jobs,
  ];
}
